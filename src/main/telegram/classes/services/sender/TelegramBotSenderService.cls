// TODO: Implement: sendMediaGroup, sendAudio, sendAnimation, sendVoice, sendVideoNote, sendVenue, sendPoll, sendDice, sendChatAction
/**
 * @description Service class that provides access to all `Telegram` `send` methods
 */
global class TelegramBotSenderService implements IBotSenderService {
    private final String chatId;
    private final BotCalloutService calloutService;
    private final IBotCallback callback;

    private TelegramSendKeyboardOptions replyKeyboard;

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

    /**
     * @description Sets a simple custom keyboard for the message that the receiver will have instead of the standard input keyboard
     * @param buttons The list of buttons to be shown to the receiver
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withReplyKeyboard(BotReplyKeyboardButton[] buttons) {
        TelegramSendKeyboardOptions keyboard = new TelegramSendKeyboardOptions();
        for (Integer i = 0; i < buttons.size(); i++) {
            BotReplyKeyboardButton button = buttons.get(i);
            TelegramSendKeyboardOptions.Button keyboardButton = new TelegramSendKeyboardOptions.Button(button.text);
            if (button.sharesContact) {
                keyboardButton.asContactRequest();
            } else if (button.sharesLocation) {
                keyboardButton.asLocationRequest();
            }
            keyboard.addButton(i, keyboardButton);
        }
        return withReplyKeyboard(keyboard);
    }

    /**
     * @description Sets a simple custom keyboard for the message that the receiver will have instead of the standard input keyboard
     * @param buttons The list of buttons to be shown to the receiver
     * @return The current instance of `Telegram` sender service
     */
    global TelegramBotSenderService withReplyKeyboard(TelegramSendKeyboardOptions keyboard) {
        this.replyKeyboard = keyboard;
        return this;
    }

    private void send(TelegramBotMethod method, ValueMap payload, ValueMap callbackParams) {
        if (replyKeyboard != null) {
            payload.set('reply_markup', replyKeyboard);
        }

        ValueMap response = calloutService.call(method, payload);
        TelegramBotMessageEntity message = (TelegramBotMessageEntity) response.getValueMap(
            'result',
            TelegramBotMessageEntity.class
        );
        callback.execute(callbackParams.set('messageId', message.getId()).set('keyboard', replyKeyboard, true));
    }
}
