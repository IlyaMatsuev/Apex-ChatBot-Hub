/**
 * @description Describes the message payload received as an update from a `Viber` bot
 */
global class ViberBotMessage extends BotPayload implements IBotMessage {
    public ViberBotMessage(BotJsonPayload payload) {
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
        switch on payload.getString('type') {
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
        return payload.getString('text');
    }

    /**
     * @description Returns the media URL if it was attached to the message
     * @return The message media URL
     */
    global String getMediaUrl() {
        return payload.getString('media');
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
}
