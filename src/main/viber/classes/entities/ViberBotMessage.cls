/**
 * @description Describes the message payload received as an update from a `Viber` bot
 */
global class ViberBotMessage extends BotPayload implements IBotMessage {
    public ViberBotMessage(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Viber` message id
     * @return The `Viber` message id
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
        return payload.getDateTime('timestamp');
    }
}