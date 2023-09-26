/**
 * @description Service class that provides access to all `Telegram` `chatInviteLink` methods
 */
global class TelegramBotChatInviteLinkService {
    private final String chatId;
    private final BotCalloutService calloutService;

    public TelegramBotChatInviteLinkService(String chatId, BotCalloutService calloutService) {
        this.chatId = chatId;
        this.calloutService = calloutService;
    }

    /**
     * @description Generates a new primary invite link for the chat. Any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @return The new chat invite link
     */
    global String export() {
        return call(TelegramBotMethod.ExportChatInviteLink, new BotJsonPayload()).getString('result');
    }

    /**
     * @description Creates an additional invite link for the chat. The link can be revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @return The instance of the <<TelegramChatInviteLink>> class
     */
    global TelegramChatInviteLink create() {
        return create(new LinkOptions());
    }

    /**
     * @description Creates an additional invite link for the chat. The link can be revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param options The additional invite link options
     * @return The instance of the <<TelegramChatInviteLink>> class
     */
    global TelegramChatInviteLink create(LinkOptions options) {
        BotJsonPayload response = call(TelegramBotMethod.CreateChatInviteLink, options.getJsonPayload());
        return new TelegramChatInviteLink(response.getJsonPayload('result'));
    }

    /**
     * @description Edits a non-primary invite link for the chat created by bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param inviteLink The invite link to edit
     * @return The instance of the <<TelegramChatInviteLink>> class
     */
    global TelegramChatInviteLink edit(String inviteLink) {
        return edit(inviteLink, new LinkOptions());
    }

    /**
     * @description Edits a non-primary invite link for the chat created by bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param inviteLink The invite link to edit
     * @param options The additional invite link options
     * @return The instance of the <<TelegramChatInviteLink>> class
     */
    global TelegramChatInviteLink edit(String inviteLink, LinkOptions options) {
        BotJsonPayload request = new BotJsonPayload(options).set('invite_link', inviteLink);
        BotJsonPayload response = call(TelegramBotMethod.EditChatInviteLink, request);
        return new TelegramChatInviteLink(response.getJsonPayload('result'));
    }

    /**
     * @description Revokes the invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param inviteLink The invite link to revoke
     */
    global void revoke(String inviteLink) {
        call(TelegramBotMethod.RevokeChatInviteLink, new BotJsonPayload().set('invite_link', inviteLink));
    }

    private BotJsonPayload call(TelegramBotMethod method, BotJsonPayload request) {
        return calloutService.call(method, new BotJsonPayload(request).set('chat_id', chatId));
    }

    /**
     * @description Represents the optional parameters for `create` and `edit` chat invite link methods.
     * Source: https://core.telegram.org/bots/api#createchatinvitelink
     */
    global class LinkOptions extends BotPayload {
        /**
         * @description Creates a new instance of the invite link options without the link name
         */
        global LinkOptions() {
            this(null);
        }

        /**
         * @description Creates a new instance of the invite link options with the provided link name
         * @param name The link name
         */
        global LinkOptions(String name) {
            payload.set('name', name, true);
        }

        /**
         * @description Sets the point in time when the link will expire
         * @param expireDate The point in time when the link will expire
         * @return The current instance of the <<TelegramBotChatInviteLinkService.LinkOptions>> class
         */
        global LinkOptions withExpireDate(DateTime expireDate) {
            payload.set('expire_date', expireDate.getTime());
            return this;
        }

        /**
         * @description Sets the maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link
         * @param memberLimit The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link, `1-99999`
         * @return The current instance of the <<TelegramBotChatInviteLinkService.LinkOptions>> class
         */
        global LinkOptions withMemberLimit(Integer memberLimit) {
            payload.set('member_limit', memberLimit, true);
            return this;
        }

        /**
         * @description Sets if users joining the chat via the link need to be approved by chat administrators. If `True` member limit can't be specified
         * @return The current instance of the <<TelegramBotChatInviteLinkService.LinkOptions>> class
         */
        global LinkOptions withRequestApproval() {
            payload.set('creates_join_request', true);
            return this;
        }
    }
}
