// TODO: Add ApexDoc
/**
 * @description The concrete service for the `Telegram` messanger bots. Extends `BotService` but also contains features related to `Telegram` only
 */
global class TelegramBotService extends BotService {
    @TestVisible
    private TelegramBotService(Bot__c bot) {
        super(bot);
    }

    global SenderService send(String chatId) {
        return new SenderService(chatId, calloutService);
    }

    private class SenderService implements IBotSenderService {
        private final String chatId;
        private final BotCalloutService calloutService;

        public SenderService(String chatId, BotCalloutService calloutService) {
            this.chatId = chatId;
            this.calloutService = calloutService;
        }

        global void text(String text) {
            ValueMap payload = new ValueMap().set('chat_id', chatId).set('text', text);
            send(TelegramBotMethod.SendMessage, payload);
        }

        global void image(String imageUrl) {
            image(imageUrl, null);
        }

        global void image(String imageUrl, String caption) {
            ValueMap payload = new ValueMap()
                .set('chat_id', chatId)
                .set('caption', caption, true)
                .set('photo', imageUrl);

            send(TelegramBotMethod.SendPhoto, payload);
        }

        global void video(String videoUrl) {
            video(videoUrl, null);
        }

        global void video(String videoUrl, String caption) {
            ValueMap payload = new ValueMap()
                .set('chat_id', chatId)
                .set('caption', caption, true)
                .set('video', videoUrl);

            send(TelegramBotMethod.SendVideo, payload);
        }

        global void file(String fileUrl) {
            file(fileUrl);
        }

        global void file(String fileUrl, String caption) {
            ValueMap payload = new ValueMap()
                .set('chat_id', chatId)
                .set('caption', caption, true)
                .set('document', fileUrl);

            send(TelegramBotMethod.SendDocument, payload);
        }

        global void contact(String name, String phone) {
            String firstName = name.substringBefore(' ');
            String lastName = name.contains(' ') ? name.substringAfter(' ') : null;

            ValueMap payload = new ValueMap()
                .set('chat_id', chatId)
                .set('first_name', firstName)
                .set('last_name', lastName, true)
                .set('phone_number', phone);

            send(TelegramBotMethod.SendContact, payload);
        }

        global void location(Decimal latitude, Decimal longitude) {
            ValueMap payload = new ValueMap()
                .set('chat_id', chatId)
                .set('latitude', latitude)
                .set('longitude', longitude);

            send(TelegramBotMethod.SendLocation, payload);
        }

        // TODO: Need to save the message in DB as I previously did
        private String send(TelegramBotMethod method, ValueMap payload) {
            ValueMap response = calloutService.call(method, payload);
            return ((TelegramBotMessageEntity) response.getValueMap('result', TelegramBotMessageEntity.class)).getId();
        }
    }
}
