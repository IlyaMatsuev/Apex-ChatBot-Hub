/**
 * @description Service class that provides access to all `Telegram` `edit` methods
 */
global class TelegramBotEditorService {
    private final String chatId;
    private final String messageId;
    private final String messageIdField;
    private final BotCalloutService calloutService;

    private TelegramInlineKeyboardMarkupOptions replyMarkup;

    public TelegramBotEditorService(
        String chatId,
        String messageId,
        Boolean isInlineMessage,
        BotCalloutService calloutService
    ) {
        this.chatId = chatId;
        this.messageId = messageId;
        this.messageIdField = isInlineMessage == true ? 'inline_message_id' : 'message_id';
        this.calloutService = calloutService;
    }

    /**
     * @description Updates the text of the message
     * @param text The new text of the message, `1-4096 characters`
     */
    global void text(String text) {
        text(text, new TelegramEditTextOptions());
    }

    /**
     * @description Updates the text of the message
     * @param text The new text of the message, `1-4096 characters`
     * @param options The additional edit options
     */
    global void text(String text, TelegramEditTextOptions options) {
        send(TelegramBotMethod.EditMessageText, new BotJsonPayload(options).set('text', text));
    }

    /**
     * @description Updates the caption of the message
     * @param caption The new caption of the message, `1-1024 characters`
     */
    global void caption(String caption) {
        caption(caption, new TelegramEditCaptionOptions());
    }

    /**
     * @description Updates the caption of the message
     * @param caption The new caption of the message, `1-1024 characters`
     * @param options The additional edit options
     */
    global void caption(String caption, TelegramEditCaptionOptions options) {
        send(TelegramBotMethod.EditMessageCaption, new BotJsonPayload(options).set('caption', caption));
    }

    /**
     * @description Updates animation, audio, document, photo, or video messages
     * @param media The input for a new media content of the message
     */
    global void media(TelegramInputMedia media) {
        send(TelegramBotMethod.EditMessageMedia, new BotJsonPayload().set('media', media));
    }

    /**
     * @description Updates the live location messages
     * @param latitude The new location latitude
     * @param longitude The new location longitude
     */
    global void liveLocation(Decimal latitude, Decimal longitude) {
        liveLocation(latitude, longitude, new TelegramEditLiveLocationOptions());
    }

    /**
     * @description Updates the live location messages
     * @param latitude The new location latitude
     * @param longitude The new location longitude
     * @param options The additional edit options
     */
    global void liveLocation(Decimal latitude, Decimal longitude, TelegramEditLiveLocationOptions options) {
        BotJsonPayload payload = new BotJsonPayload(options).set('latitude', latitude).set('longitude', longitude);

        send(TelegramBotMethod.EditMessageLiveLocation, payload);
    }

    /**
     * @description Stops updating the live location messages before live period expires
     */
    global void stopLiveLocation() {
        send(TelegramBotMethod.StopMessageLiveLocation, new BotJsonPayload());
    }

    /**
     * @description Updates the inline keyboard of the message. This will override the keyboard set using `withInlineKeyboard` method
     * @param keyboard The new inline keyboard for the message
     */
    global void inlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        this.replyMarkup = keyboard;
        send(TelegramBotMethod.EditMessageReplyMarkup, new BotJsonPayload());
    }

    /**
     * @description Stops the poll that was sent by the bot
     */
    global void stopPoll() {
        send(TelegramBotMethod.StopPoll, new BotJsonPayload().set('message_id', messageId));
    }

    /**
     * @description Deletes the message
     */
    global void deleteMessage() {
        send(TelegramBotMethod.DeleteMessage, new BotJsonPayload().set('message_id', messageId));
    }

    /**
     * @description Sets a new inline keyboard for the edited message
     * @param keyboard The instance of <<TelegramInlineKeyboardMarkupOptions>> class, custom inline keyboard to be shown
     * @return The current instance of the <<TelegramBotEditorService>> class
     */
    global TelegramBotEditorService withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        this.replyMarkup = keyboard;
        return this;
    }

    private void send(TelegramBotMethod method, BotJsonPayload payload) {
        if (replyMarkup != null) {
            payload.set('reply_markup', replyMarkup);
        }
        if (!payload.hasValue('message_id')) {
            payload.set(messageIdField, messageId);
        }
        calloutService.call(method, payload.set('chat_id', chatId));
    }
}
