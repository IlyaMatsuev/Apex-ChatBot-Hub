/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendVideoNote` method. The source: https://core.telegram.org/bots/api#sendvideonote
 */
global class TelegramSendVideoNoteOptions extends TelegramSendMessageOptions {
    /**
     * @description Sets the duration of the video
     * @param duration The duration of the video in seconds
     * @return The current instance of the <<TelegramSendVideoNoteOptions>> class
     */
    global TelegramSendVideoNoteOptions withDuration(Integer duration) {
        payload.set('duration', duration, true);
        return this;
    }

    /**
     * @description Sets the size of the video note, e.g. diameter of the video circle
     * @param length The diameter of the video
     * @return The current instance of the <<TelegramSendVideoNoteOptions>> class
     */
    global TelegramSendVideoNoteOptions withSize(Integer length) {
        payload.set('length', length, true);
        return this;
    }

    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendVideoNoteOptions>> class
     */
    global TelegramSendVideoNoteOptions withThreadId(String threadId) {
        return (TelegramSendVideoNoteOptions) setThreadId(threadId);
    }

    /**
     * @description Sets the thumbnail for the video
     * @param thumbnailUrl The URL to the JPEG image
     * @return The current instance of the <<TelegramSendVideoNoteOptions>> class
     */
    global TelegramSendVideoNoteOptions withThumbnail(String thumbnailUrl) {
        payload.set('thumbnail', thumbnailUrl, true);
        return this;
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendVideoNoteOptions>> class
     */
    global TelegramSendVideoNoteOptions withoutNotification() {
        return (TelegramSendVideoNoteOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendVideoNoteOptions>> class
     */
    global TelegramSendVideoNoteOptions withProtectedContent() {
        return (TelegramSendVideoNoteOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendVideoNoteOptions>> class
     */
    global TelegramSendVideoNoteOptions asReplyToMessage(String messageId) {
        return (TelegramSendVideoNoteOptions) setReplyMessageId(messageId);
    }
}
