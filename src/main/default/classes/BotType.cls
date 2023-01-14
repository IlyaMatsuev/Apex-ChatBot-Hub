/**
 * @description Custom enum that contains all available bot types for the package. The same values are presented in the `Bot__c.Type__c` picklist
 */
global class BotType extends BotEnumType {
    /**
     * @description `Telegram` bot type
     */
    global static final BotType Telegram = new BotType('Telegram');
    /**
     * @description `Viber` bot type
     */
    global static final BotType Viber = new BotType('Viber');

    private BotType(String value) {
        super(value, BotType.class);
    }

    /**
     * @description Attempts to convert a string value to the `BotType` enum
     * @param value The string value to be converted
     * @return The instance of the `BotType` enum
     * @throws NoSuchElementException If the string value cannot be converted to the enum
     */
    global static BotType valueOf(String value) {
        return (BotType) BotEnumType.valueOf(value, BotType.class);
    }

    /**
     * @description Returns the list of all possible bot types
     * @return The list of `BotType` enum instances
     */
    global static List<BotType> values() {
        return new List<BotType> { Telegram, Viber };
    }
}
