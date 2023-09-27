/**
 * @description Describes the `Viber` bot payload when a new user subscribes to the bot.
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#subscribed
 */
global class ViberSubscribedEvent extends ViberMessageEvent {
    /**
     * @description The subscriber's user information
     */
    global final ViberUser user { get { return new ViberUser(payload.getJsonPayload('user')); } }

    public ViberSubscribedEvent(ViberUpdateEvent event) {
        super(event);
    }
}
