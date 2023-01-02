global class BotType extends BotEnumType {
    global static final BotType Telegram = new BotType('Telegram');
    global static final BotType Viber = new BotType('Viber');

    private BotType(String value) {
        super(value, BotType.class);
    }

    global static BotType valueOf(String value) {
        return (BotType) BotEnumType.valueOf(value, BotType.class);
    }

    global static List<BotType> values() {
        return new List<BotType> { Telegram, Viber };
    }
}
