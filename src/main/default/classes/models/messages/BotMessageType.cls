public class BotMessageType extends BotEnumType {
    public static final BotMessageType Text = new BotMessageType('text');
    public static final BotMessageType Image = new BotMessageType('image');
    public static final BotMessageType Video = new BotMessageType('video');
    public static final BotMessageType File = new BotMessageType('file');
    public static final BotMessageType Contact = new BotMessageType('contact');
    public static final BotMessageType Location = new BotMessageType('location');
    public static final BotMessageType Sticker = new BotMessageType('sticker');

    public BotMessageType(String value) {
        super(value, BotMessageType.class);
    }
}
