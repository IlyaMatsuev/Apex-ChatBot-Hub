/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendContact` method. The source: https://core.telegram.org/bots/api#sendcontact
 */
global class TelegramSendContactOptions extends BotPayload {
    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendContactOptions>> class
     */
    global TelegramSendContactOptions withThreadId(String threadId) {
        payload.set('message_thread_id', BotUtils.parseExternalId(threadId), true);
        return this;
    }

    /**
     * @description Sets the additional data for the contact message of a vCard format
     * @param vcard The `vCard` format string
     * @return The current instance of the <<TelegramSendContactOptions>> class
     */
    global TelegramSendContactOptions withVCard(String vcard) {
        payload.set('vcard', vcard, true);
        return this;
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendContactOptions>> class
     */
    global TelegramSendContactOptions withoutNotification() {
        payload.set('disable_notification', true);
        return this;
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendContactOptions>> class
     */
    global TelegramSendContactOptions withProtectedContent() {
        payload.set('protect_content', true);
        return this;
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendContactOptions>> class
     */
    global TelegramSendContactOptions asReplyToMessage(String messageId) {
        payload.set('reply_to_message_id', BotUtils.parseExternalId(messageId), true);
        payload.set('allow_sending_without_reply', true);
        return this;
    }
}
