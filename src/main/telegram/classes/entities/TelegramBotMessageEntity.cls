public class TelegramBotMessageEntity extends ValueMap implements IBotMessageEntity {
    public String getId() {
        return getString('message_id');
    }

    public String getText() {
        return getString('text');
    }

    public DateTime getSendDate() {
        return getDateTime('date');
    }
}
