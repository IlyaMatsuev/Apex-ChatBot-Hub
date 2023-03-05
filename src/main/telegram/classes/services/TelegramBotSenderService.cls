/**
 * @description Service class that provides access to all `Telegram` `send` methods
 * @group Telegram
 */
global class TelegramBotSenderService implements IBotSenderService {
    private final String chatId;
    private final BotCalloutService calloutService;
    private final IBotCallback callback;

    public TelegramBotSenderService(String chatId, BotCalloutService calloutService, IBotCallback callback) {
        this.chatId = chatId;
        this.calloutService = calloutService;
        this.callback = callback;
    }

    /**
     * @description Sends a text message
     * @param text The message text to send
     */
    global void text(String text) {
        ValueMap callbackParams = new ValueMap();
        if (BotUtils.isUrl(text)) {
            callbackParams.set('type', BotMessageType.Url.name()).set('mediaUrl', text);
        } else {
            callbackParams.set('type', BotMessageType.Text.name()).set('text', text);
        }
        send(TelegramBotMethod.SendMessage, new ValueMap().set('chat_id', chatId).set('text', text), callbackParams);
    }

    /**
     * @description Sends an image
     * @param imageUrl The image URL
     */
    global void image(String imageUrl) {
        image(imageUrl, null);
    }

    /**
     * @description Sends an image with a caption
     * @param imageUrl The image URL
     * @param caption The text to attach to the image
     */
    global void image(String imageUrl, String caption) {
        send(
            TelegramBotMethod.SendPhoto,
            new ValueMap().set('chat_id', chatId).set('caption', caption, true).set('photo', imageUrl),
            new ValueMap().set('type', BotMessageType.Image.name()).set('text', caption).set('mediaUrl', imageUrl)
        );
    }

    /**
     * @description Sends a video
     * @param videoUrl The video URL
     */
    global void video(String videoUrl) {
        video(videoUrl, null);
    }

    /**
     * @description Sends a video with a caption
     * @param videoUrl The video URL
     * @param caption The text to attach to the video
     */
    global void video(String videoUrl, String caption) {
        send(
            TelegramBotMethod.SendVideo,
            new ValueMap().set('chat_id', chatId).set('caption', caption, true).set('video', videoUrl),
            new ValueMap().set('type', BotMessageType.Video.name()).set('text', caption).set('mediaUrl', videoUrl)
        );
    }

    /**
     * @description Sends a file
     * @param fileUrl The file URL. Should include file name with extension in the end
     */
    global void file(String fileUrl) {
        file(fileUrl, null);
    }

    /**
     * @description Sends a file
     * @param fileUrl The file URL
     * @param caption The text to attach to the file
     */
    global void file(String fileUrl, String caption) {
        send(
            TelegramBotMethod.SendDocument,
            new ValueMap().set('chat_id', chatId).set('caption', caption, true).set('document', fileUrl),
            new ValueMap().set('type', BotMessageType.File.name()).set('text', caption).set('mediaUrl', fileUrl)
        );
    }

    /**
     * @description Sends a contact reference
     * @param name The contact first name or full name (via spaces)
     * @param phone The contact phone number
     */
    global void contact(String name, String phone) {
        String firstName = name.substringBefore(' ');
        String lastName = name.contains(' ') ? name.substringAfter(' ') : null;

        send(
            TelegramBotMethod.SendContact,
            new ValueMap()
                .set('chat_id', chatId)
                .set('first_name', firstName)
                .set('last_name', lastName, true)
                .set('phone_number', phone),
            new ValueMap()
                .set('type', BotMessageType.Contact.name())
                .set('parameters', new ValueMap().set('name', name).set('phone', phone))
        );
    }

    /**
     * @description Sends a location. Latitude and longitude values are not validated
     * @param latitude The location latitude
     * @param longitude The location longitude
     */
    global void location(Decimal latitude, Decimal longitude) {
        send(
            TelegramBotMethod.SendLocation,
            new ValueMap().set('chat_id', chatId).set('latitude', latitude).set('longitude', longitude),
            new ValueMap()
                .set('type', BotMessageType.Location.name())
                .set('parameters', new ValueMap().set('lat', latitude).set('lon', longitude))
        );
    }

    /**
     * @description Sends a sticker
     * @param stickerIdOrUrl The unique identifier of the sticker or the URL to `.WEBP` file
     */
    global void sticker(String stickerIdOrUrl) {
        String stickerId = stickerIdOrUrl;
        String stickerUrl;
        if (BotUtils.isUrl(stickerIdOrUrl)) {
            stickerId = null;
            stickerUrl = stickerIdOrUrl;
        }
        send(
            TelegramBotMethod.SendSticker,
            new ValueMap().set('chat_id', chatId).set('sticker', stickerIdOrUrl),
            new ValueMap()
                .set('type', BotMessageType.Sticker.name())
                .set('mediaUrl', stickerUrl, true)
                .set('parameters', new ValueMap().set('stickerId', stickerId, true))
        );
    }

    // TODO: Implement: sendMediaGroup, sendAudio, sendAnimation, sendVoice, sendVideoNote, sendVenue, sendPoll, sendDice, sendChatAction

    private void send(TelegramBotMethod method, ValueMap payload, ValueMap callbackParams) {
        ValueMap response = calloutService.call(method, payload);
        String messageId = ((TelegramBotMessageEntity) response.getValueMap('result', TelegramBotMessageEntity.class))
            .getId();
        callback.execute(callbackParams.set('messageId', messageId));
    }
}
