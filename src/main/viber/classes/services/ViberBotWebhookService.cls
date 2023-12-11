public class ViberBotWebhookService extends BotWebhookService {

    private ViberBotWebhookService() {}

    public override WebhookInfo getWebhookInfo() {
        BotJsonPayload response = calloutService.call(ViberBotMethod.GetAccountInfo, new BotJsonPayload());
        return new WebhookInfo(response.getString('webhook'), webhookUrl + '/' + bot.tokenHash);
    }

    public override void setWebhook() {
        BotJsonPayload payload = new BotJsonPayload()
            .set('url', webhookUrl + '/' + bot.tokenHash)
            .set('send_name', true)
            .set('send_photo', true)
            .set('event_types', bot.webhookEvents);
        calloutService.call(ViberBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        calloutService.call(ViberBotMethod.SetWebhook, new BotJsonPayload().set('url', ''));
    }
}
