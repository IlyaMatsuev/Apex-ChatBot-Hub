// TOOD: Add docs
global class ViberBotMessageReceivedEvent extends ViberBotMessageEvent {
    global final ViberBotUser sender;
    global final ViberBotMessage message;

    global ViberBotMessageReceivedEvent(ViberBotUpdateEvent event) {
        super(event);
        this.sender = (ViberBotUser) event.getValueMap('sender', ViberBotUser.class);
        this.userId = this.sender.getId();
        this.message = event.getMessage();
    }
}
