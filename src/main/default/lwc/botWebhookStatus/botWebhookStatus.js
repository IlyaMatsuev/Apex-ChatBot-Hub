import { LightningElement, api } from 'lwc';
import getWebhookStatus from '@salesforce/apex/BotWebhookStatusController.getWebhookStatus';
import resetWebhook from '@salesforce/apex/BotWebhookStatusController.resetWebhook';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import LightningConfirm from 'lightning/confirm';

const WebhookStatus = Object.freeze({
    Loading: Symbol('loading'),
    Success: Symbol('success'),
    Warning: Symbol('warning'),
    Error: Symbol('error')
});

const WEBHOOK_INFO_MAX_POLL_TRY = 2;
const WEBHOOK_INFO_POLL_TIMEOUT = 2000;

export default class BotWebhookStatus extends LightningElement {
    @api
    recordId;
    rendered = false;
    status = WebhookStatus.Success;
    previousStatus = WebhookStatus.Loading;

    labels = {
        title: 'Webhook Status',
        refreshInfoButtonLabel: 'Refresh',
        refreshWebhookErrorTitle: 'Error refreshing webhook details',

        resetWebhookButtonLabel: 'Reset',
        resetWebhookConfirmHeader: 'Reset Webhook',
        resetWebhookWarning:
            'Are you sure you want to reset webhooks for the bot? This will prevent receiving webhooks for the bot with the same token on other orgs.',
        resetWebhookSuccessTitle: 'Webhooks have been set',
        resetWebhookErrorTitle: 'Error resetting webhooks'
    };

    get isLoading() {
        return this.status === WebhookStatus.Loading;
    }

    get statusIcon() {
        if (this.isLoading) {
            return {};
        }
        const status = this.status.description;
        return {
            title: status[0].toUpperCase() + status.slice(1),
            variant: status,
            name: `utility:${status}`
        };
    }

    get statusTitle() {
        if (this.status === WebhookStatus.Success) {
            return 'Everything is set';
        } else if (this.status === WebhookStatus.Warning) {
            return 'Webhook is set to a different URL';
        } else if (this.status === WebhookStatus.Error) {
            return 'Webhook is not set';
        }
        return '';
    }

    async renderedCallback() {
        if (!this.rendered) {
            this.rendered = true;
            await this.onRefreshStatus();
        }
    }

    setStatus(status) {
        this.previousStatus = this.status;
        this.status = status;
        const statusInfoContainer = this.template.querySelector('div.status-info');
        statusInfoContainer.classList.remove(`status-${this.previousStatus.description}`);
        statusInfoContainer.classList.add(`status-${this.status.description}`);
    }

    async getWebhookStatus() {
        try {
            let webhook;
            for (let i = 0; i < WEBHOOK_INFO_MAX_POLL_TRY; i++) {
                await this.timeout(WEBHOOK_INFO_POLL_TIMEOUT);
                webhook = await getWebhookStatus({ botId: this.recordId });
                if (webhook.isCorrectUrl) {
                    return WebhookStatus.Success;
                }
            }
            return webhook.isNotSet ? WebhookStatus.Error : WebhookStatus.Warning;
        } catch (error) {
            this.toast(this.labels.refreshWebhookErrorTitle, error.message, 'error');
            return WebhookStatus.Error;
        }
    }

    async onRefreshStatus() {
        this.setStatus(WebhookStatus.Loading);
        await this.getWebhookStatus().then(status => this.setStatus(status));
    }

    async onResetWebhook() {
        const result = await LightningConfirm.open({
            label: this.labels.resetWebhookConfirmHeader,
            message: this.labels.resetWebhookWarning,
            variant: 'header',
            theme: 'warning'
        });
        if (result) {
            this.setStatus(WebhookStatus.Loading);
            await resetWebhook({ botId: this.recordId })
                .then(() => this.toast(this.labels.resetWebhookSuccessTitle, '', 'success'))
                .then(() => this.onRefreshStatus())
                .catch(error => this.toast(this.labels.resetWebhookErrorTitle, error.message, 'error'));
        }
    }

    timeout(ms) {
        return new Promise(resolve => setTimeout(() => resolve(), ms));
    }

    toast(title, message, type) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: type
            })
        );
    }
}
