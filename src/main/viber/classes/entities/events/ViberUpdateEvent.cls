/**
 * @description Describes the payload received as an update from a `Viber` bot
 */
global class ViberUpdateEvent extends BotPayload implements IBotUpdateEvent {
    /**
     * @description Returns the type of the received `Viber` update
     * @return The instance of the <<ViberUpdateEventType>> enum
     */
    global ViberUpdateEventType getType() {
        return ViberUpdateEventType.valueOf(payload.getString('event'));
    }

    /**
     * @description Returns the `Viber` message payload received in the update. Can be `null` in case of another update type
     * @return The instance of the <<ViberMessage>> class
     */
    global ViberMessage getMessage() {
        if (getType() != ViberUpdateEventType.Message) {
            return null;
        }

        BotJsonPayload message = payload.getJsonPayload('message');
        // Set timestamp and message id to the message payload so that they can be accessed from IBotMessage
        message.set('timestamp', payload.getLong('timestamp')).set('message_id', payload.getString('message_token'));

        return new ViberMessage(message);
    }

    /**
     * @description Returns the `Viber` chat payload received in the update. Can be null if the received update does not contain chat information
     * @return The instance of the <<ViberChat>> class
     */
    global ViberChat getChat() {
        if (!payload.has('user') && !payload.has('sender')) {
            return null;
        }
        return new ViberChat(payload.getJsonPayload(payload.has('user') ? 'user' : 'sender'));
    }

    /**
     * @description Returns the source JSON payload of the update event
     * @return The instance of the <<BotJsonPayload>>
     */
    global BotJsonPayload getPayload() {
        return getJsonPayload();
    }
}
