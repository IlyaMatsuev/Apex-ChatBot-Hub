public abstract class WebhookBotService extends BotService {
    protected String webhookUrl { get { return BotUtils.getApiUrl() + type + '/' + bot.Id; } }

    public WebhookBotService(Bot__c bot) {
        super(bot);
    }

    public abstract void setWebhook();
    public abstract void unsetWebhook();
}
