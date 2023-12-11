/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `editMessageText` method.
 * Source: https://core.telegram.org/bots/api#editmessagetext
 */
global class TelegramEditTextOptions extends TelegramSendMessageOptions {
    /**
     * @description Sets the new message text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramEditTextOptions>> class
     */
    global TelegramEditTextOptions withParseMode(String mode) {
        return (TelegramEditTextOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramEditTextOptions>> class
     */
    global TelegramEditTextOptions withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramEditTextOptions>> class
     */
    global TelegramEditTextOptions withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramEditTextOptions) addMessageEntities(entities);
    }

    /**
     * @description Disables link previews for links in this message
     * @return The current instance of the <<TelegramEditTextOptions>> class
     */
    global TelegramEditTextOptions withoutLinksPreview() {
        payload.set('disable_web_page_preview', true);
        return this;
    }
}
