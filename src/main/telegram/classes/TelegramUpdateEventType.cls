/**
 * @description Custom enum class that contains all available event types for `Telegram` bots.
 * Source: https://core.telegram.org/bots/api#update.
 * @group Enums
 */
global class TelegramUpdateEventType extends BotUpdateEventType {
    /**
     * @description The `Telegram` message event. Received when a user sends a message to the chat with the bot
     */
    global static final TelegramUpdateEventType Message = new TelegramUpdateEventType('message');

    /**
     * @description The `Telegram` edited message event. Received when a user edits their message in the chat with the bot
     */
    global static final TelegramUpdateEventType EditedMessage = new TelegramUpdateEventType('edited_message');

    /**
     * @description The `Telegram` channel post event. Received when a user makes a post in a channel with the bot
     */
    global static final TelegramUpdateEventType ChannelPost = new TelegramUpdateEventType('channel_post');

    /**
     * @description The `Telegram` edited message event. Received when a user edits a post in a channel with the bot
     */
    global static final TelegramUpdateEventType EditedChannelPost = new TelegramUpdateEventType('edited_channel_post');

    /**
     * @description The `Telegram` inline query event. Received when a user mentions the bot in any chat via an inline query
     */
    global static final TelegramUpdateEventType InlineQuery = new TelegramUpdateEventType('inline_query');

    /**
     * @description The `Telegram` chosen inline query result event. Received when a user chooses one of the inline query results
     */
    global static final TelegramUpdateEventType ChosenInlineResult = new TelegramUpdateEventType(
        'chosen_inline_result'
    );

    private static final Set<TelegramUpdateEventType> MESSAGE_EVENT_TYPES = new Set<TelegramUpdateEventType> {
        Message,
        EditedMessage,
        ChannelPost,
        EditedChannelPost
    };

    private TelegramUpdateEventType(String value) {
        super(value, TelegramUpdateEventType.class);
    }

    public static Boolean isMessageEventType(TelegramUpdateEventType eventType) {
        return MESSAGE_EVENT_TYPES.contains(eventType);
    }

    public static TelegramUpdateEventType valueOf(String value) {
        return (TelegramUpdateEventType) BotEnumType.valueOf(value, TelegramUpdateEventType.class);
    }
}
