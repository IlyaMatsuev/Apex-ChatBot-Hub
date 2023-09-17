global class TelegramBotChatService {
    private final String chatId;
    private final BotCalloutService calloutService;

    public TelegramBotChatService(String chatId, BotCalloutService calloutService) {
        this.chatId = chatId;
        this.calloutService = calloutService;
    }

    /**
     * @description Gets the information about the chat
     * @return The instance of the <<TelegramChat>> class
     */
    global TelegramChat get() {
        BotJsonPayload response = call(TelegramBotMethod.GetChat, new BotJsonPayload());
        return new TelegramChat(response.getJsonPayload('result'));
    }

    /**
     * @description Gets the list of non-bot administrator members in the chat
     * @return The list of the <<TelegramChatMemberAdmin>> class
     */
    global List<TelegramChatMemberAdmin> getAdministrators() {
        List<TelegramChatMemberAdmin> admins = new List<TelegramChatMemberAdmin>();
        BotJsonPayload response = call(TelegramBotMethod.GetChatAdministrators, new BotJsonPayload());
        for (BotJsonPayload memberPayload : response.getJsonPayloadList('result')) {
            admins.add(new TelegramChatMemberAdmin(memberPayload));
        }
        return admins;
    }

    /**
     * @description Leaves the chat group, supergroup or channel
     */
    global void leave() {
        call(TelegramBotMethod.LeaveChat, new BotJsonPayload());
    }

    /**
     * @description Creates an instance of the `Telegram` chat invite link service
     * @return The instance of the <<TelegramBotChatInviteLinkService>> class
     */
    global TelegramBotChatInviteLinkService inviteLink() {
        return new TelegramBotChatInviteLinkService(chatId, calloutService);
    }

    /**
     * @description Creates an instance of the `Telegram` chat join request service
     * @param userId The `Telegram` id of the user whose request needs to be approved or declined
     * @return The instance of the <<TelegramBotChatJoinRequestService>> class
     */
    global TelegramBotChatJoinRequestService joinRequest(Integer userId) {
        return new TelegramBotChatJoinRequestService(chatId, userId, calloutService);
    }

    /**
     * @description Creates an instance of the `Telegram` chat member service
     * @param userId The `Telegram` id of the chat member user
     * @return The instance of the <<TelegramBotChatMemberService>> class
     */
    global TelegramBotChatMemberService member(Integer userId) {
        return new TelegramBotChatMemberService(chatId, userId, calloutService);
    }

    /**
     * @description Gets the number of members in the chat
     * @return The members count
     */
    global Integer getMembersCount() {
        return call(TelegramBotMethod.GetChatMemberCount, new BotJsonPayload()).getInteger('result');
    }

    /**
     * @description Sets the default permissions for all members of the chat. The bot must be an administrator in the group or a supergroup for this to work and must have the `can_restrict_members` administrator rights
     * @param permissions Object representing applied permissions
     */
    global void setPermissions(TelegramChatPermissions permissions) {
        BotJsonPayload request = new BotJsonPayload(permissions).set('use_independent_chat_permissions', true);
        call(TelegramBotMethod.SetChatPermissions, request);
    }

    /**
     * @description Sets the new chat profile photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param photo New chat photo `Telegram` file id
     */
    global void setPhoto(String photo) {
        call(TelegramBotMethod.SetChatPhoto, new BotJsonPayload().set('photo', photo));
    }

    /**
     * @description Deletes the chat profile photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     */
    global void deletePhoto() {
        call(TelegramBotMethod.DeleteChatPhoto, new BotJsonPayload());
    }

    /**
     * @description Sets the new chat title. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param title New chat title, `1-128` characters
     */
    global void setTitle(String title) {
        call(TelegramBotMethod.SetChatTitle, new BotJsonPayload().set('title', title));
    }

    /**
     * @description Sets the new chat description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param description New chat description, `0-255` characters
     */
    global void setDescription(String description) {
        call(TelegramBotMethod.SetChatDescription, new BotJsonPayload().set('description', description));
    }

    /**
     * @description Pins the message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel
     * @param messageId The unique chat message id
     */
    global void pinMessage(Integer messageId) {
        pinMessage(messageId, null);
    }

    /**
     * @description Pins the message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel
     * @param messageId The unique chat message id
     * @param disableNotification `True` if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats
     */
    global void pinMessage(Integer messageId, Boolean disableNotification) {
        BotJsonPayload request = new BotJsonPayload()
            .set('message_id', messageId)
            .set('disable_notification', disableNotification, true);

        call(TelegramBotMethod.PinChatMessage, request);
    }

    /**
     * @description Unpins the last pinned message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel
     */
    global void unpinMessage() {
        unpinMessage(null);
    }

    /**
     * @description Unpins the message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel
     * @param messageId The unique pinned chat message id
     */
    global void unpinMessage(Integer messageId) {
        call(TelegramBotMethod.UnpinChatMessage, new BotJsonPayload().set('message_id', messageId, true));
    }

    /**
     * @description Unpins messages in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel
     */
    global void unpinAllMessages() {
        call(TelegramBotMethod.UnpinAllChatMessages, new BotJsonPayload());
    }

    /**
     * @description Sets a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     * @param stickerSetName The name of the sticker set to be set as the group sticker set
     */
    global void setStickerSet(String stickerSetName) {
        call(TelegramBotMethod.SetChatStickerSet, new BotJsonPayload().set('sticker_set_name', stickerSetName));
    }

    /**
     * @description Deletes a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights
     */
    global void deleteStickerSet() {
        call(TelegramBotMethod.DeleteChatStickerSet, new BotJsonPayload());
    }

    private BotJsonPayload call(TelegramBotMethod method, BotJsonPayload request) {
        return calloutService.call(method, new BotJsonPayload(request).set('chat_id', chatId));
    }
}
