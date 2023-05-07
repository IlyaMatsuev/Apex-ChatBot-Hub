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

    // TODO: This can be null in some cases: Unsubscribed, Delivered, Seen, Failed
    /**
     * @description Returns the `Viber` chat payload received in the update
     * @return The instance of the <<ViberBotChat>> class
     */
    global ViberBotChat getChat() {
        String chatField = payload.has('user') ? 'user' : 'sender';
        return new ViberBotChat(payload.getJsonPayload(chatField));
    }

    /**
     * @description Returns the source JSON payload of the update event
     * @return The instance of the <<BotJsonPayload>>
     */
    global BotJsonPayload getPayload() {
        return getJsonPayload();
    }
}
