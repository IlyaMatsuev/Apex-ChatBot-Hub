/**
 * @description Describes the video result payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inlinequeryresultvideo
 */
global class TelegramInlineQueryResultVideo extends TelegramInlineQueryResult {
    /**
     * @description The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramMessageEntity> captionEntities {
        get { return (List<TelegramMessageEntity>) payload.get('caption_entities'); }
        private set { payload.set('caption_entities', value); }
    }

    /**
     * @description Creates a new instance of the video inline query result with the provided result id and video URL/file id
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param videoUrlOrFileId The valid video URL or `Telegram` file id
     */
    global TelegramInlineQueryResultVideo(String id, String videoUrlOrFileId) {
        super(id, 'video');
        if (BotUtils.isUrl(videoUrlOrFileId)) {
            payload.set('video_url', videoUrlOrFileId);
        } else {
            payload.set('video_file_id', videoUrlOrFileId);
        }
    }

    /**
     * @description Sets the MIME type of the content of the video URL, `text/html` or `video/mp4`
     * @param mimeType The MIME type of the content of the video URL, `text/html` or `video/mp4`
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withMimeType(String mimeType) {
        payload.set('mime_type', mimeType);
        return this;
    }

    /**
     * @description Sets the video thumbnail
     * @param url The thumbnail URL
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withThumbnail(String url) {
        payload.set('thumbnail_url', url);
        return this;
    }

    /**
     * @description Sets width and height for the video
     * @param width The video width
     * @param height The video height
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withSizes(Integer width, Integer height) {
        payload.set('video_width', width);
        payload.set('video_height', height);
        return this;
    }

    /**
     * @description Sets the video duration
     * @param duration The video duration
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withDuration(Integer duration) {
        payload.set('video_duration', duration);
        return this;
    }

    /**
     * @description Sets the short description for the inline result
     * @param description The description of the result
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withDescription(String description) {
        payload.set('description', description);
        return this;
    }

    /**
     * @description Sets the caption for the video to be sent
     * @param caption The video caption, `0-1024 characters`
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withCaption(String caption) {
        payload.set('caption', caption);
        return this;
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withParseMode(String mode) {
        payload.set('parse_mode', mode);
        return this;
    }

    /**
     * @description Adds a special entity that appear in the caption text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the caption text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withMessageEntities(TelegramMessageEntity[] entities) {
        if (this.captionEntities == null) {
            this.captionEntities = new List<TelegramMessageEntity>();
        }
        this.captionEntities.addAll(entities);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultVideo) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the video
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultVideo>> class
     */
    global TelegramInlineQueryResultVideo withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultVideo) addInputMessage(messageContent);
    }
}
