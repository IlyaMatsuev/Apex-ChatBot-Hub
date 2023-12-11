/**
 * @description Describes the `Telegram` input sticker payload.
 * Source: https://core.telegram.org/bots/api#inputsticker
 */
global class TelegramInputSticker extends BotPayload {
    /**
     * @description Creates a new input sticker instance with the provided sticker URL or file id
     * @param fileIdOrUrl The sticker file Id or URL
     */
    global TelegramInputSticker(String fileIdOrUrl) {
        payload.set('sticker', fileIdOrUrl);
    }

    /**
     * @description Associates the provided emojis with the sticker
     * @param emojis The list of `1-20` emojis associated with the sticker
     * @return The current instance of the <<TelegramInputSticker>> class
     */
    global TelegramInputSticker withEmojis(List<String> emojis) {
        payload.set('emoji_list', emojis);
        return this;
    }

    /**
     * @description Associates the provided keywords with the sticker
     * @param keywords The list of `0-20` keywords associated with the sticker
     * @return The current instance of the <<TelegramInputSticker>> class
     */
    global TelegramInputSticker withKeywords(List<String> keywords) {
        payload.set('keywords', keywords, true);
        return this;
    }
}
