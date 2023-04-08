/**
 * @description Describes the payload received as an update from a `Viber` bot
 */
global class ViberBotUpdateEventEntity extends ValueMap implements IBotUpdateEventEntity {
    /**
     * @description Returns the type of the received `Viber` update
     * @return The instance of the <<ViberBotUpdateEventType>> enum
     */
    global ViberBotUpdateEventType getType() {
        return ViberBotUpdateEventType.valueOf(getString('event'));
    }

    /**
     * @description Returns the `Viber` message payload received in the update. Can be null
     * @return The instance of the <<ViberBotMessageEntity>> interface
     */
    global ViberBotMessageEntity getMessage() {
        ValueMap message = getValueMap('message', ViberBotMessageEntity.class);
        // Set timestamp and message id to the message payload so that they can be accessed from IBotMessageEntity
        message.set('timestamp', getLong('timestamp')).set('message_id', getString('message_token'));
        return (ViberBotMessageEntity) message;
    }

    /**
     * @description Returns the `Viber` chat payload received in the update
     * @return The instance of the <<ViberBotChatEntity>> interface
     */
    global ViberBotChatEntity getChat() {
        return (ViberBotChatEntity) getValueMap('sender', ViberBotChatEntity.class);
    }
}
