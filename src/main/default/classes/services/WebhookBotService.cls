public abstract class WebhookBotService extends BotService {
    public WebhookBotService(Bot__c bot) {
        super(bot);
    }

    public abstract void setWebhook();
    public abstract void unsetWebhook();
}
