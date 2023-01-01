public class TelegramBotChatEntity extends ValueMap implements IBotChatEntity {
    public String getId() {
        return getString('id');
    }

    public String getTitle() {
        // TODO: If no title - firstName + lastName - or username
        return getString('title');
    }

    public IBotUserEntity getSender() {
        // TODO: Return user entity
        return null;
    }
}
