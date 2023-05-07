// TODO: Add docs
global class ViberBotSubscribedEvent extends ViberBotMessageEvent {
    global final ViberBotUser user;

    global ViberBotSubscribedEvent(ViberBotUpdateEvent event) {
        super(event);
        this.user = (ViberBotUser) event.getJsonPayload('user', ViberBotUser.class);
        this.userId = this.user.getId();
    }
}
