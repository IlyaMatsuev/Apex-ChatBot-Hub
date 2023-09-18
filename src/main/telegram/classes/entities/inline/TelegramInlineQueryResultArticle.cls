/**
 * @description Describes the article result payload that can be attached as part of answer to a `Telegram` bot inline query
 * Source: https://core.telegram.org/bots/api#inlinequeryresultarticle
 */
global class TelegramInlineQueryResultArticle extends TelegramInlineQueryResult {
    /**
     * @description Creates a new instance of the article inline query result with the provided id
     * @param id The unique identifier for the result, `1-64 bytes`
     */
    global TelegramInlineQueryResultArticle(String id) {
        super(id, 'article');
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the URL for the inline result
     * @param url The URL of the result
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withUrl(String url) {
        return withUrl(url, null);
    }

    /**
     * @description Sets the content of the message to be sent
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withInputMessage(TelegramInputMessageContent messageContent) {
        payload.set('input_message_content', messageContent);
        return this;
    }

    /**
     * @description Sets the URL for the inline result
     * @param url The URL of the result
     * @param hidden `True` if you don't want the URL to be shown in the message
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withUrl(String url, Boolean hidden) {
        payload.set('url', url);
        payload.set('hide_url', hidden, true);
        return this;
    }

    /**
     * @description Sets the short description for the inline result
     * @param description The description of the result
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withDescription(String description) {
        payload.set('description', description);
        return this;
    }

    /**
     * @description Sets the thumbnail for the inline result
     * @param url The thumbnail URL
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withThumbnail(String url) {
        return withThumbnail(url, null, null);
    }

    /**
     * @description Sets the thumbnail for the inline result
     * @param url The thumbnail URL
     * @param width The thumbnail width
     * @param height The thumbnail height
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withThumbnail(String url, Integer width, Integer height) {
        payload.set('thumbnail_url', url);
        payload.set('thumbnail_width', width, true);
        payload.set('thumbnail_height', height, true);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultArticle>> class
     */
    global TelegramInlineQueryResultArticle withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        payload.set('reply_markup', keyboard);
        return this;
    }
}
