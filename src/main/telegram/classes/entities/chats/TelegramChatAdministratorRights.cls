/**
 * @description Describes the default administrator chat permissions payload for a `Telegram` bot.
 * Source: https://core.telegram.org/bots/api#chatadministratorrights
 */
global class TelegramChatAdministratorRights extends BotPayload {
    /**
     * @description `True` if the administrator's presence in the chat should be hidden
     */
    global Boolean isAnonymous {
        get { return payload.getBoolean('is_anonymous'); }
        private set { payload.set('is_anonymous', value, true); }
    }

    /**
     * @description `True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode
     */
    global Boolean canManageChat {
        get { return payload.getBoolean('can_manage_chat'); }
        private set { payload.set('can_manage_chat', value, true); }
    }

    /**
     * @description `True` if the administrator can delete messages of other users
     */
    global Boolean canDeleteMessages {
        get { return payload.getBoolean('can_delete_messages'); }
        private set { payload.set('can_delete_messages', value, true); }
    }

    /**
     * @description `True` if the administrator can manage video chats
     */
    global Boolean canManageVideoChats {
        get { return payload.getBoolean('can_manage_video_chats'); }
        private set { payload.set('can_manage_video_chats', value, true); }
    }

    /**
     * @description `True` if the administrator can restrict, ban or unban chat members
     */
    global Boolean canRestrictMembers {
        get { return payload.getBoolean('can_restrict_members'); }
        private set { payload.set('can_restrict_members', value, true); }
    }

    /**
     * @description `True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly
     */
    global Boolean canPromoteMembers {
        get { return payload.getBoolean('can_promote_members'); }
        private set { payload.set('can_promote_members', value, true); }
    }

    /**
     * @description `True` if the user is allowed to change the chat title, photo and other settings
     */
    global Boolean canChangeInfo {
        get { return payload.getBoolean('can_change_info'); }
        private set { payload.set('can_change_info', value, true); }
    }

    /**
     * @description `True` if the user is allowed to invite new users to the chat
     */
    global Boolean canInviteUsers {
        get { return payload.getBoolean('can_invite_users'); }
        private set { payload.set('can_invite_users', value, true); }
    }

    /**
     * @description `True` if the administrator can post in the channel; channels only
     */
    global Boolean canPostMessages {
        get { return payload.getBoolean('can_post_messages'); }
        private set { payload.set('can_post_messages', value, true); }
    }

    /**
     * @description `True` if the administrator can edit messages of other users and can pin messages; channels only
     */
    global Boolean canEditMessages {
        get { return payload.getBoolean('can_edit_messages'); }
        private set { payload.set('can_edit_messages', value, true); }
    }

    /**
     * @description `True` if the user is allowed to pin messages; groups and supergroups only
     */
    global Boolean canPinMessages {
        get { return payload.getBoolean('can_pin_messages'); }
        private set { payload.set('can_pin_messages', value, true); }
    }

    /**
     * @description `True` if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
     */
    global Boolean canManageTopics {
        get { return payload.getBoolean('can_manage_topics'); }
        private set { payload.set('can_manage_topics', value, true); }
    }

    /**
     * @description Creates a new instance of the chat admin rights
     */
    global TelegramChatAdministratorRights() {
        super();
    }

    public TelegramChatAdministratorRights(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Determines the administrator's presence in the chat is hidden
     * @param isAnonymous `True` if the administrator's presence in the chat should be hidden
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights asAnonymous(Boolean isAnonymous) {
        this.isAnonymous = isAnonymous;
        return this;
    }

    /**
     * @description Determines if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode
     * @param allow `True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowManageChat(Boolean allow) {
        canManageChat = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can create channel posts, channels only
     * @param allow `True` if the administrator can create channel posts, channels only
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowPostMessages(Boolean allow) {
        canPostMessages = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can edit messages of other users and can pin messages, channels only
     * @param allow `True` if the administrator can edit messages of other users and can pin messages, channels only
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowEditMessages(Boolean allow) {
        canEditMessages = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can delete messages of other users
     * @param allow `True` if the administrator can delete messages of other users
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowDeleteMessages(Boolean allow) {
        canDeleteMessages = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can manage video chats
     * @param allow `True` if the administrator can manage video chats
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowManageVideoChats(Boolean allow) {
        canManageVideoChats = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can restrict, ban or unban chat members
     * @param allow `True` if the administrator can restrict, ban or unban chat members
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowRestrictMembers(Boolean allow) {
        canRestrictMembers = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly
     * @param allow `True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowPromoteMembers(Boolean allow) {
        canPromoteMembers = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can change chat title, photo and other settings
     * @param allow `True` if the administrator can change chat title, photo and other settings
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowChangeInfo(Boolean allow) {
        canChangeInfo = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can invite new users to the chat
     * @param allow `True` if the administrator can invite new users to the chat
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowInviteUsers(Boolean allow) {
        canInviteUsers = allow;
        return this;
    }

    /**
     * @description Determines if the administrator can pin messages, supergroups only
     * @param allow `True` if the administrator can pin messages, supergroups only
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowPinMessages(Boolean allow) {
        canPinMessages = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to create, rename, close, and reopen forum topics, supergroups only
     * @param allow `True` if the user is allowed to create, rename, close, and reopen forum topics, supergroups only
     * @return The current instance of the <<TelegramChatAdministratorRights>> class
     */
    global TelegramChatAdministratorRights allowManageTopics(Boolean allow) {
        canManageTopics = allow;
        return this;
    }
}
