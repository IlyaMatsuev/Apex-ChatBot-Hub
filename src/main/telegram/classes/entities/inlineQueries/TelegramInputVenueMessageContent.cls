/**
 * @description Describes the input venue message payload that can be attached as part of answer to a `Telegram` bot inline query.
 * Source: https://core.telegram.org/bots/api#inputvenuemessagecontent
 */
global class TelegramInputVenueMessageContent extends TelegramInputMessageContent {
    /**
     * @description Creates a new instance of the input message with the provided latitude and longitude
     * @param latitude The latitude of the location in degrees
     * @param longitude The longitude of the location in degrees
     */
    global TelegramInputVenueMessageContent(Decimal latitude, Decimal longitude) {
        payload.set('latitude', latitude);
        payload.set('longitude', longitude);
    }

    /**
     * @description Sets the name of the venue
     * @param title The name of the venue
     * @return The current instance of the <<TelegramInputVenueMessageContent>> class
     */
    global TelegramInputVenueMessageContent withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the address of the venue
     * @param address The address of the venue
     * @return The current instance of the <<TelegramInputVenueMessageContent>> class
     */
    global TelegramInputVenueMessageContent withAddress(String address) {
        payload.set('address', address);
        return this;
    }

    /**
     * @description Sets the Foursquare information of the venue
     * @param id The Foursquare identifier of the venue, if known
     * @param type The Foursquare type of the venue, if known. (For example, `arts_entertainment/default`, `arts_entertainment/aquarium` or `food/icecream`)
     * @return The current instance of the <<TelegramInputVenueMessageContent>> class
     */
    global TelegramInputVenueMessageContent withFoursquare(String id, String type) {
        payload.set('foursquare_id', id);
        payload.set('foursquare_type', type);
        return this;
    }

    /**
     * @description Sets the Google Places information of the venue
     * @param id The Google Places identifier of the venue
     * @param type The Google Places type of the venue
     * @return The current instance of the <<TelegramInputVenueMessageContent>> class
     */
    global TelegramInputVenueMessageContent withGooglePlaces(String id, String type) {
        payload.set('google_place_id', id);
        payload.set('google_place_type', type);
        return this;
    }
}
