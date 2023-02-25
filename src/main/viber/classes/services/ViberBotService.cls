/**
 * @description The concrete service for the `Viber` messanger bots. Extends `BotService` but also contains features related to `Viber` only
 */
global class ViberBotService extends BotService {
    private static final Integer DEFAULT_VIDEO_MESSAGE_SIZE = 10000;

    public ViberBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap()
            .set('receiver', chatId)
            .set('sender', new ValueMap().set('name', bot.Name))
            .set('type', 'text')
            .set('text', params.text);

        return call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    protected override String sendImage(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap()
            .set('receiver', chatId)
            .set('sender', new ValueMap().set('name', bot.Name))
            .set('type', 'picture')
            .set('text', params.text, true)
            .set('media', params.mediaUrl);

        return call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    protected override String sendVideo(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap()
            .set('receiver', chatId)
            .set('sender', new ValueMap().set('name', bot.Name))
            .set('type', 'video')
            .set('media', params.mediaUrl)
            .set('size', DEFAULT_VIDEO_MESSAGE_SIZE);

        String videoMessageId = call(ViberBotMethod.SendMessage, payload).getString('message_token');

        // Viber doesn't support captions for video messages, so send caption text separately
        if (String.isNotBlank(params.text?.trim())) {
            sendMessage(chatId, params.text);
        }

        return videoMessageId;
    }

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setHeader('X-Viber-Auth-Token', bot.Token__c);
        return request;
    }

    protected override Boolean isSuccessResponse(HttpResponse response, ValueMap payload) {
        return super.isSuccessResponse(response, payload) && payload.getInteger('status') == 0;
    }
}
