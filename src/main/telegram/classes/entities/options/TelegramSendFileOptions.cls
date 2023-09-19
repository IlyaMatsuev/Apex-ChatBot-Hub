/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendDocument` method. The source: https://core.telegram.org/bots/api#senddocument
 */
global class TelegramSendFileOptions extends TelegramSendMessageOptions {
    /**
     * @description Creates an instance of the file message options
     */
    global TelegramSendFileOptions() {
        super('caption_entities');
    }

    /**
     * @description Sets the text caption for the file
     * @param caption The text to attach to the file
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withCaption(String caption) {
        payload.set('caption', caption, true);
        return this;
    }

    /**
     * @description Sets the thumbnail for the file
     * @param thumbnailUrl The URL to the JPEG image
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withThumbnail(String thumbnailUrl) {
        payload.set('thumbnail', thumbnailUrl, true);
        return this;
    }

    /**
     * @description Disables automatic server-side content type detection
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withoutContentTypeDetection() {
        payload.set('disable_content_type_detection', true);
        return this;
    }

    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withThreadId(String threadId) {
        return (TelegramSendFileOptions) setThreadId(threadId);
    }

    /**
     * @description Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withParseMode(String mode) {
        return (TelegramSendFileOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramSendFileOptions) addMessageEntities(entities);
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withoutNotification() {
        return (TelegramSendFileOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions withProtectedContent() {
        return (TelegramSendFileOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramSendFileOptions asReplyToMessage(String messageId) {
        return (TelegramSendFileOptions) setReplyMessageId(messageId);
    }
}
