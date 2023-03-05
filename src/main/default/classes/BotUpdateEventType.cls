/**
 * @description Custom enum base class that is extended by `Telegram` and `Viber` enums which contain all available event types
 * @group Common.Enums
 */
global abstract class BotUpdateEventType extends BotEnumType {
    protected BotUpdateEventType(String value, Type type) {
        super(value, type);
    }
}
