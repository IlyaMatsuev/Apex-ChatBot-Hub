/**
 * @description Describes the location result payload that can be attached as part of answer to a `Telegram` bot inline query
 * Source: https://core.telegram.org/bots/api#inlinequeryresultlocation
 */
global class TelegramInlineQueryResultLocation extends TelegramInlineQueryResult {
    /**
     * @description Creates a new instance of the location inline query result with the provided result id and coords
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param latitude The location latitude
     * @param longitude The location longitude
     */
    global TelegramInlineQueryResultLocation(String id, Decimal latitude, Decimal longitude) {
        super(id, 'location');
        payload.set('latitude', latitude);
        payload.set('longitude', longitude);
    }

    /**
     * @description Sets the title for the inline result
     * @param title The title of the result
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the radius of uncertainty for the location, measured in meters
     * @param accuracy The radius of uncertainty for the location in meters. Accepts values in range: `0..1500`
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withHorizontalAccuracy(Decimal accuracy) {
        payload.set('horizontal_accuracy', accuracy);
        return this;
    }

    /**
     * @description Sets the period in seconds for which the location will be updated
     * @param period The period in seconds for which the location will be updated. Accepts values in range: `60..86400`
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withLivePeriod(Integer period) {
        payload.set('live_period', period);
        return this;
    }

    /**
     * @description Sets the maximum distance in meters for proximity alerts about approaching another chat member
     * @param alertRadius The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000`
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withProximityAlertRadius(Integer alertRadius) {
        payload.set('proximity_alert_radius', alertRadius);
        return this;
    }

    /**
     * @description Sets the direction in degrees in which the user is moving
     * @param heading The direction in degrees in which the user is moving. Accepts values in range: `1..360`
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withHeading(Integer heading) {
        payload.set('heading', heading);
        return this;
    }

    /**
     * @description Sets the thumbnail for the inline result
     * @param url The thumbnail URL
     * @param width The thumbnail width
     * @param height The thumbnail height
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withThumbnail(String url, Integer width, Integer height) {
        payload.set('thumbnail_url', url);
        payload.set('thumbnail_width', width, true);
        payload.set('thumbnail_height', height, true);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultLocation) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the location
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultLocation>> class
     */
    global TelegramInlineQueryResultLocation withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultLocation) addInputMessage(messageContent);
    }
}
