import { api, LightningElement } from 'lwc';
import resetWebhook from '@salesforce/apex/BotResetWebhookActionController.resetWebhook';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';

export default class ResetWebhookAction extends LightningElement {
    @api
    recordId;
    isLoading = false;

    labels = {
        header: 'Reset Webhook',
        cancelButton: 'Cancel',
        confirmButton: 'Confirm',
        resetWebhookWarning: `Are you sure you want to reset webhooks for the bot? This will prevent receiving webhooks for the bot with the same token on other orgs.`,
        resetWebhookSuccessTitle: 'Webhooks have been set',
        resetWebhookErrorTitle: 'Error resetting webhooks'
    };

    handleCancel() {
        this.dispatchEvent(new CloseActionScreenEvent());
    }

    handleConfirm() {
        this.isLoading = true;
        resetWebhook({ botId: this.recordId })
            .then(() => this.toast(this.labels.resetWebhookSuccessTitle, '', 'success'))
            .catch(error => this.toast(this.labels.resetWebhookErrorTitle, error.message, 'error'))
            .finally(() => this.handleCancel());
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
