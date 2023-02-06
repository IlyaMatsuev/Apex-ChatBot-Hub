/**
 * @description The concrete service for the `Viber` messanger bots. Extends `BotService` but also contains features related to `Viber` only
 */
global class ViberBotService extends BotService {
    public ViberBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, BotMessageOptions options) {
        ValueMap payload = new ValueMap()
            .set('receiver', chatId)
            .set('sender', new ValueMap().set('name', bot.Name))
            .set('type', 'text')
            .set('text', options.text);

        return call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    protected override String sendImage(String chatId, BotMessageOptions options) {
        ValueMap payload = new ValueMap()
            .set('receiver', chatId)
            .set('sender', new ValueMap().set('name', bot.Name))
            .set('type', 'picture')
            .set('text', options.text)
            .set('media', options.mediaUrl);

        return call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    protected override String sendVideo(String chatId, BotMessageOptions options) {
        // Viber doesn't support captions for video messages, so send text separately
        if (String.isNotBlank(options.text?.trim())) {
            sendMessage(chatId, options.text);
        }

        ValueMap payload = new ValueMap()
            .set('receiver', chatId)
            .set('sender', new ValueMap().set('name', bot.Name))
            .set('type', 'video')
            .set('media', options.mediaUrl)
            .set('size', options.params.get('size'));

        return call(ViberBotMethod.SendMessage, payload).getString('message_token');
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
