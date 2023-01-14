/**
 * @description The abstract class that contains features common for all bots
 */
global abstract class BotService {
    protected final Bot__c bot;

    protected BotType type {
        get {
            if (type == null) {
                type = BotType.valueOf(bot.Type__c);
            }
            return type;
        }
        private set;
    }

    protected BotSetting__mdt settings { get { return BotSettingsProvider.get(type); } }

    protected BotService(Bot__c bot) {
        this.bot = bot;
    }

    /**
     * Send a text message to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the formed one that is stored in `Chat__c.ExternalId__c`
     * @param message The text message to send
     */
    global void send(String chatId, String message) {
        String messageId = sendMessage(chatId.substringBefore(':'), message);
        ChatMessage__c messageRecord = new ChatMessage__c(
            Text__c = message,
            Chat__r = new Chat__c(ExternalId__c = BotUtils.generateChatId(bot.TokenHash__c, chatId)),
            Bot__c = bot.id,
            ExternalId__c = messageId
        );
        BotUtils.saveAsync(new List<SObject> { messageRecord }, 'ExternalId__c');
    }

    protected virtual String sendMessage(String chatId, String message) {
        throw new BotServiceException(
            'Not implemented: sendMessage(String chatId, String message)',
            new ValueMap().set('chatId', chatId).set('message', message)
        );
    }

    protected HttpResponse call(BotMethod method, ValueMap body) {
        return call(method, body, true);
    }

    protected HttpResponse call(BotMethod method, ValueMap body, Boolean throwOnFail) {
        HttpResponse response = new Http().send(prepareRequest(method, body));
        // TODO: This doesn't work for Viber - they always send 200 respones
        if (throwOnFail && response.getStatusCode() != 200) {
            throw new BotServiceException(
                'A call failed for the bot "' +
                bot.Name +
                '" and method "' +
                method +
                '": ' +
                response.getStatus(),
                new ValueMap()
                    .set(
                        'request',
                        new ValueMap()
                            .set('body', body.getValues())
                            .set('botMethod', method.name())
                            .set('botId', bot.Id)
                    )
                    .set(
                        'response',
                        new ValueMap()
                            .set('body', ValueMap.fromJson(response.getBody()))
                            .set('statusCode', response.getStatusCode())
                    )
            );
        }
        return response;
    }

    protected virtual HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(settings.ApiUrl__c + '/' + method);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(body.toJson());
        return request;
    }

    public class BotServiceException extends BotCustomException {
        public BotServiceException(String message, ValueMap payload) {
            super(message, payload);
        }
    }
}
