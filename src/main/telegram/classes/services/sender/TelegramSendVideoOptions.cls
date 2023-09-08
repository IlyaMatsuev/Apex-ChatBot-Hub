/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendVideo` and `sendAnimation` methods. The source: https://core.telegram.org/bots/api#sendvideo
 */
global class TelegramSendVideoOptions extends TelegramSendMessageOptions {
    /**
     * @description Creates an instance of the video message options
     */
    global TelegramSendVideoOptions() {
        super('caption_entities');
    }

    /**
     * @description Sets the text caption for the video
     * @param caption The text to attach to the video
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withCaption(String caption) {
        payload.set('caption', caption, true);
        return this;
    }

    /**
     * @description Marks the message that it has a spoiler
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withSpoiler() {
        payload.set('has_spoiler', true);
        return this;
    }

    /**
     * @description Sets the duration of the video
     * @param duration The duration of the video in seconds
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withDuration(Integer duration) {
        payload.set('duration', duration, true);
        return this;
    }

    /**
     * @description Sets the layout of the video by the provided width and height
     * @param width The width of the video
     * @param height The height of the video
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withLayout(Integer width, Integer height) {
        payload.set('width', width, true);
        payload.set('height', height, true);
        return this;
    }

    /**
     * @description Sets the thumbnail for the video
     * @param thumbnailUrl The URL to the JPEG image
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withThumbnail(String thumbnailUrl) {
        payload.set('thumbnail', thumbnailUrl, true);
        return this;
    }

    /**
     * @description Marks the video as suitable for streaming. Does not work for the `animation` message
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withStreamingSupport() {
        payload.set('supports_streaming', true);
        return this;
    }

    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withThreadId(String threadId) {
        return (TelegramSendVideoOptions) setThreadId(threadId);
    }

    /**
     * @description Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withParseMode(String mode) {
        return (TelegramSendVideoOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramSendMessageOptions.TelegramBotMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withMessageEntity(TelegramBotMessageEntity entity) {
        return withMessageEntities(new List<TelegramBotMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramSendMessageOptions.TelegramBotMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withMessageEntities(TelegramBotMessageEntity[] entities) {
        return (TelegramSendVideoOptions) addMessageEntities(entities);
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withoutNotification() {
        return (TelegramSendVideoOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions withProtectedContent() {
        return (TelegramSendVideoOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendVideoOptions>> class
     */
    global TelegramSendVideoOptions asReplyToMessage(String messageId) {
        return (TelegramSendVideoOptions) setReplyMessageId(messageId);
    }
}
