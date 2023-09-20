/**
 * @description Describes the chat permissions payload that can be received as part of an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#chatpermissions
 */
global class TelegramChatPermissions extends BotPayload {
    /**
     * @description `True` if the user is allowed to send text messages, contacts, invoices, locations and venues
     */
    global Boolean canSendMessages {
        get { return payload.getBoolean('can_send_messages'); }
        private set { payload.set('can_send_messages', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send audios
     */
    global Boolean canSendAudios {
        get { return payload.getBoolean('can_send_audios'); }
        private set { payload.set('can_send_audios', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send documents
     */
    global Boolean canSendDocuments {
        get { return payload.getBoolean('can_send_documents'); }
        private set { payload.set('can_send_documents', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send photos
     */
    global Boolean canSendPhotos {
        get { return payload.getBoolean('can_send_photos'); }
        private set { payload.set('can_send_photos', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send videos
     */
    global Boolean canSendVideos {
        get { return payload.getBoolean('can_send_videos'); }
        private set { payload.set('can_send_videos', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send video notes
     */
    global Boolean canSendVideoNotes {
        get { return payload.getBoolean('can_send_video_notes'); }
        private set { payload.set('can_send_video_notes', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send voice notes
     */
    global Boolean canSendVoiceNotes {
        get { return payload.getBoolean('can_send_voice_notes'); }
        private set { payload.set('can_send_voice_notes', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send polls
     */
    global Boolean canSendPolls {
        get { return payload.getBoolean('can_send_polls'); }
        private set { payload.set('can_send_polls', value, true); }
    }

    /**
     * @description `True` if the user is allowed to send animations, games, stickers and use inline bots
     */
    global Boolean canSendOtherMessages {
        get { return payload.getBoolean('can_send_other_messages'); }
        private set { payload.set('can_send_other_messages', value, true); }
    }

    /**
     * @description `True` if the user is allowed to add web page previews to their messages
     */
    global Boolean canAddWebPagePreviews {
        get { return payload.getBoolean('can_add_web_page_previews'); }
        private set { payload.set('can_add_web_page_previews', value, true); }
    }

    /**
     * @description `True` if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
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
     * @description `True` if the user is allowed to pin messages. Ignored in public supergroups
     */
    global Boolean canPinMessages {
        get { return payload.getBoolean('can_pin_messages'); }
        private set { payload.set('can_pin_messages', value, true); }
    }

    /**
     * @description `True` if the user is allowed to create forum topics. If omitted defaults to the value of can_pin_messages
     */
    global Boolean canManageTopics {
        get { return payload.getBoolean('can_manage_topics'); }
        private set { payload.set('can_manage_topics', value, true); }
    }

    /**
     * @description Creates a new instance of chat permissions
     */
    global TelegramChatPermissions() {
        super();
    }

    public TelegramChatPermissions(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Determines if the user is allowed to send text messages, contacts, invoices, locations and venues
     * @param allow `True` if the user is allowed to send text messages, contacts, invoices, locations and venues
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendMessages(Boolean allow) {
        canSendMessages = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send audios
     * @param allow `True` if the user is allowed to send audios
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendAudios(Boolean allow) {
        canSendAudios = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send documents
     * @param allow `True` if the user is allowed to send documents
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendDocuments(Boolean allow) {
        canSendDocuments = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send photos
     * @param allow `True` if the user is allowed to send photos
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendPhotos(Boolean allow) {
        canSendPhotos = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send videos
     * @param allow `True` if the user is allowed to send videos
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendVideos(Boolean allow) {
        canSendVideos = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send video notes
     * @param allow `True` if the user is allowed to send video notes
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendVideoNotes(Boolean allow) {
        canSendVideoNotes = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send voice notes
     * @param allow `True` if the user is allowed to send voice notes
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendVoiceNotes(Boolean allow) {
        canSendVoiceNotes = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send polls
     * @param allow `True` if the user is allowed to send polls
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendPolls(Boolean allow) {
        canSendPolls = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to send other messages
     * @param allow `True` if the user is allowed to send other messages
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowSendOtherMessages(Boolean allow) {
        canSendOtherMessages = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to add web page previews to their messages
     * @param allow `True` if the user is allowed to add web page previews to their messages
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowAddWebPagePreviews(Boolean allow) {
        canAddWebPagePreviews = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
     * @param allow `True` if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowChangeInfo(Boolean allow) {
        canChangeInfo = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to invite new users to the chat
     * @param allow `True` if the user is allowed to invite new users to the chat
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowInviteUsers(Boolean allow) {
        canInviteUsers = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to pin messages. Ignored in public supergroups
     * @param allow `True` if the user is allowed to pin messages. Ignored in public supergroups
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowPinMessages(Boolean allow) {
        canPinMessages = allow;
        return this;
    }

    /**
     * @description Determines if the user is allowed to create forum topics
     * @param allow `True` if the user is allowed to create forum topics
     * @return The current instance of the <<TelegramChatPermissions>> class
     */
    global TelegramChatPermissions allowManageTopics(Boolean allow) {
        canManageTopics = allow;
        return this;
    }
}
