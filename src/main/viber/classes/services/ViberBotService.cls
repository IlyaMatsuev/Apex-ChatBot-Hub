/**
 * @description The concrete service for the `Viber` messanger bots. Extends <<BotService>> but also contains features related to `Viber` only
 */
global class ViberBotService extends BotService {

    private ViberBotService() {}

    /**
     * @description Creates an instance of the `Viber` sender service
     * @param chatId The id of the chat where the information has to be sent
     * @return The `Viber` implementation of the <<IBotSenderService>>
     */
    global ViberBotSenderService send(String chatId) {
        return new ViberBotSenderService(
            chatId,
            bot.name,
            calloutService,
            new BotService.SaveSentMessageCallback(chatId, bot)
        );
    }
}
