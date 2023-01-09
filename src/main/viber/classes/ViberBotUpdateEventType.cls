/**
 * @description Custom enum class that contains all available event types for `Viber` bots
 * Possible values: `webhook`, `delivered`, `seen`, `failed`, `subscribed`, `unsubscribed`, `conversation_started`, `message`
 * Docs: https://developers.viber.com/docs/api/rest-bot-api/#setting-a-webhook
 */
global class ViberBotUpdateEventType extends BotUpdateEventType {
    /**
     * @descpirtion The `Viber` webhook callback event. Received when the webhook is set
     */
    global static final ViberBotUpdateEventType WebhookCallback = new ViberBotUpdateEventType('webhook');
    /**
     * @descpirtion The `Viber` message event. Received when a user sends a message to the bot
     */
    global static final ViberBotUpdateEventType Message = new ViberBotUpdateEventType('message');

    private ViberBotUpdateEventType(String value) {
        super(value, ViberBotUpdateEventType.class);
    }

    public static ViberBotUpdateEventType valueOf(String value) {
        return (ViberBotUpdateEventType) BotEnumType.valueOf(value, ViberBotUpdateEventType.class);
    }
}
