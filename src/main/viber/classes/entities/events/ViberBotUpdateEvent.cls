/**
 * @description Describes the payload received as an update from a `Viber` bot
 */
global class ViberBotUpdateEvent extends BotPayload implements IBotUpdateEvent {
    /**
     * @description Returns the type of the received `Viber` update
     * @return The instance of the <<ViberBotUpdateEventType>> enum
     */
    global ViberBotUpdateEventType getType() {
        return ViberBotUpdateEventType.valueOf(payload.getString('event'));
    }

    /**
     * @description Returns the `Viber` message payload received in the update. Can be `null` in case of another update type
     * @return The instance of the <<ViberBotMessage>> class
     */
    global ViberBotMessage getMessage() {
        if (getType() != ViberBotUpdateEventType.Message) {
            return null;
        }

        BotJsonPayload message = payload.getJsonPayload('message');
        // Set timestamp and message id to the message payload so that they can be accessed from IBotMessage
        message.set('timestamp', payload.getLong('timestamp')).set('message_id', payload.getString('message_token'));

        return new ViberBotMessage(message);
    }

    /**
     * @description Returns the `Viber` chat payload received in the update. Can be null if the received update does not contain chat information
     * @return The instance of the <<ViberBotChat>> class
     */
    global ViberBotChat getChat() {
        if (!payload.has('user') && !payload.has('sender')) {
            return null;
        }
        return new ViberBotChat(payload.getJsonPayload(payload.has('user') ? 'user' : 'sender'));
    }

    /**
     * @description Returns the source JSON payload of the update event
     * @return The instance of the <<BotJsonPayload>>
     */
    global BotJsonPayload getPayload() {
        return getJsonPayload();
    }
}
