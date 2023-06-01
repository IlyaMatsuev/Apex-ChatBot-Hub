/**
 * @description Describes the `Viber` bot payload for a failed message send attempt
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#failed-callback
 */
global class ViberBotMessageFailedEvent extends ViberBotMessageEvent {
    /**
     * @description The error description
     */
    global final String errorDescription;

    public ViberBotMessageFailedEvent(ViberBotUpdateEvent event) {
        super(event);
        this.errorDescription = event.getString('desc');
    }
}
