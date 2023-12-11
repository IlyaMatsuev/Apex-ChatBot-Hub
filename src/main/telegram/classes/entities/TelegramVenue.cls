/**
 * @description Describes the venue payload that can be received as part of an update from a `Telegram` bot.
 * Source: https://core.telegram.org/bots/api#venue
 */
global class TelegramVenue extends BotPayload {
    /**
     * @description The venue location. Can't be a live location
     */
    global TelegramLocation location { get { return new TelegramLocation(payload.getJsonPayload('location')); } }

    /**
     * @description The name of the venue
     */
    global String title { get { return payload.getString('title'); } }

    /**
     * @description The address of the venue
     */
    global String address { get { return payload.getString('address'); } }

    /**
     * @description The Foursquare identifier of the venue
     */
    global String foursquareId { get { return payload.getString('foursquare_id'); } }

    /**
     * @description The Foursquare type of the venue. (For example, `arts_entertainment/default`, `arts_entertainment/aquarium` or `food/ice-cream`.)
     */
    global String foursquareType { get { return payload.getString('foursquare_type'); } }

    /**
     * @description The Google Places identifier of the venue
     */
    global String googlePlaceId { get { return payload.getString('google_place_id'); } }

    /**
     * @description Google Places type of the venue
     */
    global String googlePlaceType { get { return payload.getString('google_place_type'); } }

    public TelegramVenue(BotJsonPayload payload) {
        super(payload);
    }
}
