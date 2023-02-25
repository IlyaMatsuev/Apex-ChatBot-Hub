/**
 * @description The enum with all available message types for sending and receiving messages
 */
global class BotMessageType extends BotEnumType {
    /**
     * @description The plain text message
     */
    global static final BotMessageType Text = new BotMessageType('text');

    /**
     * @description The image message
     */
    global static final BotMessageType Image = new BotMessageType('image');

    /**
     * @description The video message
     */
    global static final BotMessageType Video = new BotMessageType('video');

    /**
     * @description The document message
     */
    global static final BotMessageType File = new BotMessageType('file');

    /**
     * @description The message sharing contact details
     */
    global static final BotMessageType Contact = new BotMessageType('contact');

    /**
     * @description The message sharing location details
     */
    global static final BotMessageType Location = new BotMessageType('location');

    /**
     * @description The chat sticker message
     */
    global static final BotMessageType Sticker = new BotMessageType('sticker');

    public BotMessageType(String value) {
        super(value, BotMessageType.class);
    }
}
