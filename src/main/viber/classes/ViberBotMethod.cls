public class ViberBotMethod extends BotMethod {
    public static final ViberBotMethod SetWebhook = new ViberBotMethod('set_webhook');
    public static final ViberBotMethod SendMessage = new ViberBotMethod('send_message');

    private ViberBotMethod(String value) {
        super(value, ViberBotMethod.class);
    }

    public static ViberBotMethod valueOf(String value) {
        return (ViberBotMethod) BotEnumType.valueOf(value, ViberBotMethod.class);
    }
}
