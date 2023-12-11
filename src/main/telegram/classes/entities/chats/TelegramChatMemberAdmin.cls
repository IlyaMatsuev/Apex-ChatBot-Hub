/**
 * @description Describes the information about an administrator `Telegram` chat member.
 * Source: https://core.telegram.org/bots/api#chatmemberadministrator
 */
global class TelegramChatMemberAdmin extends TelegramChatMemberOwner {
    /**
     * @description `True` if the bot is allowed to edit administrator privileges of that user
     */
    global Boolean canBeEdited { get { return payload.getBoolean('can_be_edited'); } }

    /**
     * @description `True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode
     */
    global Boolean canManageChat { get { return payload.getBoolean('can_manage_chat'); } }

    /**
     * @description `True` if the administrator can delete messages of other users
     */
    global Boolean canDeleteMessages { get { return payload.getBoolean('can_delete_messages'); } }

    /**
     * @description `True` if the administrator can manage video chats
     */
    global Boolean canManageVideoChats { get { return payload.getBoolean('can_manage_video_chats'); } }

    /**
     * @description `True` if the administrator can restrict, ban or unban chat members
     */
    global Boolean canRestrictMembers { get { return payload.getBoolean('can_restrict_members'); } }

    /**
     * @description `True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly
     */
    global Boolean canPromoteMembers { get { return payload.getBoolean('can_promote_members'); } }

    /**
     * @description `True` if the user is allowed to change the chat title, photo and other settings
     */
    global Boolean canChangeInfo { get { return payload.getBoolean('can_change_info'); } }

    /**
     * @description `True` if the user is allowed to invite new users to the chat
     */
    global Boolean canInviteUsers { get { return payload.getBoolean('can_invite_users'); } }

    /**
     * @description `True` if the administrator can post in the channel; channels only
     */
    global Boolean canPostMessages { get { return payload.getBoolean('can_post_messages'); } }

    /**
     * @description `True` if the administrator can edit messages of other users and can pin messages; channels only
     */
    global Boolean canEditMessages { get { return payload.getBoolean('can_edit_messages'); } }

    /**
     * @description `True` if the user is allowed to pin messages; groups and supergroups only
     */
    global Boolean canPinMessages { get { return payload.getBoolean('can_pin_messages'); } }

    /**
     * @description `True` if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
     */
    global Boolean canManageTopics { get { return payload.getBoolean('can_manage_topics'); } }

    public TelegramChatMemberAdmin(BotJsonPayload payload) {
        super(payload);
    }
}
