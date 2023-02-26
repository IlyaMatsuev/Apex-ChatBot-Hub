public class ViberBotCalloutService extends BotCalloutService {
    public ViberBotCalloutService(Bot__c bot) {
        super(bot);
    }

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setEndpoint(settings.ApiUrl__c + '/' + method);
        request.setHeader('X-Viber-Auth-Token', bot.Token__c);
        return request;
    }

    protected override Boolean isSuccessResponse(HttpResponse response, ValueMap payload) {
        return super.isSuccessResponse(response, payload) && payload.getInteger('status') == 0;
    }
}
