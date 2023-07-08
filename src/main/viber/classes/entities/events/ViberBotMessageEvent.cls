/**
 * @description Describes the common payload properties for the `Viber` bot update events
 * Sources:
 * - https://developers.viber.com/docs/api/rest-bot-api/#message-receipts-callbacks
 * - https://developers.viber.com/docs/api/rest-bot-api/#unsubscribed
 */
global virtual class ViberBotMessageEvent {
    /**
     * @description The unique identifier of the related message
     */
    global final String messageId;

    /**
     * @description The event date and time
     */
    global final DateTime eventDate;

    /**
     * @description The sender's `Viber` user id
     */
    global final String userId;

    public ViberBotMessageEvent(ViberBotUpdateEvent event) {
        this.messageId = event.getPayload().getString('message_token');
        this.eventDate = event.getPayload().getDateTime('timestamp');
        this.userId = event.getPayload().getString('user_id');
    }
}
