/**
 * @description Describes the chat payload received as an update from a `Telegram` bot
 * Source: https://core.telegram.org/bots/api#chat
 */
global class TelegramBotChat extends BotPayload implements IBotChat {
    /**
     * @description The unique identifier for this chat
     */
    global Integer id { get { return payload.getInteger('id'); } }

    /**
     * @description The type of chat, can be either “private”, “group”, “supergroup” or “channel”
     */
    global String type { get { return payload.getString('type'); } }

    /**
     * @description The title, for supergroups, channels and group chats
     */
    global String title { get { return payload.getString('title'); } }

    /**
     * @description The username, for private chats, supergroups and channels if available
     */
    global String username { get { return payload.getString('username'); } }

    /**
     * @description The first name of the other party in a private chat
     */
    global String firstName { get { return payload.getString('first_name'); } }

    /**
     * @description The last name of the other party in a private chat
     */
    global String lastName { get { return payload.getString('last_name'); } }

    /**
     * @description `True` if the supergroup chat is a forum
     */
    global Boolean isForum { get { return payload.getBoolean('is_forum'); } }

    /**
     * @description The chat photo. Returned only in `getChat`
     */
    global Photo photo { get { return new Photo(payload.getJsonPayload('photo')); } }

    /**
     * @description If non-empty, the list of all active chat usernames; for private chats, supergroups and channels. Returned only in `getChat`
     */
    global List<String> activeUsernames { get { return payload.getStringList('active_usernames'); } }

    /**
     * @description The custom emoji identifier of emoji status of the other party in a private chat. Returned only in `getChat`
     */
    global String emojiStatusCustomEmojiId { get { return payload.getString('emoji_status_custom_emoji_id'); } }

    /**
     * @description The expiration date of the emoji status of the other party in a private chat in Unix time, if any. Returned only in `getChat.
     */
    global DateTime emojiStatusExpirationDate { get { return payload.getDateTime('emoji_status_expiration_date'); } }

    /**
     * @description The bio of the other party in a private chat. Returned only in `getChat`
     */
    global String bio { get { return payload.getString('bio'); } }

    /**
     * @description `True` if privacy settings of the other party in the private chat allows to use `tg://user?id=<user_id>` links only in chats with the user. Returned only in `getChat`
     */
    global Boolean hasPrivateForwards { get { return payload.getBoolean('has_private_forwards'); } }

    /**
     * @description `True` if the privacy settings of the other party restrict sending voice and video note messages in the private chat. Returned only in `getChat`
     */
    global Boolean hasRestrictedVoiceAndVideoMessages {
        get { return payload.getBoolean('has_restricted_voice_and_video_messages'); }
    }

    /**
     * @description `True` if users need to join the supergroup before they can send messages. Returned only in `getChat`
     */
    global Boolean joinToSendMessages { get { return payload.getBoolean('join_to_send_messages'); } }

    /**
     * @description `True` if all users directly joining the supergroup need to be approved by supergroup administrators. Returned only in `getChat`
     */
    global Boolean joinByRequest { get { return payload.getBoolean('join_by_request'); } }

    /**
     * @description The description, for groups, supergroups and channel chats. Returned only in `getChat`
     */
    global String description { get { return payload.getString('description'); } }

    /**
     * @description The primary invite link, for groups, supergroups and channel chats. Returned only in `getChat`
     */
    global String inviteLink { get { return payload.getString('invite_link'); } }

    /**
     * @description The most recent pinned message (by sending date). Returned only in `getChat`
     */
    global TelegramBotMessage pinnedMessage {
        get { return new TelegramBotMessage(payload.getJsonPayload('pinned_message')); }
    }

    /**
     * @description The default chat member permissions, for groups and supergroups. Returned only in `getChat`
     */
    global TelegramBotChatPermissions permissions {
        get { return new TelegramBotChatPermissions(payload.getJsonPayload('permissions')); }
    }

    /**
     * @description For supergroups, the minimum allowed delay between consecutive messages sent by each unprivileged user; in seconds. Returned only in `getChat`
     */
    global Integer slowModeDelay { get { return payload.getInteger('slow_mode_delay'); } }

    /**
     * @description The time after which all messages sent to the chat will be automatically deleted; in seconds. Returned only in `getChat`
     */
    global Integer messageAutoDeleteTime { get { return payload.getInteger('message_auto_delete_time'); } }

    /**
     * @description `True` if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators. Returned only in `getChat`
     */
    global Boolean hasAggressiveAntiSpamEnabled {
        get { return payload.getBoolean('has_aggressive_anti_spam_enabled'); }
    }

    /**
     * @description `True` if non-administrators can only get the list of bots and administrators in the chat. Returned only in `getChat`
     */
    global Boolean hasHiddenMembers { get { return payload.getBoolean('has_hidden_members'); } }

    /**
     * @description `True` if messages from the chat can't be forwarded to other chats. Returned only in `getChat`
     */
    global Boolean hasProtectedContent { get { return payload.getBoolean('has_protected_content'); } }

    /**
     * @description For supergroups, name of group sticker set. Returned only in `getChat`
     */
    global String stickerSetName { get { return payload.getString('sticker_set_name'); } }

    /**
     * @description `True` if the bot can change the group sticker set. Returned only in `getChat`
     */
    global Boolean canSetStickerSet { get { return payload.getBoolean('can_set_sticker_set'); } }

    /**
     * @description The unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. Returned only in `getChat`
     */
    global Integer linkedChatId { get { return payload.getInteger('linked_chat_id'); } }

    /**
     * @description For supergroups, the location to which the supergroup is connected. Returned only in `getChat`
     */
    global Location location { get { return new Location(payload.getJsonPayload('location')); } }

    public TelegramBotChat(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Telegram` chat id
     * @return The `Telegram` chat id
     */
    global String getId() {
        return String.valueOf(id);
    }

    /**
     * @description Returns the chat title combined from first and last names of the sender or username, if the title itself was not set for the chat
     * @return The chat title
     */
    global String getTitle() {
        if (payload.hasValue('title')) {
            return title;
        } else if (payload.hasValue('first_name') || payload.hasValue('last_name')) {
            return (payload.getString('first_name', '') + ' ' + payload.getString('last_name', '')).trim();
        }
        return username;
    }

    /**
     * @description Returns the payload of the `Telegram` user who wrote the message received in the update
     * @return The instance of the <<TelegramBotUser>> class
     */
    global TelegramBotUser getSender() {
        return (TelegramBotUser) payload.get('user');
    }

    /**
     * @description Describes a payload of a chat photo
     * Source: https://core.telegram.org/bots/api#chatphoto
     */
    global class Photo extends BotPayload {
        /**
         * @description The file identifier of small (`160x160`) chat photo
         */
        global String smallFileId { get { return payload.getString('small_file_id'); } }

        /**
         * @description The unique file identifier of small (`160x160`) chat photo, which is supposed to be the same over time and for different bots
         */
        global String smallFileUniqueId { get { return payload.getString('small_file_unique_id'); } }

        /**
         * @description The file identifier of big (`640x640`) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed
         */
        global String bigFileId { get { return payload.getString('big_file_id'); } }

        /**
         * @description The unique file identifier of big (`640x640`) chat photo, which is supposed to be the same over time and for different bots
         */
        global String bigFileUniqueId { get { return payload.getString('big_file_unique_id'); } }

        public Photo(BotJsonPayload payload) {
            super(payload);
        }
    }

    /**
     * @description Describes a payload of a location to which a chat is connected
     * Source: https://core.telegram.org/bots/api#chatlocation
     */
    global class Location extends BotPayload {
        /**
         * @description The location to which the supergroup is connected. Can't be a live location
         */
        global TelegramBotLocation location {
            get { return new TelegramBotLocation(payload.getJsonPayload('location')); }
        }

        /**
         * @description The location address; `1-64` characters, as defined by the chat owner
         */
        global String address { get { return payload.getString('address'); } }

        public Location(BotJsonPayload payload) {
            super(payload);
        }
    }
}
