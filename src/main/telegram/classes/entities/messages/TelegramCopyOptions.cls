/**
 * @description Represents the optional parameters for the `Telegram` `copy` method.
 * Source: https://core.telegram.org/bots/api#copymessage
 */
global class TelegramCopyOptions extends TelegramSendMessageOptions {
    /**
     * @description Creates an instance of the copy message options
     */
    global TelegramCopyOptions() {
        super('caption_entities');
    }

    /**
     * @description Sets the new caption for the media
     * @param caption The new caption for the media
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions withCaption(String caption) {
        payload.set('caption', caption, true);
        return this;
    }

    /**
     * @description Sets the caption text parse mode. Needed when the caption text is formatted with HTML or Markdown markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions withParseMode(String mode) {
        return (TelegramCopyOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the caption text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the caption text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramCopyOptions) addMessageEntities(entities);
    }

    /**
     * @description Copies the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions asReplyToMessage(String messageId) {
        return (TelegramCopyOptions) setReplyMessageId(messageId);
    }

    /**
     * @description Sets the unique identifier for the target message thread (topic) of the forum; for forum supergroups only
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions withThreadId(String threadId) {
        return (TelegramCopyOptions) setThreadId(threadId);
    }

    /**
     * @description Copies the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions withoutNotification() {
        return (TelegramCopyOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the copied message from forwarding and saving
     * @return The current instance of the <<TelegramCopyOptions>> class
     */
    global TelegramCopyOptions withProtectedContent() {
        return (TelegramCopyOptions) setProtectedContent();
    }
}
