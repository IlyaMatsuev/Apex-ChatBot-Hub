/**
 * @description Describes the `Viber` bot payload received when the new message is received from a user.
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#receive-message-from-user
 */
global class ViberMessageReceivedEvent extends ViberMessageEvent {
    /**
     * @description The sender's user information
     */
    global ViberUser sender { get { return new ViberUser(payload.getJsonPayload('sender')); } }

    /**
     * @description The message details
     */
    global ViberMessage message { get { return new ViberMessage(payload.getJsonPayload('message')); } }

    public ViberMessageReceivedEvent(ViberUpdateEvent event) {
        super(event);
    }
}
