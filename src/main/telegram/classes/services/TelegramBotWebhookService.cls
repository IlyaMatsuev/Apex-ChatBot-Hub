public class TelegramBotWebhookService extends BotWebhookService {

    private TelegramBotWebhookService() {}

    public override void setWebhook() {
        ValueMap payload = new ValueMap()
            .set('url', webhookUrl)
            .set('allowed_updates', new List<String> { TelegramBotUpdateEventType.Message.name() })
            .set('secret_token', bot.tokenHash);
        calloutService.call(TelegramBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        calloutService.call(TelegramBotMethod.DeleteWebhook, new ValueMap().set('drop_pending_updates', true));
    }
}
