public interface IBotUpdateEventEntity {
    BotUpdateEventType getType();
    IBotMessageEntity getMessage();
    IBotChatEntity getChat();
}
