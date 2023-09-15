/**
 * @description The builder-like class that describes all optional parameters of the `Telegram` `sendVenue` method. The source: https://core.telegram.org/bots/api#sendvenue
 */
global class TelegramSendVenueOptions extends TelegramSendMessageOptions {
    /**
     * @description Sets the forum channel thread id where the message has to be sent
     * @param threadId The `Telegram` unique id for the target message thread (topic)
     * @return The current instance of the <<TelegramSendVenueOptions>> class
     */
    global TelegramSendVenueOptions withThreadId(String threadId) {
        return (TelegramSendVenueOptions) setThreadId(threadId);
    }

    /**
     * @description Sends the message silently. The receiver will get a notification with no sound
     * @return The current instance of the <<TelegramSendVenueOptions>> class
     */
    global TelegramSendVenueOptions withoutNotification() {
        return (TelegramSendVenueOptions) disableNotification();
    }

    /**
     * @description Protects the contents of the sent message from forwarding and saving
     * @return The current instance of the <<TelegramSendVenueOptions>> class
     */
    global TelegramSendVenueOptions withProtectedContent() {
        return (TelegramSendVenueOptions) setProtectedContent();
    }

    /**
     * @description Sends the message as a reply to another message. If the target message was not found, will just send a message
     * @param messageId The `Telegram` message id to which bot will reply
     * @return The current instance of the <<TelegramSendVenueOptions>> class
     */
    global TelegramSendVenueOptions asReplyToMessage(String messageId) {
        return (TelegramSendVenueOptions) setReplyMessageId(messageId);
    }

    /**
     * @description Attaches a Foursquare place to the venue
     * @param id The Foursquare identifier of the venue
     * @param type The Foursquare type of the venue, if known. E.g. `arts_entertainment/aquarium`
     * @return The current instance of the <<TelegramSendVenueOptions>> class
     */
    global TelegramSendVenueOptions asFoursquarePlace(String id, String type) {
        payload.set('foursquare_id', id, true);
        payload.set('foursquare_type', type, true);
        return this;
    }

    /**
     * @description Attaches a Google place to the venue
     * @param id The Google identifier of the venue
     * @param type The Google Places type of the venue
     * @return The current instance of the <<TelegramSendVenueOptions>> class
     */
    global TelegramSendVenueOptions asGooglePlace(String id, String type) {
        payload.set('google_place_id', id, true);
        payload.set('google_place_type', type, true);
        return this;
    }
}
