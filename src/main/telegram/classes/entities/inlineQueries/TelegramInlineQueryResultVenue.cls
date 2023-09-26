/**
 * @description Describes the venue result payload that can be attached as part of answer to a `Telegram` bot inline query
 * Source: https://core.telegram.org/bots/api#inlinequeryresultvenue
 */
global class TelegramInlineQueryResultVenue extends TelegramInlineQueryResult {
    /**
     * @description Creates a new instance of the venue inline query result with the provided result id and coords
     * @param id The unique identifier for the result, `1-64 bytes`
     * @param latitude The venue latitude
     * @param longitude The venue longitude
     */
    global TelegramInlineQueryResultVenue(String id, Decimal latitude, Decimal longitude) {
        super(id, 'venue');
        payload.set('latitude', latitude);
        payload.set('longitude', longitude);
    }

    /**
     * @description Sets the name of the venue
     * @param title The name of the venue
     * @return The current instance of the <<TelegramInlineQueryResultVenue>> class
     */
    global TelegramInlineQueryResultVenue withTitle(String title) {
        payload.set('title', title);
        return this;
    }

    /**
     * @description Sets the address of the venue
     * @param address The address of the venue
     * @return The current instance of the <<TelegramInlineQueryResultVenue>> class
     */
    global TelegramInlineQueryResultVenue withAddress(String address) {
        payload.set('address', address);
        return this;
    }

    /**
     * @description Sets the Foursquare information of the venue
     * @param id The Foursquare identifier of the venue, if known
     * @param type The Foursquare type of the venue, if known. (For example, `arts_entertainment/default`, `arts_entertainment/aquarium` or `food/icecream`)
     * @return The current instance of the <<TelegramInlineQueryResultVenue>> class
     */
    global TelegramInlineQueryResultVenue withFoursquare(String id, String type) {
        payload.set('foursquare_id', id);
        payload.set('foursquare_type', type);
        return this;
    }

    /**
     * @description Sets the Google Places information of the venue
     * @param id The Google Places identifier of the venue
     * @param type The Google Places type of the venue
     * @return The current instance of the <<TelegramInlineQueryResultVenue>> class
     */
    global TelegramInlineQueryResultVenue withGooglePlaces(String id, String type) {
        payload.set('google_place_id', id);
        payload.set('google_place_type', type);
        return this;
    }

    /**
     * @description Sets the thumbnail for the inline result
     * @param url The thumbnail URL
     * @param width The thumbnail width
     * @param height The thumbnail height
     * @return The current instance of the <<TelegramInlineQueryResultVenue>> class
     */
    global TelegramInlineQueryResultVenue withThumbnail(String url, Integer width, Integer height) {
        payload.set('thumbnail_url', url);
        payload.set('thumbnail_width', width, true);
        payload.set('thumbnail_height', height, true);
        return this;
    }

    /**
     * @description Sets the inline keyboard to the message
     * @param keyboard The inline keyboard attached to the message
     * @return The current instance of the <<TelegramInlineQueryResultVenue>> class
     */
    global TelegramInlineQueryResultVenue withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard) {
        return (TelegramInlineQueryResultVenue) addInlineKeyboard(keyboard);
    }

    /**
     * @description Sets the content of the message to be sent instead of the venue
     * @param messageContent The content of the message to be sent
     * @return The current instance of the <<TelegramInlineQueryResultVenue>> class
     */
    global TelegramInlineQueryResultVenue withInputMessage(TelegramInputMessageContent messageContent) {
        return (TelegramInlineQueryResultVenue) addInputMessage(messageContent);
    }
}
