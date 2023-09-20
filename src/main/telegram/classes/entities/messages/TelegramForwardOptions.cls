/**
 * @description Represents the optional parameters for the `Telegram` `forward` method
 * Source: https://core.telegram.org/bots/api#forwardmessage
 */
global class TelegramForwardOptions extends TelegramSendMessageOptions {
    /**
     * @description Sets the unique identifier for the target message thread (topic) of the forum; for forum supergroups only
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramForwardOptions>> class
     */
    global TelegramForwardOptions withThreadId(String threadId) {
        return (TelegramForwardOptions) setThreadId(threadId);
    }

    /**
     * @description Forwards the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramForwardOptions>> class
     */
    global TelegramForwardOptions withoutNotification() {
        return (TelegramForwardOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the forwarded message from forwarding and saving
     * @return The current instance of the <<TelegramForwardOptions>> class
     */
    global TelegramForwardOptions withProtectedContent() {
        return (TelegramForwardOptions) setProtectedContent();
    }
}
