public class ViberBotWebhookService extends BotWebhookService {

    private ViberBotWebhookService() {}

    public override void setWebhook() {
        BotJsonPayload payload = new BotJsonPayload()
            .set('url', webhookUrl + '/' + bot.tokenHash)
            .set('send_name', true)
            .set('send_photo', true)
            .set(
                'event_types',
                new List<String> {
                    ViberUpdateEventType.Message.name(),
                    ViberUpdateEventType.Delivered.name(),
                    ViberUpdateEventType.Seen.name()
                }
            );
        calloutService.call(ViberBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        calloutService.call(ViberBotMethod.SetWebhook, new BotJsonPayload().set('url', ''));
    }
}
