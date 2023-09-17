/**
 * @description Describes the information about a restricted `Telegram` chat member
 * Source: https://core.telegram.org/bots/api#chatmemberrestricted
 */
global class TelegramChatMemberRestricted extends TelegramChatMember {
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

    public TelegramChatMemberRestricted(BotJsonPayload payload) {
        super(payload);
    }
}
