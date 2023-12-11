/**
 * @description Describes the input audio media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
 * Source: https://core.telegram.org/bots/api#inputmediaaudio
 */
global class TelegramInputMediaAudio extends TelegramInputMedia {
    /**
     * @description Creates a new instance of input audio media with the provided URL or file id
     * @param media The `Telegram` file id or the URL to the audio
     */
    global TelegramInputMediaAudio(String media) {
        super('audio', media);
    }

    /**
     * @description Sets the thumbnail for the audio
     * @param thumbnail The URL to the JPEG image
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withThumbnail(String thumbnail) {
        return (TelegramInputMediaAudio) addThumbnail(thumbnail);
    }

    /**
     * @description Sets the caption for the audio
     * @param caption The text to attach to the audio
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withCaption(String caption) {
        return (TelegramInputMediaAudio) addCaption(caption);
    }

    /**
     * @description Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withParseMode(String mode) {
        return (TelegramInputMediaAudio) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message caption. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message caption. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramInputMediaAudio) addMessageEntities(entities);
    }

    /**
     * @description Sets the duration of the audio
     * @param duration The duration of the audio in seconds
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withDuration(Integer duration) {
        payload.set('duration', duration);
        return this;
    }

    /**
     * @description Sets the title of the audio
     * @param title The title of the audio
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the performer of the audio
     * @param performer The performer of the audio
     * @return The current instance of the <<TelegramInputMediaAudio>> class
     */
    global TelegramInputMediaAudio withPerformer(String performer) {
        payload.set('performer', performer);
        return this;
    }
}
