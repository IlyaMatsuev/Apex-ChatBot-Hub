/**
 * @description Describes the input location message payload that can be attached as part of answer to a `Telegram` bot inline query
 * Source: https://core.telegram.org/bots/api#inputlocationmessagecontent
 */
global class TelegramInputLocationMessageContent extends TelegramInputMessageContent {
    /**
     * @description Creates a new instance of the input message with the provided latitude and longitude
     * @param latitude The latitude of the location in degrees
     * @param longitude The longitude of the location in degrees
     */
    global TelegramInputLocationMessageContent(Decimal latitude, Decimal longitude) {
        payload.set('latitude', latitude);
        payload.set('longitude', longitude);
    }

    /**
     * @description Sets the radius of uncertainty for the location, measured in meters
     * @param accuracy The radius of uncertainty for the location in meters. Accepts values in range: `0..1500`
     * @return The current instance of the <<TelegramInputLocationMessageContent>> class
     */
    global TelegramInputLocationMessageContent withHorizontalAccuracy(Decimal accuracy) {
        payload.set('horizontal_accuracy', accuracy);
        return this;
    }

    /**
     * @description Sets the period in seconds for which the location will be updated
     * @param period The period in seconds for which the location will be updated. Accepts values in range: `60..86400`
     * @return The current instance of the <<TelegramInputLocationMessageContent>> class
     */
    global TelegramInputLocationMessageContent withLivePeriod(Integer period) {
        payload.set('live_period', period);
        return this;
    }

    /**
     * @description Sets the maximum distance in meters for proximity alerts about approaching another chat member
     * @param alertRadius The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000`
     * @return The current instance of the <<TelegramInputLocationMessageContent>> class
     */
    global TelegramInputLocationMessageContent withProximityAlertRadius(Integer alertRadius) {
        payload.set('proximity_alert_radius', alertRadius);
        return this;
    }

    /**
     * @description Sets the direction in degrees in which the user is moving
     * @param heading The direction in degrees in which the user is moving. Accepts values in range: `1..360`
     * @return The current instance of the <<TelegramInputLocationMessageContent>> class
     */
    global TelegramInputLocationMessageContent withHeading(Integer heading) {
        payload.set('heading', heading);
        return this;
    }
}
