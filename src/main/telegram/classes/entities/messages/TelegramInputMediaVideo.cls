/**
 * @description Describes the input video media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
 * Source: https://core.telegram.org/bots/api#inputmediavideo
 */
global class TelegramInputMediaVideo extends TelegramInputMedia {
    /**
     * @description Creates a new instance of input video media with the provided URL or file id
     * @param media The `Telegram` file id or the URL to the video
     */
    global TelegramInputMediaVideo(String media) {
        super('video', media);
    }

    /**
     * @description Sets the thumbnail for the video
     * @param thumbnail The URL to the JPEG image
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withThumbnail(String thumbnail) {
        return (TelegramInputMediaVideo) addThumbnail(thumbnail);
    }

    /**
     * @description Sets the caption for the video
     * @param caption The text to attach to the video
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withCaption(String caption) {
        return (TelegramInputMediaVideo) addCaption(caption);
    }

    /**
     * @description Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withParseMode(String mode) {
        return (TelegramInputMediaVideo) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramInputMediaVideo) addMessageEntities(entities);
    }

    /**
     * @description Sets the duration of the video
     * @param duration The duration of the video in seconds
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withDuration(Integer duration) {
        payload.set('duration', duration);
        return this;
    }

    /**
     * @description Sets the layout of the video by the provided width and height
     * @param width The width of the video
     * @param height The height of the video
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withLayout(Integer width, Integer height) {
        payload.set('width', width, true);
        payload.set('height', height, true);
        return this;
    }

    /**
     * @description Marks the video as suitable for streaming. Does not work for the `animation` message
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withStreamingSupport() {
        payload.set('supports_streaming', true);
        return this;
    }

    /**
     * @description Marks the media that it has a spoiler
     * @return The current instance of the <<TelegramInputMediaVideo>> class
     */
    global TelegramInputMediaVideo withSpoiler() {
        return (TelegramInputMediaVideo) addSpoiler();
    }
}
