/**
 * @description The concrete service for the `Viber` messanger bots. Extends `BotService` but also contains features related to `Viber` only
 */
global class ViberBotService extends BotService {
    private static final Integer DEFAULT_FILE_MESSAGE_SIZE = 10000;

    @TestVisible
    private ViberBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, BotService.MessageParams params) {
        ValueMap payload = prepareMessagePayload(chatId, 'text').set('text', params.text);
        return calloutService.call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    protected override String sendImage(String chatId, BotService.MessageParams params) {
        ValueMap payload = prepareMessagePayload(chatId, 'picture')
            .set('text', params.text, true)
            .set('media', params.mediaUrl);

        return calloutService.call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    protected override String sendVideo(String chatId, BotService.MessageParams params) {
        ValueMap payload = prepareMessagePayload(chatId, 'video')
            .set('media', params.mediaUrl)
            .set('size', DEFAULT_FILE_MESSAGE_SIZE);

        String videoMessageId = calloutService.call(ViberBotMethod.SendMessage, payload).getString('message_token');

        // Viber doesn't support captions for video messages, so send caption text separately
        if (String.isNotBlank(params.text?.trim())) {
            sendMessage(chatId, params.text);
        }

        return videoMessageId;
    }

    protected override String sendFile(String chatId, BotService.MessageParams params) {
        ValueMap payload = prepareMessagePayload(chatId, 'file')
            .set('media', params.mediaUrl)
            // Capturing the file name from the url: "https://example.com/static/file.pdf"
            .set('file_name', params.mediaUrl.substringAfterLast('/'))
            .set('size', DEFAULT_FILE_MESSAGE_SIZE);

        String fileMessageId = calloutService.call(ViberBotMethod.SendMessage, payload).getString('message_token');

        // Viber doesn't support captions for file messages, so send caption text separately
        if (String.isNotBlank(params.text?.trim())) {
            sendMessage(chatId, params.text);
        }

        return fileMessageId;
    }

    protected override String sendContact(String chatId, BotService.MessageParams params) {
        ValueMap payload = prepareMessagePayload(chatId, 'contact')
            .set(
                'contact',
                new ValueMap()
                    .set('name', params.additionalInfo.getString('name'))
                    .set('phone_number', params.additionalInfo.getString('phone'))
            );

        return calloutService.call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    protected override String sendLocation(String chatId, BotService.MessageParams params) {
        ValueMap payload = prepareMessagePayload(chatId, 'location')
            .set(
                'location',
                new ValueMap()
                    .set('lat', params.additionalInfo.getString('lat'))
                    .set('lon', params.additionalInfo.getString('lon'))
            );

        return calloutService.call(ViberBotMethod.SendMessage, payload).getString('message_token');
    }

    private ValueMap prepareMessagePayload(String chatId, String type) {
        return new ValueMap()
            .set('receiver', chatId)
            .set('sender', new ValueMap().set('name', bot.Name))
            .set('type', type);
    }
}
