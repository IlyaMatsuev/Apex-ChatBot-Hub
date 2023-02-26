/**
 * @description The concrete service for the `Telegram` messanger bots. Extends `BotService` but also contains features related to `Telegram` only
 */
global class TelegramBotService extends BotService {
    @TestVisible
    private TelegramBotService(Bot__c bot) {
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

    protected override String sendFile(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap()
            .set('chat_id', chatId)
            .set('caption', params.text, true)
            .set('document', params.mediaUrl);

        return sendMessage(TelegramBotMethod.SendDocument, payload);
    }

    protected override String sendContact(String chatId, BotService.MessageParams params) {
        String name = params.additionalInfo.getString('name').trim();
        String firstName = name.substringBefore(' ');
        String lastName = name.contains(' ') ? name.substringAfter(' ') : null;

        ValueMap payload = new ValueMap()
            .set('chat_id', chatId)
            .set('first_name', firstName)
            .set('last_name', lastName, true)
            .set('phone_number', params.additionalInfo.getString('phone'));

        return sendMessage(TelegramBotMethod.SendContact, payload);
    }

    protected override String sendLocation(String chatId, BotService.MessageParams params) {
        ValueMap payload = new ValueMap()
            .set('chat_id', chatId)
            .set('latitude', params.additionalInfo.getDecimal('lat'))
            .set('longitude', params.additionalInfo.getDecimal('lon'));

        return sendMessage(TelegramBotMethod.SendLocation, payload);
    }

    private String sendMessage(TelegramBotMethod method, ValueMap payload) {
        ValueMap response = calloutService.call(method, payload);
        return ((TelegramBotMessageEntity) response.getValueMap('result', TelegramBotMessageEntity.class)).getId();
    }
}
