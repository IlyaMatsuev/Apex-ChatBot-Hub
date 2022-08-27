public class TelegramBotUpdate extends ValueMap implements IBotUpdateEntity {
    public Long getId() {
        return getLong('update_id');
    }

    public IBotMessageEntity getMessage() {
        return (IBotMessageEntity) getValueMap('message', TelegramBotMessage.class);
    }

    public IBotUserEntity getSender() {
        TelegramBotMessage message = (TelegramBotMessage) getMessage();
        return (IBotUserEntity) message.getValueMap('from', TelegramBotUser.class);
    }

    public IBotChatEntity getChat() {
        TelegramBotMessage message = (TelegramBotMessage) getMessage();
        return (IBotChatEntity) message.getValueMap('chat', TelegramBotChat.class);
    }
}
