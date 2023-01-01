public interface IBotUpdateEventEntity extends IBotEntity {
    // TODO: Decide on something that is not string. Maybe consider my own enum type
    String getType();
    IBotMessageEntity getMessage();
    IBotChatEntity getChat();
}
