public class ViberBotMethod extends BotMethod {
    public static final ViberBotMethod SetWebhook = new ViberBotMethod('set_webhook');
    public static final ViberBotMethod SendMessage = new ViberBotMethod('send_message');
    public static final ViberBotMethod BroadcastMessage = new ViberBotMethod('broadcast_message');

    private ViberBotMethod(String value) {
        super(value, ViberBotMethod.class);
    }
}
