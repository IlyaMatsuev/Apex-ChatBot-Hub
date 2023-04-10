/**
 * @description Custom enum class that contains all available event types for `Viber` bots. Docs: https://developers.viber.com/docs/api/rest-bot-api/#setting-a-webhook.
 * @group Enums
 */
global class ViberBotUpdateEventType extends BotUpdateEventType {
    /**
     * @descpirtion The `Viber` webhook callback event. Received when the webhook is set
     */
    global static final ViberBotUpdateEventType WebhookCallback = new ViberBotUpdateEventType('webhook');
    /**
     * @descpirtion The `Viber` subscribe event. Received when a new user allows messages from the bot
     */
    global static final ViberBotUpdateEventType Subscribed = new ViberBotUpdateEventType('subscribed');
    /**
     * @descpirtion The `Viber` unsubscribe event. Received when a new user forbids messages from the bot
     */
    global static final ViberBotUpdateEventType Unsubscribed = new ViberBotUpdateEventType('unsubscribed');
    /**
     * @descpirtion The `Viber` message event. Received when a user sends a message to the bot
     */
    global static final ViberBotUpdateEventType Message = new ViberBotUpdateEventType('message');
    /**
     * @descpirtion The `Viber` message event. Received when a message sent by the bot is delivered
     */
    global static final ViberBotUpdateEventType Delivered = new ViberBotUpdateEventType('delivered');
    /**
     * @descpirtion The `Viber` message event. Received when a message sent by the bot is seen by the user
     */
    global static final ViberBotUpdateEventType Seen = new ViberBotUpdateEventType('seen');
    /**
     * @descpirtion The `Viber` fail event. Received when a sent message is failed because of some client's validations
     */
    global static final ViberBotUpdateEventType Failed = new ViberBotUpdateEventType('failed');

    private ViberBotUpdateEventType(String value) {
        super(value, ViberBotUpdateEventType.class);
    }

    public static ViberBotUpdateEventType valueOf(String value) {
        return (ViberBotUpdateEventType) BotEnumType.valueOf(value, ViberBotUpdateEventType.class);
    }
}
