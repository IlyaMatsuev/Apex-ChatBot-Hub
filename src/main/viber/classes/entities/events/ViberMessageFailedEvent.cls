/**
 * @description Describes the `Viber` bot payload for a failed message send attempt
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#failed-callback
 */
global class ViberMessageFailedEvent extends ViberMessageEvent {
    /**
     * @description The error description
     */
    global final String errorDescription;

    public ViberMessageFailedEvent(ViberUpdateEvent event) {
        super(event);
        this.errorDescription = event.getPayload().getString('desc');
    }
}
