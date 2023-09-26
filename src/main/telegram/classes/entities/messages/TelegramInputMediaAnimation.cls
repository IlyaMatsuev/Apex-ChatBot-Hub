/**
 * @description Describes the input animation media payload that can be attached as part of `send` or `edit` `Telegram` bot methods
 * Source: https://core.telegram.org/bots/api#inputmediaanimation
 */
global class TelegramInputMediaAnimation extends TelegramInputMedia {
    /**
     * @description Creates a new instance of input animation media with the provided URL or file id
     * @param media The `Telegram` file id or the URL to the animation
     */
    global TelegramInputMediaAnimation(String media) {
        super('animation', media);
    }

    /**
     * @description Sets the thumbnail for the animation
     * @param thumbnail The URL to the JPEG image
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withThumbnail(String thumbnail) {
        return (TelegramInputMediaAnimation) addThumbnail(thumbnail);
    }

    /**
     * @description Sets the caption for the animation
     * @param caption The text to attach to the animation
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withCaption(String caption) {
        return (TelegramInputMediaAnimation) addCaption(caption);
    }

    /**
     * @description Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withParseMode(String mode) {
        return (TelegramInputMediaAnimation) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message caption. For example username tags
     * @param entity The instance of <<TelegramMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withMessageEntity(TelegramMessageEntity entity) {
        return withMessageEntities(new List<TelegramMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message caption. For example username tags
     * @param entities The list of <<TelegramMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withMessageEntities(TelegramMessageEntity[] entities) {
        return (TelegramInputMediaAnimation) addMessageEntities(entities);
    }

    /**
     * @description Sets the duration of the animation
     * @param duration The duration of the animation in seconds
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withDuration(Integer duration) {
        payload.set('duration', duration);
        return this;
    }

    /**
     * @description Sets the layout of the animation by the provided width and height
     * @param width The width of the animation
     * @param height The height of the animation
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withLayout(Integer width, Integer height) {
        payload.set('width', width, true);
        payload.set('height', height, true);
        return this;
    }

    /**
     * @description Marks the media that it has a spoiler
     * @return The current instance of the <<TelegramInputMediaAnimation>> class
     */
    global TelegramInputMediaAnimation withSpoiler() {
        return (TelegramInputMediaAnimation) addSpoiler();
    }
}
