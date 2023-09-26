/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendPhoto` method. The source: https://core.telegram.org/bots/api#sendphoto
 */
global class TelegramSendImageOptions extends TelegramSendMessageOptions {
    /**
     * @description Creates an instance of the image message options
     */
    global TelegramSendImageOptions() {
        super('caption_entities');
    }

    /**
     * @description Sets the text caption for the image
     * @param caption The text to attach to the image
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withCaption(String caption) {
        payload.set('caption', caption, true);
        return this;
    }

    /**
     * @description Marks the message that it has a spoiler
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withSpoiler() {
        payload.set('has_spoiler', true);
        return this;
    }

    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withThreadId(String threadId) {
        return (TelegramSendImageOptions) setThreadId(threadId);
    }

    /**
     * @description Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withParseMode(String mode) {
        return (TelegramSendImageOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramSendImageOptions) addMessageEntities(entities);
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withoutNotification() {
        return (TelegramSendImageOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions withProtectedContent() {
        return (TelegramSendImageOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendImageOptions>> class
     */
    global TelegramSendImageOptions asReplyToMessage(String messageId) {
        return (TelegramSendImageOptions) setReplyMessageId(messageId);
    }
}
