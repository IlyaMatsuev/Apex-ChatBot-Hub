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
        send(chatId, new MessageParams(BotMessageType.Text, text));
    }

    /**
     * @description Sends an image to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the generated one that is stored in `Chat__c.ExternalId__c`
     * @param imageUrl The image URL
     */
    global void sendImage(String chatId, String imageUrl) {
        sendImage(chatId, imageUrl, null);
    }

    /**
     * @description Sends an image with a caption to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the generated one that is stored in `Chat__c.ExternalId__c`
     * @param imageUrl The image URL
     * @param caption The text to attach to the image
     */
    global void sendImage(String chatId, String imageUrl, String caption) {
        send(chatId, new MessageParams(BotMessageType.Image, caption, imageUrl));
    }

    /**
     * @description Sends a video to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the generated one that is stored in `Chat__c.ExternalId__c`
     * @param videoUrl The video URL
     */
    global void sendVideo(String chatId, String videoUrl) {
        sendVideo(chatId, videoUrl, null);
    }

    /**
     * @description Sends a video with a caption to the chat
     * @param chatId External id of the chat. Can be either source chat messenger id or the generated one that is stored in `Chat__c.ExternalId__c`
     * @param videoUrl The video URL
     * @param caption The text to attach to the video
     */
    global void sendVideo(String chatId, String videoUrl, String caption) {
        send(chatId, new MessageParams(BotMessageType.Video, caption, videoUrl));
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

    protected virtual String sendMessage(String chatId, MessageParams params) {
        throw new BotServiceException(
            'Not implemented: sendMessage(String chatId, MessageParams params)',
            new ValueMap().set('chatId', chatId).set('params', params)
        );
    }

    protected virtual String sendImage(String chatId, MessageParams params) {
        throw new BotServiceException(
            'Not implemented: sendImage(String chatId, MessageParams params)',
            new ValueMap().set('chatId', chatId).set('params', params)
        );
    }

    protected virtual String sendVideo(String chatId, MessageParams params) {
        throw new BotServiceException(
            'Not implemented: sendVideo(String chatId, MessageParams params)',
            new ValueMap().set('chatId', chatId).set('params', params)
        );
    }

    private void send(String chatId, MessageParams params) {
        String normalizedChatId = chatId.substringBefore(':');
        String messageId;
        if (params.type == BotMessageType.Text) {
            messageId = sendMessage(normalizedChatId, params);
        } else if (params.type == BotMessageType.Image) {
            messageId = sendImage(normalizedChatId, params);
        } else if (params.type == BotMessageType.Video) {
            messageId = sendVideo(normalizedChatId, params);
        } else {
            throw new BotService.BotServiceException(
                'The requested message type is not supported yet: ' + params.type?.name(),
                new ValueMap().set('chatId', chatId).set('params', params)
            );
        }

        ChatMessage__c messageRecord = new ChatMessage__c(
            Type__c = params.type.name(),
            Text__c = params.text,
            MediaUrl__c = params.mediaUrl,
            Parameters__c = params.additionalInfo.toJson(true),
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

    public class MessageParams extends ValueMap {
        public final BotMessageType type;
        public final String text;
        public final String mediaUrl;
        public final ValueMap additionalInfo;

        private MessageParams(BotMessageType type, String text) {
            this(type, text, null);
        }

        private MessageParams(BotMessageType type, String text, String mediaUrl) {
            this.type = type;
            this.text = text;
            this.mediaUrl = mediaUrl;
            this.additionalInfo = new ValueMap();
        }
    }
}
