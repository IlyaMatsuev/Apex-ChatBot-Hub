/**
 * @description Describes the common payload properties for the `Telegram` bot callback query events.
 * Source: https://core.telegram.org/bots/api#callbackquery
 */
global class TelegramCallbackQueryEvent extends BotPayload {
    /**
     * @description The unique identifier for this query
     */
    global String id { get { return payload.getString('id'); } }

    /**
     * @description The sender
     */
    global TelegramUser sender { get { return new TelegramUser(payload.getJsonPayload('from')); } }

    /**
     * @description The message with the callback button that originated the query
     */
    global TelegramMessage message { get { return new TelegramMessage(payload.getJsonPayload('message')); } }

    /**
     * @description The identifier of the message sent via the bot in inline mode, that originated the query
     */
    global String inlineMessageId { get { return payload.getString('inline_message_id'); } }

    /**
     * @description The global identifier, uniquely corresponding to the chat to which the message with the callback button was sent
     */
    global String chatInstance { get { return payload.getString('chat_instance'); } }

    /**
     * @description The data associated with the callback button
     */
    global String data { get { return payload.getString('data'); } }

    public TelegramCallbackQueryEvent(BotJsonPayload payload) {
        super(payload);
    }
}
