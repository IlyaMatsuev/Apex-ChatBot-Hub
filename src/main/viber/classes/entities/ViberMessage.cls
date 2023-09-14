/**
 * @description Describes the message payload received as an update from a `Viber` bot
 */
global class ViberMessage extends BotPayload implements IBotMessage {
    /**
     * @description The message type. Possible values are `text`, `picture`, `video`, `file`, `sticker`, `contact`, `url` and `location`
     */
    global String type { get { return payload.getString('type'); } }

    /**
     * @description The message text
     */
    global String text { get { return payload.getString('text'); } }

    /**
     * @description The URL of the message media - can be `image`, `video`, `file` and `url`. Image/Video/File URLs will have a TTL of 1 hour
     */
    global String media { get { return payload.getString('media'); } }

    /**
     * @description The shared location details
     */
    global Location location { get { return new Location(payload.getJsonPayload('location')); } }

    /**
     * @description The shared contact details
     */
    global Contact contact { get { return new Contact(payload.getJsonPayload('contact')); } }

    /**
     * @description The tracking data sent with the last message to the user
     */
    global String trackingData { get { return payload.getString('tracking_data'); } }

    /**
     * @description The attached file name. Relevant for `file` type messages
     */
    global String fileName { get { return payload.getString('file_name'); } }

    /**
     * @description The attached file size in bytes. Relevant for `file` type messages
     */
    global Integer fileSize { get { return payload.getInteger('file_size'); } }

    /**
     * @description The attached video duration in seconds. Relevant for `video` type messages
     */
    global Integer duration { get { return payload.getInteger('duration'); } }

    /**
     * @description The sticker id. Relevant for `sticker` type messages
     */
    global Integer stickerId { get { return payload.getInteger('sticker_id'); } }

    public ViberMessage(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Viber` message id
     * @return The `Viber` message id
     */
    global String getId() {
        return payload.getString('message_id');
    }

    /**
     * @description Returns the message type
     * @return The instance of the <<BotMessageType>> enum
     */
    global BotMessageType getType() {
        switch on type {
            when 'text' {
                return BotMessageType.Text;
            }
            when 'picture' {
                return BotMessageType.Image;
            }
            when 'video' {
                return BotMessageType.Video;
            }
            when 'file' {
                return BotMessageType.File;
            }
            when 'sticker' {
                return BotMessageType.Sticker;
            }
            when 'contact' {
                return BotMessageType.Contact;
            }
            when 'url' {
                return BotMessageType.Url;
            }
            when 'location' {
                return BotMessageType.Location;
            }
        }
        return BotMessageType.Other;
    }

    /**
     * @description Returns the message text
     * @return The message text
     */
    global String getText() {
        return text;
    }

    /**
     * @description Returns the media URL if it was attached to the message
     * @return The message media URL
     */
    global String getMediaUrl() {
        return media;
    }

    /**
     * @description Returns the message send date
     * @return The message send date
     */
    global DateTime getSendDate() {
        return payload.getDateTime('timestamp');
    }

    /**
     * @description Returns the additional message parameters
     * @return The instance of the <<BotJsonPayload>> class
     */
    global BotJsonPayload getParameters() {
        return payload;
    }

    /**
     * @description Represents the coordinates for a location message
     */
    global class Location extends BotPayload {
        /**
         * @description The location latitude
         */
        global Decimal latitude { get { return payload.getDecimal('lat'); } }

        /**
         * @description The location longitude
         */
        global Decimal longitude { get { return payload.getDecimal('lon'); } }

        private Location(BotJsonPayload payload) {
            super(payload);
        }
    }

    /**
     * @description Represents the details for a contact message
     */
    global class Contact extends BotPayload {
        /**
         * @description The contact’s username
         */
        global String name { get { return payload.getString('name'); } }

        /**
         * @description The contact’s phone number
         */
        global String phoneNumber { get { return payload.getString('phone_number'); } }

        /**
         * @description The avatar URL
         */
        global String avatar { get { return payload.getString('avatar'); } }

        private Contact(BotJsonPayload payload) {
            super(payload);
        }
    }
}
