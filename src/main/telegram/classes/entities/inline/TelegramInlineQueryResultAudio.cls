/**
 * @description Describes the audio result payload that can be attached as part of answer to a `Telegram` bot inline query
 * Source: https://core.telegram.org/bots/api#inlinequeryresultaudio
 */
global class TelegramInlineQueryResultAudio extends TelegramInlineQueryResult {
    /**
     * @description The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramMessageEntity> captionEntities {
        get { return (List<TelegramMessageEntity>) payload.get('caption_entities'); }
        private set { payload.set('caption_entities', value); }
    }

    /**
     * @description Creates a new instance of the audio inline query result with the provided result id and audio URL/file id
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param audioUrlOrFileId The valid audio URL or `Telegram` file id
     */
    global TelegramInlineQueryResultAudio(String id, String audioUrlOrFileId) {
        super(id, 'audio');
        if (BotUtils.isUrl(audioUrlOrFileId)) {
            payload.set('audio_url', audioUrlOrFileId);
        } else {
            payload.set('audio_file_id', audioUrlOrFileId);
        }
    }

    /**
     * @description Sets the caption for the audio to be sent
     * @param caption The audio caption, `0-1024 characters`
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withCaption(String caption) {
        payload.set('caption', caption);
        return this;
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the audio duration
     * @param duration The audio duration
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withDuration(Integer duration) {
        payload.set('audio_duration', duration);
        return this;
    }

    /**
     * @description Sets the performer
     * @param performer The track performer
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withPerformer(String performer) {
        payload.set('performer', performer);
        return this;
    }

    /**
     * @description Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withParseMode(String mode) {
        payload.set('parse_mode', mode);
        return this;
    }

    /**
     * @description Adds a special entity that appear in the caption text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the caption text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withMessageEntities(TelegramMessageEntity[] entities) {
        if (this.captionEntities == null) {
            this.captionEntities = new List<TelegramMessageEntity>();
        }
        this.captionEntities.addAll(entities);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultAudio) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the audio
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultAudio>> class
     */
    global TelegramInlineQueryResultAudio withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultAudio) addInputMessage(messageContent);
    }
}
