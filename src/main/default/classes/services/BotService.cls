public virtual class BotService {
    protected final Bot__c bot;
    protected final BotUpdateModel updateModel;
    protected final BotSetting__mdt settings;

    protected BotService(Bot__c bot) {
        this(bot, null);
    }

    protected BotService(Bot__c bot, BotUpdateModel updateModel) {
        this.bot = bot;
        this.updateModel = updateModel;
        this.settings = getSettings();
    }

    public virtual void sendMessage(String message) {
        throw new BotServiceException('Not implemented: sendMessage()');
    }

    protected HttpResponse call(String botMethod, Map<String, Object> body) {
        return call(botMethod, body, true);
    }

    protected HttpResponse call(String botMethod, Map<String, Object> body, Boolean throwOnFail) {
        HttpResponse response = new Http().send(prepareRequest(botMethod, body));
        if (throwOnFail && response.getStatusCode() != HttpConstants.STATUS_CODE_SUCCESS) {
            throw new CalloutException(
                'A call failed for the bot "' +
                bot.Name +
                '" and method "' +
                botMethod +
                '";\n' +
                response.getBody()
            );
        }
        return response;
    }

    protected virtual HttpRequest prepareRequest(String botMethod, Map<String, Object> body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(settings.ApiUrl__c + bot.Token__c + '/' + botMethod);
        request.setMethod(HttpConstants.METHOD_POST);
        request.setHeader(HttpConstants.HEADER_NAME_CONTENT_TYPE, HttpConstants.HEADER_VALUE_CONTENT_TYPE_JSON);
        request.setBody(JSON.serialize(body));
        return request;
    }

    private BotSetting__mdt getSettings() {
        String serviceName = String.valueOf(this).split(':').get(0);
        String settingsName = serviceName.substringBefore(BotService.class.getName());
        List<BotSetting__mdt> settings = [
            SELECT DeveloperName, ApiUrl__c
            FROM BotSetting__mdt
            WHERE DeveloperName = :settingsName
            LIMIT 1
        ];
        if (settings.isEmpty()) {
            throw new SObjectException('No setting exists for the ' + serviceName + ' BotService class');
        }
        return settings.get(0);
    }

    public class BotServiceException extends Exception {
    }
}
