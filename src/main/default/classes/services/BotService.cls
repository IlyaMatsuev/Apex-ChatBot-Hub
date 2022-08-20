global abstract class BotService {
    protected final Bot__c bot;
    protected final BotSetting__mdt settings;

    protected BotService(Bot__c bot) {
        this.bot = bot;
        this.settings = BotSettingsProvider.getSettings(BotType.valueOf(bot.Type__c));
    }

    /**
     * Send message to the chat
     * @param chatId External id of the chat
     * @param message Message to send
     */
    global void send(String chatId, String message) {
        String messageId = sendMessage(chatId, message);
        ChatMessage__c messageRecord = new ChatMessage__c(
            Text__c = message,
            Chat__r = new Chat__c(ExternalId__c = chatId),
            Bot__c = bot.id,
            ExternalId__c = messageId
        );
        BotUtils.saveAsync(new List<SObject>{ messageRecord }, 'ExternalId__c');
    }

    protected virtual String sendMessage(String chatId, String message) {
        throw new BotServiceException('Not implemented: sendMessage(String chatId, String message)');
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

    public class BotServiceException extends Exception {
    }
}
