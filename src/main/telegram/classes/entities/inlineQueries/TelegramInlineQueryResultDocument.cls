/**
 * @description Describes the document result payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inlinequeryresultdocument
 */
global class TelegramInlineQueryResultDocument extends TelegramInlineQueryResult {
    /**
     * @description The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramMessageEntity> captionEntities {
        get { return (List<TelegramMessageEntity>) payload.get('caption_entities'); }
        private set { payload.set('caption_entities', value); }
    }

    /**
     * @description Creates a new instance of the document inline query result with the provided result id and document URL/file id
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param documentUrlOrFileId The valid document URL or `Telegram` file id
     */
    global TelegramInlineQueryResultDocument(String id, String documentUrlOrFileId) {
        super(id, 'document');
        if (BotUtils.isUrl(documentUrlOrFileId)) {
            payload.set('document_url', documentUrlOrFileId);
        } else {
            payload.set('document_file_id', documentUrlOrFileId);
        }
    }

    /**
     * @description Sets the caption for the document to be sent
     * @param caption The document caption, `0-1024 characters`
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withCaption(String caption) {
        payload.set('caption', caption);
        return this;
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the short description for the inline result
     * @param description The description of the result
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withDescription(String description) {
        payload.set('description', description);
        return this;
    }

    /**
     * @description Sets the MIME type of the content of the file, either `application/pdf` or `application/zip`
     * @param mimeType The MIME type of the content of the file, either `application/pdf` or `application/zip`
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withMimeType(String mimeType) {
        payload.set('mime_type', mimeType);
        return this;
    }

    /**
     * @description Sets the thumbnail for the inline result
     * @param url The thumbnail URL
     * @param width The thumbnail width
     * @param height The thumbnail height
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withThumbnail(String url, Integer width, Integer height) {
        payload.set('thumbnail_url', url);
        payload.set('thumbnail_width', width, true);
        payload.set('thumbnail_height', height, true);
        return this;
    }

    /**
     * @description Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withParseMode(String mode) {
        payload.set('parse_mode', mode);
        return this;
    }

    /**
     * @description Adds a special entity that appear in the caption text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the caption text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withMessageEntities(TelegramMessageEntity[] entities) {
        if (this.captionEntities == null) {
            this.captionEntities = new List<TelegramMessageEntity>();
        }
        this.captionEntities.addAll(entities);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultDocument) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the document
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultDocument>> class
     */
    global TelegramInlineQueryResultDocument withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultDocument) addInputMessage(messageContent);
    }
}
