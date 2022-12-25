public class TelegramBotUser extends ValueMap implements IBotUserEntity {
    public String getId() {
        return getString('id');
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
