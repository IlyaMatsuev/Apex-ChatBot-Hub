/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendDice` method. The source: https://core.telegram.org/bots/api#senddice
 */
global class TelegramSendDiceOptions extends TelegramSendMessageOptions {
    /**
     * @description Sets a specific emoji on which the dice throw animation is based
     * @param emoji One of the supported emojis:
     * `🎲`, `🎯` and `🎳` - generate values in range: `1..6`
     * `🏀` and `⚽` - generate values in range `1..5`
     * `🎰` - generate values in range `1..64`
     * Default is `🎲`
     * @return The current instance of the <<TelegramSendDiceOptions>> class
     */
    global TelegramSendDiceOptions withEmoji(String emoji) {
        payload.set('emoji', emoji, true);
        return this;
    }

    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendDiceOptions>> class
     */
    global TelegramSendDiceOptions withThreadId(String threadId) {
        return (TelegramSendDiceOptions) setThreadId(threadId);
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendDiceOptions>> class
     */
    global TelegramSendDiceOptions withoutNotification() {
        return (TelegramSendDiceOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendDiceOptions>> class
     */
    global TelegramSendDiceOptions withProtectedContent() {
        return (TelegramSendDiceOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendDiceOptions>> class
     */
    global TelegramSendDiceOptions asReplyToMessage(String messageId) {
        return (TelegramSendDiceOptions) setReplyMessageId(messageId);
    }
}
