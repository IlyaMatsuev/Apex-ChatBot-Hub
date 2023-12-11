/**
 * @description Describes the gif result payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inlinequeryresultgif, https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
 */
global class TelegramInlineQueryResultGif extends TelegramInlineQueryResult {
    /**
     * @description The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramMessageEntity> captionEntities {
        get { return (List<TelegramMessageEntity>) payload.get('caption_entities'); }
        private set { payload.set('caption_entities', value); }
    }

    private final String gifFieldPrefix;

    /**
     * @description Creates a new instance of the gif inline query result with the provided result id and gif URL/file id
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param gifUrlOrFileId The valid gif URL or `Telegram` file id
     */
    global TelegramInlineQueryResultGif(String id, String gifUrlOrFileId) {
        this(id, gifUrlOrFileId, false);
    }

    /**
     * @description Creates a new instance of the gif inline query result with the provided result id and gif URL/file id
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param gifUrlOrFileId The valid gif URL or `Telegram` file id
     * @param isMpeg4Gif Defines if the gif is of MPEG4 format
     */
    global TelegramInlineQueryResultGif(String id, String gifUrlOrFileId, Boolean isMpeg4Gif) {
        super(id, 'gif');
        this.gifFieldPrefix = isMpeg4Gif == true ? 'mpeg4' : 'gif';

        if (BotUtils.isUrl(gifUrlOrFileId)) {
            payload.set(gifFieldPrefix + '_url', gifUrlOrFileId);
        } else {
            payload.set(gifFieldPrefix + '_file_id', gifUrlOrFileId);
        }
    }

    /**
     * @description Sets the gif thumbnail
     * @param url The thumbnail URL
     * @param mimeType The MIME type of the thumbnail, must be one of `image/jpeg`, `image/gif`, or `video/mp4`. Defaults to `image/jpeg`
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withThumbnail(String url, String mimeType) {
        payload.set('thumbnail_url', url);
        payload.set('thumbnail_mime_type', mimeType);
        return this;
    }

    /**
     * @description Sets width and height for the gif
     * @param width The gif width
     * @param height The gif height
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withSizes(Integer width, Integer height) {
        payload.set(gifFieldPrefix + '_width', width);
        payload.set(gifFieldPrefix + '_height', height);
        return this;
    }

    /**
     * @description Sets the gif duration
     * @param duration The gif duration
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withDuration(Integer duration) {
        payload.set(gifFieldPrefix + '_duration', duration);
        return this;
    }

    /**
     * @description Sets the caption for the gif to be sent
     * @param caption The gif caption, `0-1024 characters`
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withCaption(String caption) {
        payload.set('caption', caption);
        return this;
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withParseMode(String mode) {
        payload.set('parse_mode', mode);
        return this;
    }

    /**
     * @description Adds a special entity that appear in the caption text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the caption text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withMessageEntities(TelegramMessageEntity[] entities) {
        if (this.captionEntities == null) {
            this.captionEntities = new List<TelegramMessageEntity>();
        }
        this.captionEntities.addAll(entities);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultGif) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the gif
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultGif>> class
     */
    global TelegramInlineQueryResultGif withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultGif) addInputMessage(messageContent);
    }
}
