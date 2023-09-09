/**
 * @description Describes the `Viber` bot payload when a new user subscribes to the bot
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#subscribed
 */
global class ViberSubscribedEvent extends ViberMessageEvent {
    /**
     * @description The subscriber's user information
     */
    global final ViberUser user;

    public ViberSubscribedEvent(ViberUpdateEvent event) {
        super(event);
        this.user = new ViberUser(event.getPayload().getJsonPayload('user'));
        this.userId = this.user.getId();
    }
}
