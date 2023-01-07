public class TelegramBotMethod extends BotMethod {
    public static final TelegramBotMethod SetWebhook = new TelegramBotMethod('setWebhook');
    public static final TelegramBotMethod DeleteWebhook = new TelegramBotMethod('deleteWebhook');
    public static final TelegramBotMethod SendMessage = new TelegramBotMethod('sendMessage');

    private TelegramBotMethod(String value) {
        super(value);
    }
}
