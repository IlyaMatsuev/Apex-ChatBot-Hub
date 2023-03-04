/**
 * @description The concrete service for the `Telegram` messanger bots. Extends `BotService` but also contains features related to `Telegram` only
 */
global class TelegramBotService extends BotService {
    @TestVisible
    private TelegramBotService(Bot__c bot) {
        super(bot);
    }

    /**
     * @description Creates an instance of the `Telegram` sender service
     * @param chatId The id of the chat where something has to be sent
     * @return The `Telegram` implementation of the `IBotSenderService`
     */
    global TelegramBotSenderService send(String chatId) {
        return new TelegramBotSenderService(
            chatId,
            calloutService,
            new BotService.SaveSentMessageCallback(chatId, bot)
        );
    }
}
