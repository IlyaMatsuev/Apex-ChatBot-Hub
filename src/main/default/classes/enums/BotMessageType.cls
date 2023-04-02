/**
 * @description The enum with all available message types for sending and receiving messages
 * @group Enums
 */
global class BotMessageType extends BotEnumType {
    /**
     * @description The plain text message
     */
    global static final BotMessageType Text = new BotMessageType('Text');

    /**
     * @description The image message
     */
    global static final BotMessageType Image = new BotMessageType('Image');

    /**
     * @description The video message
     */
    global static final BotMessageType Video = new BotMessageType('Video');

    /**
     * @description The animation message (a video without sound, e.g. `gif`)
     */
    global static final BotMessageType Animation = new BotMessageType('Animation');

    /**
     * @description The audio message
     */
    global static final BotMessageType Audio = new BotMessageType('Audio');

    /**
     * @description The document message
     */
    global static final BotMessageType File = new BotMessageType('File');

    /**
     * @description The message with multiple images/video/files
     */
    global static final BotMessageType GroupMedia = new BotMessageType('GroupMedia');

    /**
     * @description The message sharing contact details
     */
    global static final BotMessageType Contact = new BotMessageType('Contact');

    /**
     * @description The message sharing location details
     */
    global static final BotMessageType Location = new BotMessageType('Location');

    /**
     * @description The message sharing a venue details
     */
    global static final BotMessageType Venue = new BotMessageType('Venue');

    /**
     * @description The chat sticker message
     */
    global static final BotMessageType Sticker = new BotMessageType('Sticker');

    /**
     * @description The URL message
     */
    global static final BotMessageType Url = new BotMessageType('Url');

    /**
     * @description The poll message
     */
    global static final BotMessageType Poll = new BotMessageType('Poll');

    /**
     * @description The message with custom layout
     */
    global static final BotMessageType Custom = new BotMessageType('Custom');

    /**
     * @description Any other message types
     */
    global static final BotMessageType Other = new BotMessageType('Other');

    public BotMessageType(String value) {
        super(value, BotMessageType.class);
    }
}
