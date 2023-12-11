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

    /**
     * @description The `Telegram` callback query event. Received when a user clicks a callback button on an inline keyboard
     */
    global static final TelegramUpdateEventType CallbackQuery = new TelegramUpdateEventType('callback_query');

    /**
     * @description The `Telegram` poll event. Received on any poll state update. Bots receive only updates about stopped polls and polls sent by the bot
     */
    global static final TelegramUpdateEventType Poll = new TelegramUpdateEventType('poll');

    /**
     * @description The `Telegram` poll answer event. Received when a user changes their answer in a non-anonymous poll. Bots receive new votes only in polls sent by the bot itself
     */
    global static final TelegramUpdateEventType PollAnswer = new TelegramUpdateEventType('poll_answer');

    /**
     * @description The `Telegram` my chat member event. Received when the bot's chat member status changes. For private chats, this update is received only when the bot is blocked or unblocked by the user
     */
    global static final TelegramUpdateEventType MyChatMember = new TelegramUpdateEventType('my_chat_member');

    /**
     * @description The `Telegram` chat member event. Received when a user's chat member status changes. The bot must be an administrator in the chat to receive these updates
     */
    global static final TelegramUpdateEventType ChatMember = new TelegramUpdateEventType('chat_member');

    /**
     * @description The `Telegram` chat join request event. Received when requested to join a chat. The bot must have the `can_invite_users` administrator right in the chat to receive these updates
     */
    global static final TelegramUpdateEventType ChatJoinRequest = new TelegramUpdateEventType('chat_join_request');

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
