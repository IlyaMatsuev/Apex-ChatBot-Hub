// TODO: Remove IBotEntity extension since it's useless
public interface IBotUpdateEventEntity extends IBotEntity {
    BotUpdateEventType getType();
    IBotMessageEntity getMessage();
    IBotChatEntity getChat();
}
