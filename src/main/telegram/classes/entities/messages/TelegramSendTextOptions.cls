/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendMessage` method.
 * Source: https://core.telegram.org/bots/api#sendmessage
 */
global class TelegramSendTextOptions extends TelegramSendMessageOptions {
    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions withThreadId(String threadId) {
        return (TelegramSendTextOptions) setThreadId(threadId);
    }

    /**
     * @description Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions withParseMode(String mode) {
        return (TelegramSendTextOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramSendTextOptions) addMessageEntities(entities);
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions withoutNotification() {
        return (TelegramSendTextOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions withProtectedContent() {
        return (TelegramSendTextOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions asReplyToMessage(String messageId) {
        return (TelegramSendTextOptions) setReplyMessageId(messageId);
    }

    /**
     * @description Disables link previews for links in this message
     * @return The current instance of the <<TelegramSendTextOptions>> class
     */
    global TelegramSendTextOptions withoutLinksPreview() {
        payload.set('disable_web_page_preview', true);
        return this;
    }
}
