public virtual class BotCalloutService {
    protected final BotModel bot;

    protected BotSetting__mdt settings { get { return BotSettingsProvider.get(bot.type); } }

    protected BotCalloutService() {}

    public BotJsonPayload call(BotMethod method, BotJsonPayload body) {
        return call(method, body, true);
    }

    public BotJsonPayload call(BotMethod method, BotJsonPayload body, Boolean throwOnFail) {
        HttpResponse response = new Http().send(prepareRequest(method, body));
        BotJsonPayload responsePayload = BotJsonPayload.fromJson(response.getBody());

        if (throwOnFail && !isSuccessResponse(response, responsePayload)) {
            throw new BotCalloutException(
                'A call failed for the bot "' +
                    bot.name +
                    '" and method "' +
                    method +
                    '" with status: ' +
                    response.getStatus(),
                new BotJsonPayload()
                    .set(
                        'request',
                        new BotJsonPayload().set('body', body).set('botMethod', method.name()).set('botId', bot.id)
                    )
                    .set(
                        'response',
                        new BotJsonPayload().set('body', responsePayload).set('statusCode', response.getStatusCode())
                    )
            );
        }
        return responsePayload;
    }

    protected virtual HttpRequest prepareRequest(BotMethod method, BotJsonPayload body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(settings.ApiUrl__c + bot.token + '/' + method);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(body.toJson());
        return request;
    }

    protected virtual Boolean isSuccessResponse(HttpResponse response, BotJsonPayload payload) {
        return response.getStatusCode() == 200;
    }

    public class BotCalloutException extends BotCustomException {
        public BotCalloutException(String message, BotJsonPayload payload) {
            super(message, payload);
        }
    }
}
