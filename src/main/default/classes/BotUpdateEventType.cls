public virtual class BotUpdateEventType extends BotEnumType {
    protected BotUpdateEventType(String value) {
        super(value, BotUpdateEventType.class);
    }

    public static BotUpdateEventType valueOf(String value) {
        return (BotUpdateEventType) BotEnumType.valueOf(value, BotUpdateEventType.class);
    }
}
