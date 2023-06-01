/**
 * @description Describes the `Viber` bot payload when a new user subscribes to the bot
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#subscribed
 */
global class ViberBotSubscribedEvent extends ViberBotMessageEvent {
    /**
     * @description The subscriber's user information
     */
    global final ViberBotUser user;

    public ViberBotSubscribedEvent(ViberBotUpdateEvent event) {
        super(event);
        this.user = (ViberBotUser) event.getJsonPayload('user', ViberBotUser.class);
        this.userId = this.user.getId();
    }
}
