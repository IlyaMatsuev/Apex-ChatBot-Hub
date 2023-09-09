/**
 * @description Describes the `Viber` bot payload received when the new message is received from a user.
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#receive-message-from-user
 */
global class ViberMessageReceivedEvent extends ViberMessageEvent {
    /**
     * @description The sender's user information
     */
    global final ViberUser sender;

    /**
     * @description The message details
     */
    global final ViberMessage message;

    public ViberMessageReceivedEvent(ViberUpdateEvent event) {
        super(event);
        this.sender = new ViberUser(event.getPayload().getJsonPayload('sender'));
        this.userId = this.sender.getId();
        this.message = event.getMessage();
    }
}
