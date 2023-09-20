/**
 * @description The builder-like class that describes optional parameters for promoting a `Telegram` chat member.
 * Source: https://core.telegram.org/bots/api#promotechatmember
 */
global class TelegramPromoteChatMemberOptions extends BotPayload {
    /**
     * @description Determines the administrator's presence in the chat is hidden
     * @param isAnonymous `True` if the administrator's presence in the chat should be hidden
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions asAnonymous(Boolean isAnonymous) {
        payload.set('is_anonymous', isAnonymous, true);
        return this;
    }

    /**
     * @description Determines if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode
     * @param allow `True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowManageChat(Boolean allow) {
        payload.set('can_manage_chat', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can create channel posts, channels only
     * @param allow `True` if the administrator can create channel posts, channels only
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowPostMessages(Boolean allow) {
        payload.set('can_post_messages', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can edit messages of other users and can pin messages, channels only
     * @param allow `True` if the administrator can edit messages of other users and can pin messages, channels only
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowEditMessages(Boolean allow) {
        payload.set('can_edit_messages', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can delete messages of other users
     * @param allow `True` if the administrator can delete messages of other users
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowDeleteMessages(Boolean allow) {
        payload.set('can_delete_messages', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can manage video chats
     * @param allow `True` if the administrator can manage video chats
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowManageVideoChats(Boolean allow) {
        payload.set('can_manage_video_chats', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can restrict, ban or unban chat members
     * @param allow `True` if the administrator can restrict, ban or unban chat members
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowRestrictMembers(Boolean allow) {
        payload.set('can_restrict_members', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly
     * @param allow `True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowPromoteMembers(Boolean allow) {
        payload.set('can_promote_members', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can change chat title, photo and other settings
     * @param allow `True` if the administrator can change chat title, photo and other settings
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowChangeInfo(Boolean allow) {
        payload.set('can_change_info', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can invite new users to the chat
     * @param allow `True` if the administrator can invite new users to the chat
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowInviteUsers(Boolean allow) {
        payload.set('can_invite_users', allow, true);
        return this;
    }

    /**
     * @description Determines if the administrator can pin messages, supergroups only
     * @param allow `True` if the administrator can pin messages, supergroups only
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowPinMessages(Boolean allow) {
        payload.set('can_pin_messages', allow, true);
        return this;
    }

    /**
     * @description Determines if the user is allowed to create, rename, close, and reopen forum topics, supergroups only
     * @param allow `True` if the user is allowed to create, rename, close, and reopen forum topics, supergroups only
     * @return The current instance of the <<TelegramPromoteChatMemberOptions>> class
     */
    global TelegramPromoteChatMemberOptions allowManageTopics(Boolean allow) {
        payload.set('can_manage_topics', allow, true);
        return this;
    }
}
