/**
 * @description The base class that contains features common for all bots
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
     * @description Sends a text message to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the generated one that is stored in `Chat__c.ExternalId__c`
     * @param text The message text to send
     */
    global void sendMessage(String chatId, String text) {
        send(chatId, BotMessageOptions.asText(text));
    }

    /**
     * @description Sends an image to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the generated one that is stored in `Chat__c.ExternalId__c`
     * @param caption The text to attach to the image. Optional
     * @param imageUrl The image url
     */
    global void sendImage(String chatId, String caption, String imageUrl) {
        send(chatId, BotMessageOptions.asImage(caption, imageUrl));
    }

    /**
     * @description Sends a video to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the generated one that is stored in `Chat__c.ExternalId__c`
     * @param caption The text to attach to the video. Viber doesn't support it Optional
     * @param videoUrl The video url
     */
    global void sendVideo(String chatId, String caption, String videoUrl) {
        // TODO: Don't know how to provide video size and duration
        send(chatId, BotMessageOptions.asVideo(caption, videoUrl, null, null));
    }

    protected ValueMap call(BotMethod method, ValueMap body) {
        return call(method, body, true);
    }

    protected ValueMap call(BotMethod method, ValueMap body, Boolean throwOnFail) {
        HttpResponse response = new Http().send(prepareRequest(method, body));
        ValueMap responsePayload = ValueMap.fromJson(response.getBody());

        if (throwOnFail && !isSuccessResponse(response, responsePayload)) {
            throw new BotServiceException(
                'A call failed for the bot "' + bot.Name + '" and method "' + method + '": ' + response.getStatus(),
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
                        new ValueMap().set('body', responsePayload).set('statusCode', response.getStatusCode())
                    )
            );
        }
        return responsePayload;
    }

    protected virtual HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(settings.ApiUrl__c + '/' + method);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(body.toJson());
        return request;
    }

    protected virtual Boolean isSuccessResponse(HttpResponse response, ValueMap payload) {
        return response.getStatusCode() == 200;
    }

    protected virtual String sendMessage(String chatId, BotMessageOptions options) {
        throw new BotServiceException(
            'Not implemented: sendMessage(String chatId, BotMessageOptions options)',
            new ValueMap().set('chatId', chatId).set('options', options)
        );
    }

    protected virtual String sendImage(String chatId, BotMessageOptions options) {
        throw new BotServiceException(
            'Not implemented: sendImage(String chatId, BotMessageOptions options)',
            new ValueMap().set('chatId', chatId).set('options', options)
        );
    }

    protected virtual String sendVideo(String chatId, BotMessageOptions options) {
        throw new BotServiceException(
            'Not implemented: sendVideo(String chatId, BotMessageOptions options)',
            new ValueMap().set('chatId', chatId).set('options', options)
        );
    }

    private void send(String chatId, BotMessageOptions options) {
        String normalizedChatId = chatId.substringBefore(':');
        String messageId;
        if (options.type == BotMessageType.Text) {
            messageId = sendMessage(normalizedChatId, options);
        } else if (options.type == BotMessageType.Image) {
            messageId = sendImage(normalizedChatId, options);
        } else if (options.type == BotMessageType.Video) {
            messageId = sendVideo(normalizedChatId, options);
        } else {
            throw new BotService.BotServiceException(
                'The requested message type is not supported yet: ' + options.type?.name(),
                new ValueMap().set('chatId', chatId).set('options', options)
            );
        }

        ChatMessage__c messageRecord = new ChatMessage__c(
            Type__c = options.type.name(),
            Text__c = options.text,
            MediaUrl__c = options.mediaUrl,
            Parameters__c = options.params.toJson(true),
            Chat__r = new Chat__c(ExternalId__c = BotUtils.generateChatId(bot.TokenHash__c, chatId)),
            Bot__c = bot.id,
            ExternalId__c = messageId
        );
        BotUtils.saveAsync(new List<SObject> { messageRecord }, 'ExternalId__c');
    }

    public class BotServiceException extends BotCustomException {
        public BotServiceException(String message, ValueMap payload) {
            super(message, payload);
        }
    }
}
