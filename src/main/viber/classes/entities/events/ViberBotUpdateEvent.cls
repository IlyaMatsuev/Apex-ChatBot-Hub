/**
 * @description Describes the payload received as an update from a `Viber` bot
 */
global class ViberBotUpdateEvent extends BotJsonPayload implements IBotUpdateEvent {
    /**
     * @description Returns the type of the received `Viber` update
     * @return The instance of the <<ViberBotUpdateEventType>> enum
     */
    global ViberBotUpdateEventType getType() {
        return ViberBotUpdateEventType.valueOf(getString('event'));
    }

    /**
     * @description Returns the `Viber` message payload received in the update. Can be null
     * @return The instance of the <<ViberBotMessage>> interface
     */
    global ViberBotMessage getMessage() {
        BotJsonPayload message = getJsonPayload('message', ViberBotMessage.class);
        // Set timestamp and message id to the message payload so that they can be accessed from IBotMessage
        message.set('timestamp', getLong('timestamp')).set('message_id', getString('message_token'));
        return (ViberBotMessage) message;
    }

    /**
     * @description Returns the `Viber` chat payload received in the update
     * @return The instance of the <<ViberBotChat>> interface
     */
    global ViberBotChat getChat() {
        String chatField = has('user') ? 'user' : 'sender';
        return (ViberBotChat) getJsonPayload(chatField, ViberBotChat.class);
    }
}
