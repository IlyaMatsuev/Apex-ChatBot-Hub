public class ViberWebhookBotService extends WebhookBotService {
    public ViberWebhookBotService(Bot__c bot) {
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
        call(ViberBotMethod.SetWebhook, payload);
    }

    public override void unsetWebhook() {
        call(ViberBotMethod.SetWebhook, new ValueMap().set('url', ''));
    }

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setHeader('X-Viber-Auth-Token', bot.Token__c);
        return request;
    }
}
