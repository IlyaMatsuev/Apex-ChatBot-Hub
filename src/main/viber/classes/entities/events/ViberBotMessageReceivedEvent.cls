/**
 * @description Describes the `Viber` bot payload received when the new message is received from a user.
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#receive-message-from-user
 */
global class ViberBotMessageReceivedEvent extends ViberBotMessageEvent {
    /**
     * @description The sender's user information
     */
    global final ViberBotUser sender;

    /**
     * @description The message details
     */
    global final ViberBotMessage message;

    public ViberBotMessageReceivedEvent(ViberBotUpdateEvent event) {
        super(event);
        this.sender = (ViberBotUser) event.getJsonPayload('sender', ViberBotUser.class);
        this.userId = this.sender.getId();
        this.message = event.getMessage();
    }
}
