public class ViberBotUpdateEventEntity extends ValueMap implements IBotUpdateEventEntity {
    public String getId() {
        return null;
    }

    public String getType() {
        // TODO: Check what is provided in the payload and decide on the event type. Available events:
        // - message
        // - delivered
        // - seen
        // - failed
        // - subscribed
        // - unsubscribed
        // - conversation_started
        return 'message';
    }

    public IBotMessageEntity getMessage() {
        return null;
    }

    public IBotChatEntity getChat() {
        return null;
    }
}
