/**
 * @description Describes the basic result payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inlinequeryresult
 */
global abstract class TelegramInlineQueryResult extends BotPayload {
    protected TelegramInlineQueryResult(String id, String type) {
        payload.set('id', id);
        payload.set('type', type);
    }

    protected TelegramInlineQueryResult addInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        payload.set('reply_markup', keyboard);
        return this;
    }

    protected TelegramInlineQueryResult addInputMessage(TelegramInputMessageContent messageContent) {
        payload.set('input_message_content', messageContent);
        return this;
    }
}
