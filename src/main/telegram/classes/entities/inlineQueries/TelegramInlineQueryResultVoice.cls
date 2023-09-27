/**
 * @description Describes the voice result payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inlinequeryresultvoice
 */
global class TelegramInlineQueryResultVoice extends TelegramInlineQueryResult {
    /**
     * @description The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.
     */
    global List<TelegramMessageEntity> captionEntities {
        get { return (List<TelegramMessageEntity>) payload.get('caption_entities'); }
        private set { payload.set('caption_entities', value); }
    }

    /**
     * @description Creates a new instance of the voice inline query result with the provided result id and voice URL/file id
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param voiceUrlOrFileId The valid voice URL or `Telegram` file id
     */
    global TelegramInlineQueryResultVoice(String id, String voiceUrlOrFileId) {
        super(id, 'voice');
        if (BotUtils.isUrl(voiceUrlOrFileId)) {
            payload.set('voice_url', voiceUrlOrFileId);
        } else {
            payload.set('voice_file_id', voiceUrlOrFileId);
        }
    }

    /**
     * @description Sets the caption for the voice to be sent
     * @param caption The voice caption, `0-1024 characters`
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withCaption(String caption) {
        payload.set('caption', caption);
        return this;
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the voice duration
     * @param duration The voice duration
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withDuration(Integer duration) {
        payload.set('voice_duration', duration);
        return this;
    }

    /**
     * @description Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withParseMode(String mode) {
        payload.set('parse_mode', mode);
        return this;
    }

    /**
     * @description Adds a special entity that appear in the caption text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the caption text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withMessageEntities(TelegramMessageEntity[] entities) {
        if (this.captionEntities == null) {
            this.captionEntities = new List<TelegramMessageEntity>();
        }
        this.captionEntities.addAll(entities);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultVoice) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the voice
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultVoice>> class
     */
    global TelegramInlineQueryResultVoice withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultVoice) addInputMessage(messageContent);
    }
}
