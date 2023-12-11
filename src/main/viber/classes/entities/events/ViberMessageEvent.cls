/**
 * @description Describes the common payload properties for the `Viber` bot update events.
 * Sources:
 * - https://developers.viber.com/docs/api/rest-bot-api/#message-receipts-callbacks
 * - https://developers.viber.com/docs/api/rest-bot-api/#unsubscribed
 */
global virtual class ViberMessageEvent extends BotPayload {
    /**
     * @description The unique identifier of the related message
     */
    global String messageToken { get { return payload.getString('message_token'); } }

    /**
     * @description The event date and time
     */
    global DateTime timestamp { get { return payload.getDateTime('timestamp'); } }

    /**
     * @description The sender's `Viber` user id
     */
    global String userId { get { return payload.getString('user_id'); } }

    public ViberMessageEvent(ViberUpdateEvent event) {
        super(event.getPayload());
    }
}
