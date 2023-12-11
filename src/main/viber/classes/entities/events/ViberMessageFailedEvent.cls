/**
 * @description Describes the `Viber` bot payload for a failed message send attempt.
 * Source: https://developers.viber.com/docs/api/rest-bot-api/#failed-callback
 */
global class ViberMessageFailedEvent extends ViberMessageEvent {
    /**
     * @description The error description
     */
    global String description { get { return payload.getString('desc'); } }

    public ViberMessageFailedEvent(ViberUpdateEvent event) {
        super(event);
    }
}
