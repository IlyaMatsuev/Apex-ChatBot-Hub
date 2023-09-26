/**
 * @description Describes the article result payload that can be attached as part of answer to a `Telegram` bot inline query
 * Source: https://core.telegram.org/bots/api#inlinequeryresultarticle
 */
global class TelegramInlineQueryResultSticker extends TelegramInlineQueryResult {
    /**
     * @description Creates a new instance of the sticker inline query result with the provided result and sticker ids
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param stickerId The valid file identifier of the sticker
     */
    global TelegramInlineQueryResultSticker(String id, String stickerId) {
        super(id, 'sticker');
        payload.set('sticker_file_id', stickerId);
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultSticker>> class
     */
    global TelegramInlineQueryResultSticker withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultSticker) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the sticker
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultSticker>> class
     */
    global TelegramInlineQueryResultSticker withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultSticker) addInputMessage(messageContent);
    }
}
