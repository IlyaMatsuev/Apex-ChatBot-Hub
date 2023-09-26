/**
 * @description Describes the input photo media payload that can be attached as part of `send` or `edit` `Telegram` bot methods
 * Source: https://core.telegram.org/bots/api#inputmediaphoto
 */
global class TelegramInputMediaPhoto extends TelegramInputMedia {
    /**
     * @description Creates a new instance of input photo media with the provided URL or file id
     * @param media The `Telegram` file id or the URL to the photo
     */
    global TelegramInputMediaPhoto(String media) {
        super('photo', media);
    }

    /**
     * @description Sets the caption for the image
     * @param caption The text to attach to the image
     * @return The current instance of the <<TelegramInputMediaPhoto>> class
     */
    global TelegramInputMediaPhoto withCaption(String caption) {
        return (TelegramInputMediaPhoto) addCaption(caption);
    }

    /**
     * @description Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInputMediaPhoto>> class
     */
    global TelegramInputMediaPhoto withParseMode(String mode) {
        return (TelegramInputMediaPhoto) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaPhoto>> class
     */
    global TelegramInputMediaPhoto withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaPhoto>> class
     */
    global TelegramInputMediaPhoto withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramInputMediaPhoto) addMessageEntities(entities);
    }

    /**
     * @description Marks the media that it has a spoiler
     * @return The current instance of the <<TelegramInputMediaPhoto>> class
     */
    global TelegramInputMediaPhoto withSpoiler() {
        return (TelegramInputMediaPhoto) addSpoiler();
    }
}
