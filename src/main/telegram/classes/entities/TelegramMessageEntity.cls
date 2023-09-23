/**
 * @description The builder-like class representing a special entity in a message text. For example, hashtags, usernames, etc.
 * Source: https://core.telegram.org/bots/api#messageentity
 */
global class TelegramMessageEntity extends BotPayload {
    /**
     * @description The type of the entity. Possible values: `mention`, `hashtag`, `cashtag`, `bot_command`, `url`, `email`, `phone_number`, `bold`, `italic`, `underline`, `strikethrough`, `spoiler`, `code`, `pre`, `text_link`, `text_mention`, `custom_emoji`
     */
    global String type { get { return payload.getString('type'); } private set { payload.set('type', value); } }

    /**
     * @description The offset in UTF-16 code units to the start of the entity
     */
    global Integer offset { get { return payload.getInteger('offset'); } private set { payload.set('offset', value); } }

    /**
     * @description The length of the entity in UTF-16 code units
     */
    global Integer length { get { return payload.getInteger('length'); } private set { payload.set('length', value); } }

    /**
     * @description For `text_link` only, URL that will be opened after user taps on the text
     */
    global String url { get { return payload.getString('url'); } private set { payload.set('url', value, true); } }

    /**
     * @description For `text_mention` only, the mentioned user
     */
    global TelegramUser user {
        get { return new TelegramUser(payload.getJsonPayload('user')); }
        private set { payload.set('user', value.getJsonPayload()); }
    }

    /**
     * @description For `pre` only, the programming language of the entity text
     */
    global String language {
        get { return payload.getString('language'); }
        private set { payload.set('language', value, true); }
    }

    /**
     * @description For `custom_emoji` only, unique identifier of the custom emoji
     */
    global String customEmojiId {
        get { return payload.getString('custom_emoji_id'); }
        private set { payload.set('custom_emoji_id', value, true); }
    }

    public TelegramMessageEntity(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Creates an instance of the message entity with the provided type and coordinates in the message text
     * @param type The type of the entity. Possible values: `mention`, `hashtag`, `cashtag`, `bot_command`, `url`, `email`, `phone_number`, `bold`, `italic`, `underline`, `strikethrough`, `spoiler`, `code`, `pre`, `text_link`, `text_mention`, `custom_emoji`
     * @param offset The offset to start of the message entity
     * @param length The length of the entity
     */
    global TelegramMessageEntity(String type, Integer offset, Integer length) {
        super();
        this.type = type;
        this.offset = offset;
        this.length = length;
    }

    /**
     * @description Sets the message entity as a link. Works with `text_link` type
     * @param url The URL that will be opened when the user taps the text
     * @return The current instance of the message entity
     */
    global TelegramMessageEntity asUrl(String url) {
        this.url = url;
        return this;
    }

    /**
     * @description Sets the message entity as a user mention. Works with `text_mention` type
     * @param userId The `Telegram` id of the user that needs to be mentioned
     * @return The current instance of the message entity
     */
    global TelegramMessageEntity asUserMention(String userId) {
        this.user = new TelegramUser(new BotJsonPayload().set('id', Long.valueOf(BotUtils.parseExternalId(userId))));
        return this;
    }

    /**
     * @description Sets the message entity as a programming language syntax highlighting. Works with `pre` type
     * @param language The programing language to use syntax for
     * @return The current instance of the message entity
     */
    global TelegramMessageEntity asProgrammingLanguage(String language) {
        this.language = language;
        return this;
    }

    /**
     * @description Sets the message entity as a custom emoji. Works with `custom_emoji` type
     * @param emojiId The custom emoji id
     * @return The current instance of the message entity
     */
    global TelegramMessageEntity asCustomEmoji(String emojiId) {
        this.customEmojiId = emojiId;
        return this;
    }
}
