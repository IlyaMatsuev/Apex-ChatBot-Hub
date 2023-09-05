/**
 * @description The class designed for handling webhook events specifically for `Telegram` bots
 */
global abstract class TelegramBotHandler implements IBotHandler {
    /**
     * @description The method that is called when a new message is received from a user
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotMessageEvent>> class, describing the received message event
     */
    global abstract void onMessageReceived(TelegramBotContext context, TelegramBotMessageEvent event);

    /**
     * @description The method that is called when a message is edited by the user
     * @param context The `Telegram` bot context
     * @param event The instance of <<TelegramBotMessageEvent>> class, describing the edited message event
     */
    global virtual void onMessageEdited(TelegramBotContext context, TelegramBotMessageEvent event) {}

    /**
     * @description The common handler for all webhook event types
     * @param context The context variable that contains all necessary methods for handling the incoming update. The instance of the <<TelegramBotContext>> class
     * @param event The information about the received update from the bot. E.g. new message, sender, chat, etc. The instance of the <<TelegramBotUpdateEvent>> class
     */
    global void handle(IBotContext context, IBotUpdateEvent event) {
        TelegramBotContext tgContext = (TelegramBotContext) context;
        TelegramBotUpdateEvent tgEvent = (TelegramBotUpdateEvent) event;
        TelegramBotUpdateEventType eventType = tgEvent.getType();

        // TODO: Other event types (need to check API)
        if (eventType == TelegramBotUpdateEventType.Message) {
            onMessageReceived(tgContext, new TelegramBotMessageEvent(TelegramBotUpdateEventType.Message, tgEvent));
        } else if (eventType == TelegramBotUpdateEventType.EditedMessage) {
            onMessageEdited(tgContext, new TelegramBotMessageEvent(TelegramBotUpdateEventType.EditedMessage, tgEvent));
        }
    }
}
