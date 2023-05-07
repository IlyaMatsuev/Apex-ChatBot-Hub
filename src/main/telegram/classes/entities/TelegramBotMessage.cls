/**
 * @description Describes the message payload received as an update from a `Telegram` bot
 */
global class TelegramBotMessage extends BotPayload implements IBotMessage {
    public TelegramBotMessage(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Telegram` message id
     * @return The `Telegram` message id
     */
    global String getId() {
        return payload.getString('message_id');
    }

    /**
     * @description Returns the message text
     * @return The message text
     */
    global String getText() {
        return payload.getString('text');
    }

    /**
     * @description Returns the message send date
     * @return The message send date
     */
    global DateTime getSendDate() {
        return payload.getDateTime('date');
    }
}
