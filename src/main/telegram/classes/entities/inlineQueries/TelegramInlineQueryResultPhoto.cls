/**
 * @description Describes the photo result payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inlinequeryresultphoto
 */
global class TelegramInlineQueryResultPhoto extends TelegramInlineQueryResult {
    /**
     * @description The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramMessageEntity> captionEntities {
        get { return (List<TelegramMessageEntity>) payload.get('caption_entities'); }
        private set { payload.set('caption_entities', value); }
    }

    /**
     * @description Creates a new instance of the photo inline query result with the provided result id and photo URL/file id
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param photoUrlOrFileId The valid photo URL or `Telegram` file id
     */
    global TelegramInlineQueryResultPhoto(String id, String photoUrlOrFileId) {
        super(id, 'photo');
        if (BotUtils.isUrl(photoUrlOrFileId)) {
            payload.set('photo_url', photoUrlOrFileId);
        } else {
            payload.set('photo_file_id', photoUrlOrFileId);
        }
    }

    /**
     * @description Sets the photo thumbnail
     * @param url The thumbnail URL
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withThumbnail(String url) {
        payload.set('thumbnail_url', url);
        return this;
    }

    /**
     * @description Sets width and height for the photo
     * @param width The photo width
     * @param height The photo height
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withSizes(Integer width, Integer height) {
        payload.set('photo_width', width);
        payload.set('photo_height', height);
        return this;
    }

    /**
     * @description Sets the short description for the inline result
     * @param description The description of the result
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withDescription(String description) {
        payload.set('description', description);
        return this;
    }

    /**
     * @description Sets the caption for the photo to be sent
     * @param caption The photo caption, `0-1024 characters`
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withCaption(String caption) {
        payload.set('caption', caption);
        return this;
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withParseMode(String mode) {
        payload.set('parse_mode', mode);
        return this;
    }

    /**
     * @description Adds a special entity that appear in the caption text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the caption text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withMessageEntities(TelegramMessageEntity[] entities) {
        if (this.captionEntities == null) {
            this.captionEntities = new List<TelegramMessageEntity>();
        }
        this.captionEntities.addAll(entities);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultPhoto) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the photo
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultPhoto>> class
     */
    global TelegramInlineQueryResultPhoto withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultPhoto) addInputMessage(messageContent);
    }
}
