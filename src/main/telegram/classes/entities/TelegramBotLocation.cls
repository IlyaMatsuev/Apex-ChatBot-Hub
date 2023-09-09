/**
 * @description Describes the location payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#location
 */
global class TelegramBotLocation extends BotPayload {
    /**
     * @description The longitude as defined by sender
     */
    global Decimal longitude { get { return payload.getDecimal('longitude'); } }

    /**
     * @description The latitude as defined by sender
     */
    global Decimal latitude { get { return payload.getDecimal('latitude'); } }

    /**
     * @description The radius of uncertainty for the location, measured in meters; `0-1500`
     */
    global Decimal horizontalAccuracy { get { return payload.getDecimal('horizontal_accuracy'); } }

    /**
     * @description The time relative to the message sending date, during which the location can be updated; in seconds. For active live locations only
     */
    global Integer livePeriod { get { return payload.getInteger('live_period'); } }

    /**
     * @description The direction in which user is moving, in degrees; `1-360`. For active live locations only
     */
    global Integer heading { get { return payload.getInteger('heading'); } }

    /**
     * @description The maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only
     */
    global Integer proximityAlertRadius { get { return payload.getInteger('proximity_alert_radius'); } }

    public TelegramBotLocation(BotJsonPayload payload) {
        super(payload);
    }
}
