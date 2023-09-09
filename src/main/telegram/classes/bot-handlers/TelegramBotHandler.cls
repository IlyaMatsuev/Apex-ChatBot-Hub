/**
 * @description The class designed for handling webhook events specifically for `Telegram` bots
 */
global abstract class TelegramBotHandler implements IBotHandler {
    /**
     * @description The method that is called when a message is edited
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotMessageEvent>> class, describing the edited message event
     */
    global virtual void onMessageEdited(TelegramBotContext context, TelegramBotMessageEvent event) {}

    /**
     * @description The method that is called when a new post is received in a channel
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotMessageEvent>> class, describing the received post event
     */
    global virtual void onChannelPostReceived(TelegramBotContext context, TelegramBotMessageEvent event) {}

    /**
     * @description The method that is called when a post is edited in a channel
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotMessageEvent>> class, describing the edited message event
     */
    global virtual void onChannelPostEdited(TelegramBotContext context, TelegramBotMessageEvent event) {}

    /**
     * @description The method that is called when an inline query is made via the bot
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotInlineQueryEvent>> class, describing the received inline query event
     */
    global virtual void onInlineQuery(TelegramBotContext context, TelegramBotInlineQueryEvent event) {}

    /**
     * @description The method that is called when the result of any inline query was chosen by the user and sent to their chat partner
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotChosenInlineResultEvent>> class, describing the inline query result event
     */
    global virtual void onChosenInlineResult(TelegramBotContext context, TelegramBotChosenInlineResultEvent event) {}

    /**
     * @description The method that is called when a new message is received
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotMessageEvent>> class, describing the received message event
     */
    global abstract void onMessageReceived(TelegramBotContext context, TelegramBotMessageEvent event);

    /**
     * @description The common handler for all webhook event types
     * @param context The context variable that contains all necessary methods for handling the incoming update. The instance of the <<TelegramBotContext>> class
     * @param event The information about the received update from the bot. E.g. new message, sender, chat, etc. The instance of the <<TelegramBotUpdateEvent>> class
     */
    global void handle(IBotContext context, IBotUpdateEvent event) {
        TelegramBotContext tgContext = (TelegramBotContext) context;
        TelegramBotUpdateEvent tgEvent = (TelegramBotUpdateEvent) event;
        TelegramBotUpdateEventType eventType = tgEvent.getType();
        BotJsonPayload eventPayload = tgEvent.getPayload().getJsonPayload(eventType.name());

        // TODO: Other event types (need to check API)
        if (eventType == TelegramBotUpdateEventType.Message) {
            onMessageReceived(tgContext, new TelegramBotMessageEvent(eventPayload));
        } else if (eventType == TelegramBotUpdateEventType.EditedMessage) {
            onMessageEdited(tgContext, new TelegramBotMessageEvent(eventPayload));
        } else if (eventType == TelegramBotUpdateEventType.ChannelPost) {
            onChannelPostReceived(tgContext, new TelegramBotMessageEvent(eventPayload));
        } else if (eventType == TelegramBotUpdateEventType.EditedChannelPost) {
            onChannelPostEdited(tgContext, new TelegramBotMessageEvent(eventPayload));
        } else if (eventType == TelegramBotUpdateEventType.InlineQuery) {
            // TODO: Currently there's no possibility to answer to an inline query with inline results
            onInlineQuery(tgContext, new TelegramBotInlineQueryEvent(eventPayload));
        } else if (eventType == TelegramBotUpdateEventType.ChosenInlineResult) {
            onChosenInlineResult(tgContext, new TelegramBotChosenInlineResultEvent(eventPayload));
        }
    }
}
