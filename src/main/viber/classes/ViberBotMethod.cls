public class ViberBotMethod extends BotMethod {
    public static final ViberBotMethod SetWebhook = new ViberBotMethod('setWebhook');
    public static final ViberBotMethod SendMessage = new ViberBotMethod('send_message');

    private ViberBotMethod(String value) {
        super(value);
    }
}
