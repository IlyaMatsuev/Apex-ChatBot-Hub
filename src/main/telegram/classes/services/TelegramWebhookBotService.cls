// TODO: Rename to TelegramBotWebhookService
public class TelegramWebhookBotService extends WebhookBotService {
    @TestVisible
    private TelegramWebhookBotService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        ValueMap payload = new ValueMap()
            .set('url', webhookUrl)
            .set('allowed_updates', new List<String> { TelegramBotUpdateEventType.Message.name() })
            .set('secret_token', bot.TokenHash__c);
        calloutService.call(TelegramBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        calloutService.call(TelegramBotMethod.DeleteWebhook, new ValueMap().set('drop_pending_updates', true));
    }
}
