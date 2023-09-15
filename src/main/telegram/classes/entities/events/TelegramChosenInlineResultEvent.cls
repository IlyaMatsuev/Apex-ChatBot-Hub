/**
 * @description Describes the common payload properties for the `Telegram` bot chosen inline result events
 * Source: https://core.telegram.org/bots/api#choseninlineresult
 */
global class TelegramChosenInlineResultEvent extends BotPayload {
    /**
     * @description The unique identifier for the result that was chosen
     */
    global String resultId { get { return payload.getString('result_id'); } }

    /**
     * @description The user that chose the result
     */
    global TelegramUser sender { get { return new TelegramUser(payload.getJsonPayload('from')); } }

    /**
     * @description The sender location, only for bots that require user location
     */
    global TelegramLocation location { get { return new TelegramLocation(payload.getJsonPayload('location')); } }

    /**
     * @description The identifier of the sent inline message. Available only if there is an inline keyboard attached to the message
     */
    global String inlineMessageId { get { return payload.getString('inline_message_id'); } }

    /**
     * @description The query that was used to obtain the result
     */
    global String query { get { return payload.getString('query'); } }

    public TelegramChosenInlineResultEvent(BotJsonPayload payload) {
        super(payload);
    }
}
