// TODO: Add docs
global class ViberBotSubscribedEvent extends ViberBotMessageEvent {
    global final ViberBotUser user;

    public ViberBotSubscribedEvent(ViberBotUpdateEvent event) {
        super(event);
        this.user = (ViberBotUser) event.getValueMap('user', ViberBotUser.class);
        this.userId = this.user.getId();
    }
}
