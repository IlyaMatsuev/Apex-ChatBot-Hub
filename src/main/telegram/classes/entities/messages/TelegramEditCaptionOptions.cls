/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `editMessageCaption` method.
 * Source: https://core.telegram.org/bots/api#editmessagecaption
 */
global class TelegramEditCaptionOptions extends TelegramSendMessageOptions {
    public TelegramEditCaptionOptions() {
        super('caption_entities');
    }

    /**
     * @description Sets the new message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramEditCaptionOptions>> class
     */
    global TelegramEditCaptionOptions withParseMode(String mode) {
        return (TelegramEditCaptionOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramEditCaptionOptions>> class
     */
    global TelegramEditCaptionOptions withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramEditCaptionOptions>> class
     */
    global TelegramEditCaptionOptions withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramEditCaptionOptions) addMessageEntities(entities);
    }
}
