/**
 * @description Describes the common payload properties for the `Telegram` bot chat member updated events
 * Source: https://core.telegram.org/bots/api#chatmemberupdated
 */
global class TelegramChatMemberUpdatedEvent extends BotPayload {
    /**
     * @description The chat the user belongs to
     */
    global TelegramChat chat { get { return new TelegramChat(payload.getJsonPayload('chat')); } }

    /**
     * @description The performer of the action, which resulted in the change
     */
    global TelegramUser sender { get { return new TelegramUser(payload.getJsonPayload('from')); } }

    /**
     * @description The date the change was done
     */
    global DateTime changeDate { get { return payload.getDateTime('date'); } }

    /**
     * @description The previous information about the chat member
     */
    global Member oldChatMember { get { return getChatMember('old_chat_member'); } }

    /**
     * @description The new information about the chat member
     */
    global Member newChatMember { get { return getChatMember('new_chat_member'); } }

    /**
     * @description The chat invite link, which was used by the user to join the chat; for joining by invite link events only
     */
    global TelegramChatInviteLink inviteLink {
        get { return new TelegramChatInviteLink(payload.getJsonPayload('invite_link')); }
    }

    /**
     * @description `True` if the user joined the chat via a chat folder invite link
     */
    global Boolean viaChatFolderInviteLink { get { return payload.getBoolean('via_chat_folder_invite_link'); } }

    public TelegramChatMemberUpdatedEvent(BotJsonPayload payload) {
        super(payload);
    }

    private Member getChatMember(String payloadKey) {
        BotJsonPayload memberPayload = payload.getJsonPayload(payloadKey);
        switch on memberPayload.getString('status') {
            when 'creator' {
                return new OwnerMember(memberPayload);
            }
            when 'administrator' {
                return new AdministratorMember(memberPayload);
            }
            when 'restricted' {
                return new RestrictedMember(memberPayload);
            }
            when 'left' {
                return new LeftMember(memberPayload);
            }
            when 'kicked' {
                return new BannedMember(memberPayload);
            }
        }
        return new Member(memberPayload);
    }

    /**
     * @description Describes the information about a banned chat member
     * Source: https://core.telegram.org/bots/api#chatmemberbanned
     */
    global class BannedMember extends Member {
        /**
         * @description The date when restrictions will be lifted for this user. If `0` then the user is restricted forever
         */
        global DateTime untilDate { get { return payload.getDateTime('until_date'); } }

        public BannedMember(BotJsonPayload payload) {
            super(payload);
        }
    }

    /**
     * @description Describes the information about a left chat member
     * Source: https://core.telegram.org/bots/api#chatmemberleft
     */
    global class LeftMember extends Member {
        public LeftMember(BotJsonPayload payload) {
            super(payload);
        }
    }

    /**
     * @description Describes the information about a restricted chat member
     * Source: https://core.telegram.org/bots/api#chatmemberrestricted
     */
    global class RestrictedMember extends Member {
        /**
         * @description `True` if the user is a member of the chat at the moment of the request
         */
        global Boolean isMember { get { return payload.getBoolean('is_member'); } }

        /**
         * @description `True` if the user is allowed to send text messages, contacts, invoices, locations and venues
         */
        global Boolean canSendMessages { get { return payload.getBoolean('can_send_messages'); } }

        /**
         * @description `True` if the user is allowed to send audios
         */
        global Boolean canSendAudios { get { return payload.getBoolean('can_send_audios'); } }

        /**
         * @description `True` if the user is allowed to send documents
         */
        global Boolean canSendDocuments { get { return payload.getBoolean('can_send_documents'); } }

        /**
         * @description `True` if the user is allowed to send photos
         */
        global Boolean canSendPhotos { get { return payload.getBoolean('can_send_photos'); } }

        /**
         * @description `True` if the user is allowed to send videos
         */
        global Boolean canSendVideos { get { return payload.getBoolean('can_send_videos'); } }

        /**
         * @description `True` if the user is allowed to send video notes
         */
        global Boolean canSendVideoNotes { get { return payload.getBoolean('can_send_video_notes'); } }

        /**
         * @description `True` if the user is allowed to send voice notes
         */
        global Boolean canSendVoiceNotes { get { return payload.getBoolean('can_send_voice_notes'); } }

        /**
         * @description `True` if the user is allowed to send polls
         */
        global Boolean canSendPolls { get { return payload.getBoolean('can_send_polls'); } }

        /**
         * @description `True` if the user is allowed to send animations, games, stickers and use inline bots
         */
        global Boolean canSendOtherMessages { get { return payload.getBoolean('can_send_other_messages'); } }

        /**
         * @description `True` if the user is allowed to add web page previews to their messages
         */
        global Boolean canAddWebPagePreviews { get { return payload.getBoolean('can_add_web_page_previews'); } }

        /**
         * @description `True` if the user is allowed to change the chat title, photo and other settings
         */
        global Boolean canChangeInfo { get { return payload.getBoolean('can_change_info'); } }

        /**
         * @description `True` if the user is allowed to invite new users to the chat
         */
        global Boolean canInviteUsers { get { return payload.getBoolean('can_invite_users'); } }

        /**
         * @description `True` if the user is allowed to pin messages
         */
        global Boolean canPinMessages { get { return payload.getBoolean('can_pin_messages'); } }

        /**
         * @description `True` if the user is allowed to create forum topics
         */
        global Boolean canManageTopics { get { return payload.getBoolean('can_manage_topics'); } }

        /**
         * @description The date when restrictions will be lifted for this user. If `0` then the user is restricted forever
         */
        global DateTime untilDate { get { return payload.getDateTime('until_date'); } }

        public RestrictedMember(BotJsonPayload payload) {
            super(payload);
        }
    }

    /**
     * @description Describes the information about an administrator chat member
     * Source: https://core.telegram.org/bots/api#chatmemberadministrator
     */
    global class AdministratorMember extends OwnerMember {
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

        public AdministratorMember(BotJsonPayload payload) {
            super(payload);
        }
    }

    /**
     * @description Describes the information about an owner chat member
     * Source: https://core.telegram.org/bots/api#chatmemberowner
     */
    global virtual class OwnerMember extends Member {
        /**
         * @description `True` if the user's presence in the chat is hidden
         */
        global Boolean isAnonymous { get { return payload.getBoolean('is_anonymous'); } }

        /**
         * @description The custom title for this user
         */
        global String customTitle { get { return payload.getString('custom_title'); } }

        public OwnerMember(BotJsonPayload payload) {
            super(payload);
        }
    }

    /**
     * @description Describes the information about a basic chat member
     * Source: https://core.telegram.org/bots/api#chatmembermember
     */
    global virtual class Member extends BotPayload {
        /**
         * @description The member's status in the chat. One of `member`, `creator`, `administrator`, `restricted`, `left` or `kicked`
         */
        global String status { get { return payload.getString('status'); } }

        /**
         * @description The information about the user
         */
        global TelegramUser user { get { return new TelegramUser(payload.getJsonPayload('user')); } }

        public Member(BotJsonPayload payload) {
            super(payload);
        }
    }
}
