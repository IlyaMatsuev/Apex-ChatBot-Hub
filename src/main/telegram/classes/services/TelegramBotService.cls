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
     * @description Creates an instance of the `Telegram` chat service
     * @param chatId The id of the chat which information needs to be updated
     * @return The instance of the <<TelegramBotChatService>> class
     */
    global TelegramBotChatService chat(String chatId) {
        return new TelegramBotChatService(chatId, calloutService);
    }

    // TODO:
    // - TelegramBotMyService
    // - TelegramBotInlineQueryService
    // - TelegramBotEditService
    // - TelegramBotStickerService
}
