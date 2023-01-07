public interface IBotUpdateEventEntity extends IBotEntity {
    BotUpdateEventType getType();
    IBotMessageEntity getMessage();
    IBotChatEntity getChat();
}
