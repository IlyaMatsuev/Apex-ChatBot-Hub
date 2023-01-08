// All available values: delivered, seen, failed, subscribed, unsubscribed, conversation_started, message
// Https://developers.viber.com/docs/api/rest-bot-api/#setting-a-webhook
public class ViberBotUpdateEventType extends BotUpdateEventType {
    public static final ViberBotUpdateEventType WebhookCallback = new ViberBotUpdateEventType('webhook');
    public static final ViberBotUpdateEventType Message = new ViberBotUpdateEventType('message');

    private ViberBotUpdateEventType(String value) {
        super(value, ViberBotUpdateEventType.class);
    }

    public static ViberBotUpdateEventType valueOf(String value) {
        return (ViberBotUpdateEventType) BotEnumType.valueOf(value, ViberBotUpdateEventType.class);
    }
}
