public class TelegramBotWebhookService extends BotWebhookService {

    private TelegramBotWebhookService() {}

    public override WebhookInfo getWebhookInfo() {
        BotJsonPayload response = calloutService.call(TelegramBotMethod.GetWebhookInfo, new BotJsonPayload());
        String url = response.getJsonPayload('result').getString('url');
        return new WebhookInfo(url, webhookUrl);
    }

    public override void setWebhook() {
        BotJsonPayload payload = new BotJsonPayload()
            .set('url', webhookUrl)
            .set('allowed_updates', bot.webhookEvents)
            .set('secret_token', bot.tokenHash);
        calloutService.call(TelegramBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        calloutService.call(TelegramBotMethod.DeleteWebhook, new BotJsonPayload().set('drop_pending_updates', true));
    }
}
