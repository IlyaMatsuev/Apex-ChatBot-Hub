public class ViberBotMethod extends BotMethod {
    public static final ViberBotMethod SetWebhook = new ViberBotMethod('set_webhook');
    public static final ViberBotMethod SendMessage = new ViberBotMethod('send_message');
    public static final ViberBotMethod BroadcastMessage = new ViberBotMethod('broadcast_message');
    public static final ViberBotMethod GetAccountInfo = new ViberBotMethod('get_account_info');
    public static final ViberBotMethod GetUserDetails = new ViberBotMethod('get_user_details');
    public static final ViberBotMethod GetOnline = new ViberBotMethod('get_online');

    private ViberBotMethod(String value) {
        super(value, ViberBotMethod.class);
    }
}
