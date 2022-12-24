global abstract class BotService {
    protected final Bot__c bot;
    protected final BotSetting__mdt settings;

    protected BotService(Bot__c bot) {
        this.bot = bot;
        this.settings = BotSettingsProvider.getSettings(BotType.valueOf(bot.Type__c));
    }

    /**
     * Send message to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the formed one that is stored in Chat__c.ExternalId__c
     * @param message Message to send
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

    protected HttpResponse call(String botMethod, ValueMap body) {
        return call(botMethod, body, true);
    }

    protected HttpResponse call(String botMethod, ValueMap body, Boolean throwOnFail) {
        HttpResponse response = new Http().send(prepareRequest(botMethod, body));
        if (throwOnFail && response.getStatusCode() != 200) {
            throw new BotServiceException(
                'A call failed for the bot "' +
                bot.Name +
                '" and method "' +
                botMethod +
                '": ' +
                response.getStatus(),
                new ValueMap()
                    .set(
                        'request',
                        new ValueMap().set('body', body.getValues()).set('botMethod', botMethod).set('botId', bot.Id)
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

    protected virtual HttpRequest prepareRequest(String botMethod, ValueMap body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(settings.ApiUrl__c + bot.Token__c + '/' + botMethod);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(body.toJson());
        return request;
    }

    public class BotServiceException extends Exception {
        public final ValueMap payload;

        public BotServiceException(String message, ValueMap payload) {
            this(message);
            this.payload = payload;
        }
    }
}
