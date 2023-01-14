public class TelegramWebhookBotService extends WebhookBotService {
    public TelegramWebhookBotService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        ValueMap payload = new ValueMap()
            .set('url', webhookUrl)
            .set('allowed_updates', new List<String> { TelegramBotUpdateEventType.Message.name() })
            .set('secret_token', bot.TokenHash__c);
        call(TelegramBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        call(TelegramBotMethod.DeleteWebhook, new ValueMap().set('drop_pending_updates', true));
    }

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setEndpoint(settings.ApiUrl__c + bot.Token__c + '/' + method);
        return request;
    }
}
