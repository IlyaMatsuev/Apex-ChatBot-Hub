public class TelegramBotChat extends ValueMap implements IBotChatEntity {
    public Long getId() {
        return getLong('id');
    }

    public String getTitle() {
        return getString('title');
    }

    public String getFirstName() {
        return getString('first_name');
    }

    public String getLastName() {
        return getString('last_name');
    }

    public String getUsername() {
        return getString('username');
    }
}
