/**
 * @description Describes the online status payload received as result of `Viber` `getOnline` method
 */
global class ViberOnlineStatus extends BotPayload {
    /**
     * @description The unique `Viber` user id
     */
    global String id { get { return payload.getString('id'); } }

    /**
     * @description The online status code.
     * - `0` - online
     * - `1` - offline
     * - `2` - undisclosed - user set Viber to hide status
     * - `3` - try later - internal error
     * - `4` - unavailable - not a Viber user / unsubscribed / unregistered
     */
    global Integer onlineStatus { get { return payload.getInteger('online_status'); } }

    /**
     * @description The online status message
     */
    global String onlineStatusMessage { get { return payload.getString('online_status_message'); } }

    public ViberOnlineStatus(BotJsonPayload payload) {
        super(payload);
    }
}
