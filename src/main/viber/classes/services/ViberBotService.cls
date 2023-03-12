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
        return sendBroadcast(new List<String> { chatId });
    }

    /**
     * @description Creates an instance of the `Viber` sender service that will send the message to multiple users at once. The method doesn't throw any errors if it failed to send a message to some of the receivers
     * @param chatIds The list of chat ids where the information has to be sent
     * @return The `Viber` implementation of the <<IBotSenderService>>
     */
    global ViberBotSenderService sendBroadcast(List<String> chatIds) {
        return new ViberBotSenderService(
            bot.name,
            chatIds,
            calloutService,
            new BotService.SaveSentMessageCallback(chatIds, bot)
        );
    }
}
