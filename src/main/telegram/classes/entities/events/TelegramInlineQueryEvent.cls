/**
 * @description Describes the common payload properties for the `Telegram` bot inline query events.
 * Source: https://core.telegram.org/bots/api#inlinequery
 */
global class TelegramInlineQueryEvent extends BotPayload {
    /**
     * @description The unique identifier for this query
     */
    global String id { get { return payload.getString('id'); } }

    /**
     * @description The sender of the inline query
     */
    global TelegramUser sender { get { return new TelegramUser(payload.getJsonPayload('from')); } }

    /**
     * @description The text of the query (up to `256` characters)
     */
    global String query { get { return payload.getString('query'); } }

    /**
     * @description The offset of the results to be returned, can be controlled by the bot
     */
    global String offset { get { return payload.getString('offset'); } }

    /**
     * @description The type of the chat from which the inline query was sent. Can be either `sender` for a private chat with the inline query sender, `private`, `group`, `supergroup`, or `channel`
     */
    global String chatType { get { return payload.getString('chat_type'); } }

    /**
     * @description The sender location, only for bots that request user location
     */
    global TelegramLocation location { get { return new TelegramLocation(payload.getJsonPayload('location')); } }

    public TelegramInlineQueryEvent(BotJsonPayload payload) {
        super(payload);
    }
}
