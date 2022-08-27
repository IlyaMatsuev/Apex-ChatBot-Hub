public interface IBotUpdateEntity extends IBotEntity {
    IBotMessageEntity getMessage();
    IBotUserEntity getSender();
    IBotChatEntity getChat();
}
