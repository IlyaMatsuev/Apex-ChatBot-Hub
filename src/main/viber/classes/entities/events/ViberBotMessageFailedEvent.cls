// TODO: Add docs
global class ViberBotMessageFailedEvent extends ViberBotMessageEvent {
    global final String errorDescription;

    public ViberBotMessageFailedEvent(ViberBotUpdateEvent event) {
        super(event);
        this.errorDescription = event.getString('desc');
    }
}
