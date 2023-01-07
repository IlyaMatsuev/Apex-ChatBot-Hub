// TODO: Implement
public class ViberBotUpdateEventEntity extends ValueMap implements IBotUpdateEventEntity {
    public String getId() {
        return null;
    }

    public BotUpdateEventType getType() {
        return BotUpdateEventType.valueOf(getString('event'));
    }

    public IBotMessageEntity getMessage() {
        return null;
    }

    public IBotChatEntity getChat() {
        return null;
    }
}
