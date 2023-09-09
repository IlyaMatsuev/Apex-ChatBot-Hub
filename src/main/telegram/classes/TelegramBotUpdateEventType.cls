/**
 * @description Custom enum class that contains all available event types for `Telegram` bots.
 * Source: https://core.telegram.org/bots/api#update.
 * @group Enums
 */
global class TelegramBotUpdateEventType extends BotUpdateEventType {
    /**
     * @description The `Telegram` message event. Received when a user sends a message to the chat with the bot
     */
    global static final TelegramBotUpdateEventType Message = new TelegramBotUpdateEventType('message');

    /**
     * @description The `Telegram` edited message event. Received when a user edits their message in the chat with the bot
     */
    global static final TelegramBotUpdateEventType EditedMessage = new TelegramBotUpdateEventType('edited_message');

    /**
     * @description The `Telegram` channel post event. Received when a user makes a post in a channel with the bot
     */
    global static final TelegramBotUpdateEventType ChannelPost = new TelegramBotUpdateEventType('channel_post');

    /**
     * @description The `Telegram` edited message event. Received when a user edits a post in a channel with the bot
     */
    global static final TelegramBotUpdateEventType EditedChannelPost = new TelegramBotUpdateEventType(
        'edited_channel_post'
    );

    /**
     * @description The `Telegram` inline query event. Received when a user mentions the bot in any chat via an inline query
     */
    global static final TelegramBotUpdateEventType InlineQuery = new TelegramBotUpdateEventType('inline_query');

    /**
     * @description The `Telegram` chosen inline query result event. Received when a user chooses one of the inline query results
     */
    global static final TelegramBotUpdateEventType ChosenInlineResult = new TelegramBotUpdateEventType(
        'chosen_inline_result'
    );

    private static final Set<TelegramBotUpdateEventType> MESSAGE_EVENT_TYPES = new Set<TelegramBotUpdateEventType> {
        Message,
        EditedMessage,
        ChannelPost,
        EditedChannelPost
    };

    private TelegramBotUpdateEventType(String value) {
        super(value, TelegramBotUpdateEventType.class);
    }

    public static Boolean isMessageEventType(TelegramBotUpdateEventType eventType) {
        return MESSAGE_EVENT_TYPES.contains(eventType);
    }

    public static TelegramBotUpdateEventType valueOf(String value) {
        return (TelegramBotUpdateEventType) BotEnumType.valueOf(value, TelegramBotUpdateEventType.class);
    }
}
