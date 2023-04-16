// TODO: Add docs
global virtual class ViberBotMessageEvent {
    global final String messageId;
    global final DateTime eventDate;
    global final String userId;

    global ViberBotMessageEvent(ViberBotUpdateEvent event) {
        this.messageId = event.getString('message_token');
        this.eventDate = event.getDateTime('timestamp');
        this.userId = event.getString('user_id');
    }
}
