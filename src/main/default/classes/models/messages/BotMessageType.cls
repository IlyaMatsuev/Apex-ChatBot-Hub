/**
 * @description The enum with all available message types for sending and receiving messages
 * @group Common.Enums
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
     * @description The document message
     */
    global static final BotMessageType File = new BotMessageType('File');

    /**
     * @description The message sharing contact details
     */
    global static final BotMessageType Contact = new BotMessageType('Contact');

    /**
     * @description The message sharing location details
     */
    global static final BotMessageType Location = new BotMessageType('Location');

    /**
     * @description The chat sticker message
     */
    global static final BotMessageType Sticker = new BotMessageType('Sticker');

    /**
     * @description The chat URL message
     */
    global static final BotMessageType Url = new BotMessageType('Url');

    public BotMessageType(String value) {
        super(value, BotMessageType.class);
    }
}
