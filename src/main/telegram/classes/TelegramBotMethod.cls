public class TelegramBotMethod extends BotMethod {
    public static final TelegramBotMethod SetWebhook = new TelegramBotMethod('setWebhook');
    public static final TelegramBotMethod DeleteWebhook = new TelegramBotMethod('deleteWebhook');
    public static final TelegramBotMethod SendMessage = new TelegramBotMethod('sendMessage');
    public static final TelegramBotMethod SendPhoto = new TelegramBotMethod('sendPhoto');
    public static final TelegramBotMethod SendVideo = new TelegramBotMethod('sendVideo');
    public static final TelegramBotMethod SendDocument = new TelegramBotMethod('sendDocument');
    public static final TelegramBotMethod SendContact = new TelegramBotMethod('sendContact');
    public static final TelegramBotMethod SendLocation = new TelegramBotMethod('sendLocation');
    public static final TelegramBotMethod SendSticker = new TelegramBotMethod('sendSticker');

    private TelegramBotMethod(String value) {
        super(value, TelegramBotMethod.class);
    }

    public static TelegramBotMethod valueOf(String value) {
        return (TelegramBotMethod) BotEnumType.valueOf(value, TelegramBotMethod.class);
    }
}
