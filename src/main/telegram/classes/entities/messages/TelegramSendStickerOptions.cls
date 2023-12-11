/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendSticker` method.
 * Source: https://core.telegram.org/bots/api#sendsticker
 */
global class TelegramSendStickerOptions extends BotPayload {
    /**
     * @description Sets the forum channel thread id where the sticker has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendStickerOptions>> class
     */
    global TelegramSendStickerOptions withThreadId(String threadId) {
        payload.set('message_thread_id', BotUtils.parseExternalId(threadId), true);
        return this;
    }

    /**
     * @description Sets the emoji associated with the sticker. Works for just uploaded stickers only
     * @param emoji The emoji associated with the sticker
     * @return The current instance of the <<TelegramSendStickerOptions>> class
     */
    global TelegramSendStickerOptions asEmoji(String emoji) {
        payload.set('emoji', emoji, true);
        return this;
    }

    /**
     * @description Sends the sticker silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendStickerOptions>> class
     */
    global TelegramSendStickerOptions withoutNotification() {
        payload.set('disable_notification', true);
        return this;
    }

    /**
     * @description Protects the contents of the sent sticker from forwarding and saving
     * @return The current instance of the <<TelegramSendStickerOptions>> class
     */
    global TelegramSendStickerOptions withProtectedContent() {
        payload.set('protect_content', true);
        return this;
    }

    /**
     * @description Sends the sticker as a reply to another message. If the target message was not found, will just send a sticker
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendStickerOptions>> class
     */
    global TelegramSendStickerOptions asReplyToMessage(String messageId) {
        payload.set('reply_to_message_id', BotUtils.parseExternalId(messageId), true);
        payload.set('allow_sending_without_reply', true);
        return this;
    }
}
