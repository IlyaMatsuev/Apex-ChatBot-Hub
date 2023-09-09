/**
 * @description The builder-like class that describes common optional parameters of the `Telegram` for sending messages
 */
global abstract class TelegramSendMessageOptions extends BotPayload {
    private final String entitiesFieldName;

    /**
     * @description The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramBotMessageEntity> entities {
        get { return (List<TelegramBotMessageEntity>) payload.get(entitiesFieldName); }
        private set { payload.set(entitiesFieldName, value); }
    }

    /**
     * @description Creates an instance of the message options
     */
    global TelegramSendMessageOptions() {
        this('entities');
    }

    protected TelegramSendMessageOptions(String entitiesFieldName) {
        super();
        this.entitiesFieldName = entitiesFieldName;
    }

    protected TelegramSendMessageOptions setThreadId(String threadId) {
        payload.set('message_thread_id', BotUtils.parseExternalId(threadId), true);
        return this;
    }

    protected TelegramSendMessageOptions setParseMode(String mode) {
        payload.set('parse_mode', mode, true);
        return this;
    }

    protected TelegramSendMessageOptions addMessageEntities(TelegramBotMessageEntity[] entities) {
        if (this.entities == null) {
            this.entities = new List<TelegramBotMessageEntity>();
        }
        this.entities.addAll(entities);
        return this;
    }

    protected TelegramSendMessageOptions disableNotification() {
        payload.set('disable_notification', true);
        return this;
    }

    protected TelegramSendMessageOptions setProtectedContent() {
        payload.set('protect_content', true);
        return this;
    }

    protected TelegramSendMessageOptions setReplyMessageId(String messageId) {
        payload.set('reply_to_message_id', BotUtils.parseExternalId(messageId), true);
        payload.set('allow_sending_without_reply', true);
        return this;
    }
}
