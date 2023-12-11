/**
 * @description Describes the input text message payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inputtextmessagecontent
 */
global class TelegramInputTextMessageContent extends TelegramInputMessageContent {
    /**
     * @description The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramMessageEntity> entities {
        get { return (List<TelegramMessageEntity>) payload.get('entities'); }
        private set { payload.set('entities', value); }
    }

    /**
     * @description Creates a new instance of the input message with the provided message text
     * @param text The text of the message, `1-4096 characters`
     */
    global TelegramInputTextMessageContent(String text) {
        payload.set('message_text', text);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramInputTextMessageContent withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendFileOptions>> class
     */
    global TelegramInputTextMessageContent withMessageEntities(TelegramMessageEntity[] entities) {
        if (this.entities == null) {
            this.entities = new List<TelegramMessageEntity>();
        }
        this.entities.addAll(entities);
        return this;
    }

    /**
     * @description Sets the message text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInputTextMessageContent>> class
     */
    global TelegramInputTextMessageContent withParseMode(String mode) {
        payload.set('parse_mode', mode, true);
        return this;
    }

    /**
     * @description Disables link previews for links in the sent message
     * @return The current instance of the <<TelegramInputTextMessageContent>> class
     */
    global TelegramInputTextMessageContent disableWebPagePreview() {
        payload.set('disable_web_page_preview', true);
        return this;
    }
}
