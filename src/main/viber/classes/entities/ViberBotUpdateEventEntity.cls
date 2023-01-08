public class ViberBotUpdateEventEntity extends ValueMap implements IBotUpdateEventEntity {
    public String getId() {
        return getString('timestamp');
    }

    public BotUpdateEventType getType() {
        return ViberBotUpdateEventType.valueOf(getString('event'));
    }

    public IBotMessageEntity getMessage() {
        ValueMap message = getValueMap('message', ViberBotMessageEntity.class);
        // Set timestamp and message id to the message payload so that they can be accessed from IBotMessageEntity
        message.set('timestamp', getLong('timestamp')).set('message_id', getString('message_token'));
        return (IBotMessageEntity) message;
    }

    public IBotChatEntity getChat() {
        return (IBotChatEntity) getValueMap('sender', ViberBotChatEntity.class);
    }
}
