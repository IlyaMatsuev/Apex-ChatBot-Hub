public abstract class BotMethod extends BotEnumType {
    protected BotMethod(String value) {
        super(value, BotMethod.class);
    }

    public static BotMethod valueOf(String value) {
        return (BotMethod) BotEnumType.valueOf(value, BotMethod.class);
    }
}
