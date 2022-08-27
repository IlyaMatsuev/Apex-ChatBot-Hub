public class TelegramBotMessage extends ValueMap implements IBotMessageEntity {
    public Long getId() {
        return getLong('message_id');
    }

    public String getText() {
        return getString('text');
    }

    public DateTime getSendDate() {
        return getDateTime('date');
    }
}
