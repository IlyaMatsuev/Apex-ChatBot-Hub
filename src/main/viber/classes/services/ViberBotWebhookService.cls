public class ViberBotWebhookService extends BotWebhookService {
    @TestVisible
    private ViberBotWebhookService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        ValueMap payload = new ValueMap()
            .set('url', webhookUrl + '/' + bot.TokenHash__c)
            .set('send_name', true)
            .set('send_photo', true)
            .set(
                'event_types',
                new List<String> {
                    ViberBotUpdateEventType.Message.name(),
                    ViberBotUpdateEventType.Delivered.name(),
                    ViberBotUpdateEventType.Seen.name()
                }
            );
        calloutService.call(ViberBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        calloutService.call(ViberBotMethod.SetWebhook, new ValueMap().set('url', ''));
    }
}
