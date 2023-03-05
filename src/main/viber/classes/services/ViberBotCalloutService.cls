public class ViberBotCalloutService extends BotCalloutService {

    private ViberBotCalloutService() {}

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setEndpoint(settings.ApiUrl__c + '/' + method);
        request.setHeader('X-Viber-Auth-Token', bot.token);
        return request;
    }

    protected override Boolean isSuccessResponse(HttpResponse response, ValueMap payload) {
        return super.isSuccessResponse(response, payload) && payload.getInteger('status') == 0;
    }
}
