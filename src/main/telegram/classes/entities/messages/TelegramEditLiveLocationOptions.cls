/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `editMessageLiveLocation` method.
 * Source: https://core.telegram.org/bots/api#editmessagelivelocation
 */
global class TelegramEditLiveLocationOptions extends BotPayload {
    /**
     * @description Sets the radius of uncertainty for the new location, measured in meters
     * @param accuracy The radius of uncertainty for the location in meters. Accepts values in range: `0..1500`
     * @return The current instance of the <<TelegramEditLiveLocationOptions>> class
     */
    global TelegramEditLiveLocationOptions withHorizontalAccuracy(Decimal accuracy) {
        payload.set('horizontal_accuracy', accuracy, true);
        return this;
    }

    /**
     * @description Sets the maximum distance in meters for proximity alerts about approaching another chat member
     * @param alertRadius The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000`
     * @return The current instance of the <<TelegramEditLiveLocationOptions>> class
     */
    global TelegramEditLiveLocationOptions withProximityAlertRadius(Integer alertRadius) {
        payload.set('proximity_alert_radius', alertRadius, true);
        return this;
    }

    /**
     * @description Sets the direction in degrees in which the user is moving
     * @param heading The direction in degrees in which the user is moving. Accepts values in range: `1..360`
     * @return The current instance of the <<TelegramEditLiveLocationOptions>> class
     */
    global TelegramEditLiveLocationOptions withHeading(Integer heading) {
        payload.set('heading', heading, true);
        return this;
    }
}
