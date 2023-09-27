/**
 * @description Describes the input document media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
 * Source: https://core.telegram.org/bots/api#inputmediadocument
 */
global class TelegramInputMediaDocument extends TelegramInputMedia {
    /**
     * @description Creates a new instance of input document media with the provided URL or file id
     * @param media The `Telegram` file id or the URL to the audio
     */
    global TelegramInputMediaDocument(String media) {
        super('document', media);
    }

    /**
     * @description Sets the thumbnail for the file
     * @param thumbnail The URL to the JPEG image
     * @return The current instance of the <<TelegramInputMediaDocument>> class
     */
    global TelegramInputMediaDocument withThumbnail(String thumbnail) {
        return (TelegramInputMediaDocument) addThumbnail(thumbnail);
    }

    /**
     * @description Sets the caption for the file
     * @param caption The text to attach to the file
     * @return The current instance of the <<TelegramInputMediaDocument>> class
     */
    global TelegramInputMediaDocument withCaption(String caption) {
        return (TelegramInputMediaDocument) addCaption(caption);
    }

    /**
     * @description Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInputMediaDocument>> class
     */
    global TelegramInputMediaDocument withParseMode(String mode) {
        return (TelegramInputMediaDocument) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message caption. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaDocument>> class
     */
    global TelegramInputMediaDocument withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaDocument>> class
     */
    global TelegramInputMediaDocument withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramInputMediaDocument) addMessageEntities(entities);
    }

    /**
     * @description Disables the automatic server-side content type detection
     * @return The current instance of the <<TelegramInputMediaDocument>> class
     */
    global TelegramInputMediaDocument withoutContentTypeDetection() {
        payload.set('disable_content_type_detection', true);
        return this;
    }
}
