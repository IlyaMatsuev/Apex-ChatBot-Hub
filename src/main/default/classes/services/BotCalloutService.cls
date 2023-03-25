public virtual class BotCalloutService {
    protected final BotModel bot;

    protected BotSetting__mdt settings { get { return BotSettingsProvider.get(bot.type); } }

    protected BotCalloutService() {}

    public ValueMap call(BotMethod method, ValueMap body) {
        return call(method, body, true);
    }

    public ValueMap call(BotMethod method, ValueMap body, Boolean throwOnFail) {
        HttpResponse response = new Http().send(prepareRequest(method, body));
        ValueMap responsePayload = ValueMap.fromJson(response.getBody());

        if (throwOnFail && !isSuccessResponse(response, responsePayload)) {
            throw new BotCalloutException(
                'A call failed for the bot "' +
                    bot.name +
                    '" and method "' +
                    method +
                    '" with status: ' +
                    response.getStatus(),
                new ValueMap()
                    .set(
                        'request',
                        new ValueMap()
                            .set('body', body.getValues())
                            .set('botMethod', method.name())
                            .set('botId', bot.id)
                    )
                    .set(
                        'response',
                        new ValueMap().set('body', responsePayload).set('statusCode', response.getStatusCode())
                    )
            );
        }
        return responsePayload;
    }

    protected virtual HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(settings.ApiUrl__c + bot.token + '/' + method);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(body.toJson());
        return request;
    }

    protected virtual Boolean isSuccessResponse(HttpResponse response, ValueMap payload) {
        return response.getStatusCode() == 200;
    }

    public class BotCalloutException extends BotCustomException {
        public BotCalloutException(String message, ValueMap payload) {
            super(message, payload);
        }
    }
}
