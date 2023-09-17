/**
 * @description Service class that provides access to all `Telegram` `chatMember` methods
 */
global class TelegramBotChatMemberService {
    private final String chatId;
    private final Integer userId;
    private final BotCalloutService calloutService;

    public TelegramBotChatMemberService(String chatId, Integer userId, BotCalloutService calloutService) {
        this.chatId = chatId;
        this.userId = userId;
        this.calloutService = calloutService;
    }

    /**
     * @description Gets information about a chat member of the chat. The method is only guaranteed to work for other users if the bot is an administrator in the chat
     * @return The instance of the <<TelegramChatMember>> class
     */
    global TelegramChatMember get() {
        BotJsonPayload response = call(TelegramBotMethod.GetChatMember, new BotJsonPayload());
        return TelegramChatMember.getChatMember(response.getJsonPayload('result'));
    }

    /**
     * @description Bans a user in a group, supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first.
     * The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     */
    global void ban() {
        ban(null);
    }

    /**
     * @description Bans a user in a group, supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first.
     * The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param untilDate The date when the user will be unbanned. If user is banned for more than `366 days` or less than `30 seconds` from the current time they are considered to be banned forever. Applied for supergroups and channels only
     */
    global void ban(DateTime untilDate) {
        ban(untilDate, null);
    }

    /**
     * @description Bans a user in a group, supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first.
     * The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param untilDate The date when the user will be unbanned. If user is banned for more than `366 days` or less than `30 seconds` from the current time they are considered to be banned forever. Applied for supergroups and channels only
     * @param revokeMessages `True` to delete all messages from the chat for the user that is being removed. Always `True` for supergroups and channels
     */
    global void ban(DateTime untilDate, Boolean revokeMessages) {
        BotJsonPayload request = new BotJsonPayload()
            .set('until_date', untilDate?.getTime(), true)
            .set('revoke_messages', revokeMessages, true);

        call(TelegramBotMethod.BanChatMember, request);
    }

    /**
     * @description Unbans a previously banned user in a supergroup or channel. This method does not return a user back to the group automatically. The bot must be an administrator for this to work
     */
    global void unban() {
        call(TelegramBotMethod.UnbanChatMember, new BotJsonPayload().set('only_if_banned', true));
    }

    /**
     * @description Restricts a user in a supergroup. The bot must be an administrator for this to work. Pass `True` for all permissions to lift restrictions from a user
     * @param permissions Object representing applied restrictions
     */
    global void restrict(TelegramChatPermissions permissions) {
        restrict(permissions, null);
    }

    /**
     * @description Restricts a user in a supergroup. The bot must be an administrator for this to work. Pass `True` for all permissions to lift restrictions from a user
     * @param permissions Object representing applied restrictions
     * @param untilDate The date when restrictions will be lifted from the user. If user is restricted for more than `366 days` or less than `30 seconds` from the current time, they are considered to be restricted forever
     */
    global void restrict(TelegramChatPermissions permissions, DateTime untilDate) {
        BotJsonPayload request = new BotJsonPayload()
            .set('permissions', permissions)
            .set('use_independent_chat_permissions', true)
            .set('until_date', untilDate, true);

        call(TelegramBotMethod.RestrictChatMember, request);
    }

    /**
     * @description Promotes or demotes a user in a supergroup or channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param promoteOptions Object representing applied promotions
     */
    global void promote(TelegramPromoteChatMemberOptions promoteOptions) {
        call(TelegramBotMethod.PromoteChatMember, promoteOptions.getJsonPayload());
    }

    /**
     * @description Sets a custom title for an administrator in a supergroup
     * @param title The custom title for the administrator. `0-16` characters, emoji are not allowed
     */
    global void setCustomTitle(String title) {
        call(TelegramBotMethod.SetChatAdministratorCustomTitle, new BotJsonPayload().set('custom_title', title));
    }

    private BotJsonPayload call(TelegramBotMethod method, BotJsonPayload request) {
        return calloutService.call(method, new BotJsonPayload(request).set('chat_id', chatId).set('user_id', userId));
    }
}
