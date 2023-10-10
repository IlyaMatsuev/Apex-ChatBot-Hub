/**
 * @description The concrete service for the `Telegram` messenger bots. Extends <<BotService>> but also contains features related to `Telegram` only
 */
global class TelegramBotService extends BotService {

    private TelegramBotService() {}

    /**
     * @description Creates an instance of the `Telegram` sender service
     * @param chatId The id of the chat where the information has to be sent
     * @return The `Telegram` implementation of the <<IBotSenderService>> interface
     */
    global TelegramBotSenderService send(String chatId) {
        return new TelegramBotSenderService(
            chatId,
            calloutService,
            new BotService.SaveSentMessageCallback(new List<String> { chatId }, bot)
        );
    }

    /**
     * @description Creates an instance of the `Telegram` edit service
     * @param chatId The id of the chat where a message needs to be edited
     * @param messageId The id of the message to edit
     * @return The instance of the <<TelegramBotEditorService>> class
     */
    global TelegramBotEditorService edit(String chatId, String messageId) {
        return edit(chatId, messageId, false);
    }

    /**
     * @description Creates an instance of the `Telegram` edit service
     * @param chatId The id of the chat where a message needs to be edited
     * @param messageId The id of the message to edit
     * @param isInlineMessage Determines if the message to edit is an inline message
     * @return The instance of the <<TelegramBotEditorService>> class
     */
    global TelegramBotEditorService edit(String chatId, String messageId, Boolean isInlineMessage) {
        return new TelegramBotEditorService(chatId, messageId, isInlineMessage, calloutService);
    }

    /**
     * @description Creates an instance of the `Telegram` chat service
     * @param chatId The id of the chat which information needs to be updated
     * @return The instance of the <<TelegramBotChatService>> class
     */
    global TelegramBotChatService chat(String chatId) {
        return new TelegramBotChatService(chatId, calloutService);
    }

    /**
     * @description Creates an instance of the `Telegram` inline query service
     * @param inlineQueryId The unique identifier for the answered query
     * @return The instance of the <<TelegramBotInlineQueryService>> class
     */
    global TelegramBotInlineQueryService inlineQuery(String inlineQueryId) {
        return new TelegramBotInlineQueryService(inlineQueryId, calloutService);
    }

    /**
     * @description Creates an instance of the `Telegram` `me` service
     * @return The instance of the <<TelegramBotMeService>> class
     */
    global TelegramBotMeService me() {
        return new TelegramBotMeService(calloutService);
    }
}
