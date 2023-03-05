/**
 * @description Custom enum class that contains all available event types for `Telegram` bots. Docs: https://core.telegram.org/bots/api#update.
 * @group Enums
 */
global class TelegramBotUpdateEventType extends BotUpdateEventType {
    /**
     * @descpirtion The `Telegram` message event. Received when a user sends a message to the chat with the bot
     */
    global static final TelegramBotUpdateEventType Message = new TelegramBotUpdateEventType('message');
    /**
     * @descpirtion The `Telegram` edited message event. Received when a user edits their message in the chat with the bot
     */
    global static final TelegramBotUpdateEventType EditedMessage = new TelegramBotUpdateEventType('edited_message');

    private TelegramBotUpdateEventType(String value) {
        super(value, TelegramBotUpdateEventType.class);
    }

    public static TelegramBotUpdateEventType valueOf(String value) {
        return (TelegramBotUpdateEventType) BotEnumType.valueOf(value, TelegramBotUpdateEventType.class);
    }
}
