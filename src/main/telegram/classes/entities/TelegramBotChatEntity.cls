public class TelegramBotChatEntity extends ValueMap implements IBotChatEntity {
    public String getId() {
        return getString('id');
    }

    public String getTitle() {
        if (has('title')) {
            return getString('title');
        } else if (has('first_name') || has('last_name')) {
            String firstName = getValueOrEmptyString(getString('first_name'));
            String lastName = getValueOrEmptyString(getString('last_name'));
            return (firstName + ' ' + lastName).trim();
        }
        return getString('username');
    }

    public IBotUserEntity getSender() {
        return (IBotUserEntity) getValueMap('user');
    }

    private String getValueOrEmptyString(String value) {
        return String.isBlank(value) ? '' : value;
    }
}
