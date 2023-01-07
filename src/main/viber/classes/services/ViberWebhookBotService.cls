public class ViberWebhookBotService extends WebhookBotService {
    public ViberWebhookBotService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        ValueMap payload = new ValueMap()
            .set('url', webhookUrl)
            .set('send_name', true)
            .set('send_photo', true)
            .set('event_types', new List<String> { ViberBotUpdateEventType.Message.name() });
        call(ViberBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        call(ViberBotMethod.SetWebhook, new ValueMap().set('url', ''));
    }
}
