// All available types: https://core.telegram.org/bots/api#update
public class TelegramBotUpdateEventType extends BotUpdateEventType {
    public static final TelegramBotUpdateEventType Message = new TelegramBotUpdateEventType('message');
    public static final TelegramBotUpdateEventType EditedMessage = new TelegramBotUpdateEventType('edited_message');

    private TelegramBotUpdateEventType(String value) {
        super(value);
    }
}