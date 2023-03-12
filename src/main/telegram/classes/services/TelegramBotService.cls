/**
 * @description The concrete service for the `Telegram` messanger bots. Extends <<BotService>> but also contains features related to `Telegram` only
 */
global class TelegramBotService extends BotService {

    private TelegramBotService() {}

    /**
     * @description Creates an instance of the `Telegram` sender service
     * @param chatId The id of the chat where the information has to be sent
     * @return The `Telegram` implementation of the <<IBotSenderService>>
     */
    global TelegramBotSenderService send(String chatId) {
        return new TelegramBotSenderService(
            chatId,
            calloutService,
            new BotService.SaveSentMessageCallback(new List<String> { chatId }, bot)
        );
    }
}
