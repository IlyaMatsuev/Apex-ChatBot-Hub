/**
 * @description Describes the sender payload received as an update from a `Telegram` bot.
 * Source: https://core.telegram.org/bots/api#user
 */
global class TelegramUser extends BotPayload implements IBotUser {
    /**
     * @description The unique identifier for this user or bot
     */
    global Integer id { get { return payload.getInteger('id'); } }

    /**
     * @description `True` if this user is a bot
     */
    global Boolean isBot { get { return payload.getBoolean('is_bot'); } }

    /**
     * @description The user's or bot's first name
     */
    global String firstName { get { return payload.getString('first_name'); } }

    /**
     * @description The user's or bot's last name
     */
    global String lastName { get { return payload.getString('last_name'); } }

    /**
     * @description The IETF language tag of the user's language
     */
    global String languageCode { get { return payload.getString('language_code'); } }

    /**
     * @description The user's or bot's username
     */
    global String username { get { return payload.getString('username'); } }

    /**
     * @description `True` if this user is a Telegram Premium user
     */
    global Boolean isPremium { get { return payload.getBoolean('is_premium'); } }

    /**
     * @description `True` if this user added the bot to the attachment menu
     */
    global Boolean isAddedToAttachmentMenu { get { return payload.getBoolean('added_to_attachment_menu'); } }

    /**
     * @description `True` if the bot can be invited to groups. Returned only in `getMe`
     */
    global Boolean canJoinGroups { get { return payload.getBoolean('can_join_groups'); } }

    /**
     * @description `True` if privacy mode is disabled for the bot. Returned only in `getMe`
     */
    global Boolean canReadAllGroupMessages { get { return payload.getBoolean('can_read_all_group_messages'); } }

    /**
     * @description `True` if the bot supports inline queries. Returned only in `getMe`
     */
    global Boolean supportsInlineQueries { get { return payload.getBoolean('supports_inline_queries'); } }

    public TelegramUser(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Telegram` user id as `String`
     * @return The `Telegram` user id
     */
    global String getId() {
        return String.valueOf(id);
    }

    /**
     * @description Returns the `Telegram` user first name
     * @return The `Telegram` user first name
     */
    global String getFirstName() {
        return firstName;
    }

    /**
     * @description Returns the `Telegram` user last name
     * @return The `Telegram` user last name
     */
    global String getLastName() {
        return lastName;
    }

    /**
     * @description Returns the `Telegram` user username
     * @return The `Telegram` user username
     */
    global String getUsername() {
        return username;
    }
}
