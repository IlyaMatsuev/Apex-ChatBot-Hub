/**
 * @description Service class that provides access to all `Telegram` `chatJoinRequest` methods
 */
global class TelegramBotChatJoinRequestService {
    private final String chatId;
    private final String userId;
    private final BotCalloutService calloutService;

    public TelegramBotChatJoinRequestService(String chatId, String userId, BotCalloutService calloutService) {
        this.chatId = chatId;
        this.userId = userId;
        this.calloutService = calloutService;
    }

    /**
     * @description Approves the join request. The bot must be an administrator in the chat for this to work and must have the `can_invite_users` administrator right
     */
    global void approve() {
        call(TelegramBotMethod.ApproveChatJoinRequest);
    }

    /**
     * @description Declines the join request. The bot must be an administrator in the chat for this to work and must have the `can_invite_users` administrator right
     */
    global void decline() {
        call(TelegramBotMethod.DeclineChatJoinRequest);
    }

    private void call(TelegramBotMethod method) {
        calloutService.call(method, new BotJsonPayload().set('chat_id', chatId).set('user_id', userId));
    }
}
