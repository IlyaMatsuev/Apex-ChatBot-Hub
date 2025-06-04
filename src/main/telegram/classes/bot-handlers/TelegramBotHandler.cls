/**
 * @description The class designed for handling webhook events specifically for `Telegram` bots
 */
global abstract class TelegramBotHandler implements IBotHandler {
    /**
     * @description The method that is called when a message is edited
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramMessageEvent>> class, describing the edited message event
     */
    global virtual void onMessageEdited(TelegramBotContext context, TelegramMessageEvent event) {}

    /**
     * @description The method that is called when a new post is received in a channel
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramMessageEvent>> class, describing the received post event
     */
    global virtual void onChannelPostReceived(TelegramBotContext context, TelegramMessageEvent event) {}

    /**
     * @description The method that is called when a post is edited in a channel
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramMessageEvent>> class, describing the edited message event
     */
    global virtual void onChannelPostEdited(TelegramBotContext context, TelegramMessageEvent event) {}

    /**
     * @description The method that is called when an inline query is made via the bot. Using inline mode for a bot requires enabling it: https://core.telegram.org/bots/inline
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramInlineQueryEvent>> class, describing the received inline query event
     */
    global virtual void onInlineQuery(TelegramBotContext context, TelegramInlineQueryEvent event) {}

    /**
     * @description The method that is called when the result of any inline query was chosen by the user and sent to their chat partner. Receiving this events requires enabling collecting feedback: https://core.telegram.org/bots/inline#collecting-feedback
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramChosenInlineResultEvent>> class, describing the inline query result event
     */
    global virtual void onChosenInlineResult(TelegramBotContext context, TelegramChosenInlineResultEvent event) {}

    /**
     * @description The method that is called when a user clicks a callback button on an inline keyboard
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramCallbackQueryEvent>> class, describing callback query event
     */
    global virtual void onCallbackQuery(TelegramBotContext context, TelegramCallbackQueryEvent event) {}

    /**
     * @description The method that is called when a poll state update was received. Bots receive only updates about stopped polls and polls sent by the bot
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramPollEvent>> class, describing poll event
     */
    global virtual void onPollUpdated(TelegramBotContext context, TelegramPollEvent event) {}

    /**
     * @description The method that is called when a user changes their answer in a non-anonymous poll. Bots receive new votes only in polls sent by the bot itself
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramPollAnswerEvent>> class, describing poll event
     */
    global virtual void onPollAnswer(TelegramBotContext context, TelegramPollAnswerEvent event) {}

    /**
     * @description The method that is called when the bot's chat member status changes. For private chats, this update is received only when the bot is blocked or unblocked by the user
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramChatMemberUpdatedEvent>> class, describing updated chat member event
     */
    global virtual void onMyChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event) {}

    /**
     * @description The method that is called when a user's chat member status changes. The bot must be an administrator in the chat to receive these updates
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramChatMemberUpdatedEvent>> class, describing updated chat member event
     */
    global virtual void onChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event) {}

    /**
     * @description The method that is called when somebody requested to join a chat. The bot must have the `can_invite_users` administrator right in the chat to receive these updates
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramChatJoinRequestEvent>> class, describing chat join request event
     */
    global virtual void onChatJoinRequest(TelegramBotContext context, TelegramChatJoinRequestEvent event) {}

    /**
     * @description The method that is called when a new message is received
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramMessageEvent>> class, describing the received message event
     */
    global abstract void onMessageReceived(TelegramBotContext context, TelegramMessageEvent event);

    /**
     * @description The common handler for all webhook event types
     * @param context The context variable that contains all necessary methods for handling the incoming update. The instance of the <<TelegramBotContext>> class
     */
    global void handle(IBotContext context) {
        try {
            TelegramBotContext tgContext = (TelegramBotContext) context;
            TelegramUpdateEvent tgEvent = tgContext.getUpdateEvent();
            TelegramUpdateEventType eventType = tgEvent.getType();
            BotJsonPayload eventPayload = tgEvent.getEventPayload();

            if (eventType == TelegramUpdateEventType.Message) {
                onMessageReceived(tgContext, new TelegramMessageEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.EditedMessage) {
                onMessageEdited(tgContext, new TelegramMessageEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.ChannelPost) {
                onChannelPostReceived(tgContext, new TelegramMessageEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.EditedChannelPost) {
                onChannelPostEdited(tgContext, new TelegramMessageEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.InlineQuery) {
                onInlineQuery(tgContext, new TelegramInlineQueryEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.ChosenInlineResult) {
                onChosenInlineResult(tgContext, new TelegramChosenInlineResultEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.CallbackQuery) {
                onCallbackQuery(tgContext, new TelegramCallbackQueryEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.Poll) {
                onPollUpdated(tgContext, new TelegramPollEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.PollAnswer) {
                onPollAnswer(tgContext, new TelegramPollAnswerEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.MyChatMember) {
                onMyChatMemberUpdated(tgContext, new TelegramChatMemberUpdatedEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.ChatMember) {
                onChatMemberUpdated(tgContext, new TelegramChatMemberUpdatedEvent(eventPayload));
            } else if (eventType == TelegramUpdateEventType.ChatJoinRequest) {
                onChatJoinRequest(tgContext, new TelegramChatJoinRequestEvent(eventPayload));
            }
        } catch (Exception ex) {
            BotErrorLogger.log(context?.getBot()?.id, ex);
        }
    }
}
