public class TelegramBotMethod extends BotMethod {
    /**
     * Webhook methods
     */
    public static final TelegramBotMethod SetWebhook = new TelegramBotMethod('setWebhook');
    public static final TelegramBotMethod DeleteWebhook = new TelegramBotMethod('deleteWebhook');

    /**
     * Sending methods
     */
    public static final TelegramBotMethod SendMessage = new TelegramBotMethod('sendMessage');
    public static final TelegramBotMethod SendPhoto = new TelegramBotMethod('sendPhoto');
    public static final TelegramBotMethod SendVideo = new TelegramBotMethod('sendVideo');
    public static final TelegramBotMethod SendVideoNote = new TelegramBotMethod('sendVideoNote');
    public static final TelegramBotMethod SendAudio = new TelegramBotMethod('sendAudio');
    public static final TelegramBotMethod SendVoice = new TelegramBotMethod('sendVoice');
    public static final TelegramBotMethod SendDocument = new TelegramBotMethod('sendDocument');
    public static final TelegramBotMethod SendMediaGroup = new TelegramBotMethod('sendMediaGroup');
    public static final TelegramBotMethod SendContact = new TelegramBotMethod('sendContact');
    public static final TelegramBotMethod SendLocation = new TelegramBotMethod('sendLocation');
    public static final TelegramBotMethod SendVenue = new TelegramBotMethod('sendVenue');
    public static final TelegramBotMethod SendSticker = new TelegramBotMethod('sendSticker');
    public static final TelegramBotMethod SendAnimation = new TelegramBotMethod('sendAnimation');
    public static final TelegramBotMethod SendPoll = new TelegramBotMethod('sendPoll');
    public static final TelegramBotMethod SendDice = new TelegramBotMethod('sendDice');
    public static final TelegramBotMethod SendChatAction = new TelegramBotMethod('sendChatAction');

    private TelegramBotMethod(String value) {
        super(value, TelegramBotMethod.class);
    }
}
