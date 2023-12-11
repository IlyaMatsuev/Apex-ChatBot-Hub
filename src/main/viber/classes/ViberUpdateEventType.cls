/**
 * @description Custom enum class that contains all available event types for `Viber` bots.
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#setting-a-webhook
 * @group Enums
 */
global class ViberUpdateEventType extends BotUpdateEventType {
    /**
     * @description The `Viber` webhook callback event. Received when the webhook is set
     */
    global static final ViberUpdateEventType WebhookCallback = new ViberUpdateEventType('webhook');

    /**
     * @description The `Viber` subscribe event. Received when a new user allows messages from the bot
     */
    global static final ViberUpdateEventType Subscribed = new ViberUpdateEventType('subscribed');

    /**
     * @description The `Viber` unsubscribe event. Received when a new user forbids messages from the bot
     */
    global static final ViberUpdateEventType Unsubscribed = new ViberUpdateEventType('unsubscribed');

    /**
     * @description The `Viber` message event. Received when a user sends a message to the bot
     */
    global static final ViberUpdateEventType Message = new ViberUpdateEventType('message');

    /**
     * @description The `Viber` message event. Received when a message sent by the bot is delivered
     */
    global static final ViberUpdateEventType Delivered = new ViberUpdateEventType('delivered');

    /**
     * @description The `Viber` message event. Received when a message sent by the bot is seen by the user
     */
    global static final ViberUpdateEventType Seen = new ViberUpdateEventType('seen');

    /**
     * @description The `Viber` fail event. Received when a sent message is failed because of some client's validations
     */
    global static final ViberUpdateEventType Failed = new ViberUpdateEventType('failed');

    private ViberUpdateEventType(String value) {
        super(value, ViberUpdateEventType.class);
    }

    public static ViberUpdateEventType valueOf(String value) {
        return (ViberUpdateEventType) BotEnumType.valueOf(value, ViberUpdateEventType.class);
    }
}
