/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendAudio` and `sendVoice` methods. The sources: https://core.telegram.org/bots/api#sendaudio, https://core.telegram.org/bots/api#sendvoice
 */
global class TelegramSendAudioOptions extends TelegramSendMessageOptions {
    /**
     * @description Creates an instance of the audio message options
     */
    global TelegramSendAudioOptions() {
        super('caption_entities');
    }

    /**
     * @description Sets the text caption for the audio
     * @param caption The text to attach to the audio
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withCaption(String caption) {
        payload.set('caption', caption, true);
        return this;
    }

    /**
     * @description Sets the title and performer names for the audio. Does not work for the `voice` message
     * @param performer The performer of the track
     * @param title The title of the track
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withTrackName(String performer, String title) {
        payload.set('performer', performer, true);
        payload.set('title', title, true);
        return this;
    }

    /**
     * @description Sets the duration of the audio
     * @param duration The duration of the audio in seconds
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withDuration(Integer duration) {
        payload.set('duration', duration, true);
        return this;
    }

    /**
     * @description Sets the thumbnail for the audio
     * @param thumbnailUrl The URL to the JPEG image
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withThumbnail(String thumbnailUrl) {
        payload.set('thumbnail', thumbnailUrl, true);
        return this;
    }

    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withThreadId(String threadId) {
        return (TelegramSendAudioOptions) setThreadId(threadId);
    }

    /**
     * @description Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup
     * @param mode The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2`
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withParseMode(String mode) {
        return (TelegramSendAudioOptions) setParseMode(mode);
    }

    /**
     * @description Adds a special entity that appear in the message text. For example username tags
     * @param entity The instance of <<TelegramSendMessageOptions.TelegramBotMessageEntity>>, special message entity. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withMessageEntity(TelegramBotMessageEntity entity) {
        return withMessageEntities(new List<TelegramBotMessageEntity> { entity });
    }

    /**
     * @description Adds special entities that appear in the message text. For example username tags
     * @param entities The list of <<TelegramSendMessageOptions.TelegramBotMessageEntity>> instances, special message entities. E.g. hashtag, username, URL, etc.
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withMessageEntities(TelegramBotMessageEntity[] entities) {
        return (TelegramSendAudioOptions) addMessageEntities(entities);
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withoutNotification() {
        return (TelegramSendAudioOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions withProtectedContent() {
        return (TelegramSendAudioOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendAudioOptions>> class
     */
    global TelegramSendAudioOptions asReplyToMessage(String messageId) {
        return (TelegramSendAudioOptions) setReplyMessageId(messageId);
    }
}
