/**
 * @description The concrete service for the `Telegram` messanger bots. Extends `BotService` but also contains features related to `Telegram` only
 */
global class TelegramBotService extends BotService {
    public TelegramBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap().set('chat_id', chatId).set('text', params.text);
        return sendMessage(TelegramBotMethod.SendMessage, payload);
    }

    protected override String sendImage(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap()
            .set('chat_id', chatId)
            .set('caption', params.text, true)
            .set('photo', params.mediaUrl);

        return sendMessage(TelegramBotMethod.SendPhoto, payload);
    }

    protected override String sendVideo(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap()
            .set('chat_id', chatId)
            .set('caption', params.text, true)
            .set('video', params.mediaUrl);

        return sendMessage(TelegramBotMethod.SendVideo, payload);
    }

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setEndpoint(settings.ApiUrl__c + bot.Token__c + '/' + method);
        return request;
    }

    private String sendMessage(TelegramBotMethod method, ValueMap payload) {
        ValueMap response = call(method, payload);
        return ((TelegramBotMessageEntity) response.getValueMap('result', TelegramBotMessageEntity.class)).getId();
    }
}
