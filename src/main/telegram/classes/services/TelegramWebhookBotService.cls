public class TelegramWebhookBotService extends WebhookBotService {
    public TelegramWebhookBotService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        String webhookUrl = BotUtils.getApiUrl() + bot.Type__c + '/' + bot.Id;
        ValueMap payload = new ValueMap()
            .set('url', webhookUrl)
            .set('allowed_updates', new List<String> { 'message' })
            .set('secret_token', bot.TokenHash__c);
        call(TelegramBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        call(TelegramBotMethod.DeleteWebhook, new ValueMap().set('drop_pending_updates', true));
    }
}
