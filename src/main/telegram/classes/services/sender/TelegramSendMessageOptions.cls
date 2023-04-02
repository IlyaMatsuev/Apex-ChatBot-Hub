/**
 * @description The builder-like class that describes common optional parameters of the `Telegram` for sending messages
 */
global abstract class TelegramSendMessageOptions extends ValueMap {
    private final String entitiesFieldName;

    /**
     * @description The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.
     */
    global List<MessageEntity> entities {
        get { return (List<MessageEntity>) get(entitiesFieldName); }
        private set { set(entitiesFieldName, value); }
    }

    /**
     * @description Creates an instance of the message options
     */
    global TelegramSendMessageOptions() {
        this('entities');
    }

    protected TelegramSendMessageOptions(String entitiesFieldName) {
        this.entitiesFieldName = entitiesFieldName;
    }

    protected TelegramSendMessageOptions setThreadId(String threadId) {
        set('message_thread_id', BotUtils.parseExternalId(threadId), true);
        return this;
    }

    protected TelegramSendMessageOptions setParseMode(String mode) {
        set('parse_mode', mode, true);
        return this;
    }

    protected TelegramSendMessageOptions addMessageEntities(MessageEntity[] entities) {
        if (this.entities == null) {
            this.entities = new List<MessageEntity>();
        }
        this.entities.addAll(entities);
        return this;
    }

    protected TelegramSendMessageOptions disableNotification() {
        set('disable_notification', true);
        return this;
    }

    protected TelegramSendMessageOptions setProtectedContent() {
        set('protect_content', true);
        return this;
    }

    protected TelegramSendMessageOptions setReplyMessageId(String messageId) {
        set('reply_to_message_id', BotUtils.parseExternalId(messageId), true);
        set('allow_sending_without_reply', true);
        return this;
    }

    /**
     * @description The builder-like class representing a special entity in a message text. For example, hashtags, usernames, etc. The source: https://core.telegram.org/bots/api#messageentity
     */
    global class MessageEntity extends ValueMap {
        /**
         * @description Creates an instance of the message entity with the provided type and coordinates in the message text
         * @param type The type of the entity. Possible values: `mention`, `hashtag`, `cashtag`, `bot_command`, `url`, `email`, `phone_number`, `bold`, `italic`, `underline`, `strikethrough`, `spoiler`, `code`, `pre`, `text_link`, `text_mention`, `custom_emoji`
         * @param offset The offset to start of the message entity
         * @param length The length of the entity
         */
        global MessageEntity(String type, Integer offset, Integer length) {
            set('type', type);
            set('offset', offset);
            set('length', length);
        }

        /**
         * @description Sets the message entity as a link. Works with `text_link` type
         * @param url The URL that will be opened when the user taps the text
         * @return The current instance of the message entity
         */
        global MessageEntity asUrl(String url) {
            set('url', url, true);
            return this;
        }

        /**
         * @description Sets the message entity as a user mention. Works with `text_mention` type
         * @param userId The `Telegram` id of the user that needs to be mentioned
         * @return The current instance of the message entity
         */
        global MessageEntity asUserMention(String userId) {
            set('user', new ValueMap().set('id', BotUtils.parseExternalId(userId)));
            return this;
        }

        /**
         * @description Sets the message entity as a programming language syntax highlighting. Works with `pre` type
         * @param language The programing language to use syntax for
         * @return The current instance of the message entity
         */
        global MessageEntity asProgrammingLanguage(String language) {
            set('language', language, true);
            return this;
        }

        /**
         * @description Sets the message entity as a custom emoji. Works with `custom_emoji` type
         * @param emojiId The custom emoji id
         * @return The current instance of the message entity
         */
        global MessageEntity asCustomEmoji(String emojiId) {
            set('custom_emoji_id', emojiId, true);
            return this;
        }
    }
}
