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

    /**
     * @description Gets the details about the bot account
     * @return The instance of the <<ViberAccount>> class
     */
    global ViberAccount getAccount() {
        BotJsonPayload response = calloutService.call(ViberBotMethod.GetAccountInfo, new BotJsonPayload());
        return new ViberAccount(response);
    }

    /**
     * @description Gets the details about the a `Viber` user account
     * @param userId The unique `Viber` user id
     * @return The instance of the <<ViberUser>> class
     */
    global ViberUser getUser(String userId) {
        BotJsonPayload request = new BotJsonPayload().set('id', userId);
        BotJsonPayload response = calloutService.call(ViberBotMethod.GetUserDetails, request);
        return new ViberUser(response.getJsonPayload('user'));
    }

    /**
     * @description Gets the online status of the provided user account
     * @param userId The unique `Viber` user id
     * @return The instance of the <<ViberUser>> class
     */
    global ViberOnlineStatus getOnline(String userId) {
        return getOnline(new List<String> { userId }).get(0);
    }

    /**
     * @description Gets the online status of the provided user accounts
     * @param userIds The unique `Viber` user ids
     * @return The list of the <<ViberUser>> class
     */
    global List<ViberOnlineStatus> getOnline(List<String> userIds) {
        List<ViberOnlineStatus> statuses = new List<ViberOnlineStatus>();
        BotJsonPayload request = new BotJsonPayload().set('ids', new Set<String>(userIds));
        BotJsonPayload response = calloutService.call(ViberBotMethod.GetOnline, request);
        for (BotJsonPayload statusPayload : response.getJsonPayloadList('users')) {
            statuses.add(new ViberOnlineStatus(statusPayload));
        }
        return statuses;
    }
}
