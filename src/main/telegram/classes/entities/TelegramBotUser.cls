/**
 * @description Describes the sender payload received as an update from a `Telegram` bot
 */
global class TelegramBotUser extends BotPayload implements IBotUser {
    public TelegramBotUser(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Telegram` user id
     * @return The `Telegram` user id
     */
    global String getId() {
        return payload.getString('id');
    }

    /**
     * @description Returns the `Telegram` user first name
     * @return The `Telegram` user first name
     */
    global String getFirstName() {
        return payload.getString('first_name');
    }

    /**
     * @description Returns the `Telegram` user last name
     * @return The `Telegram` user last name
     */
    global String getLastName() {
        return payload.getString('last_name');
    }

    /**
     * @description Returns the `Telegram` user username
     * @return The `Telegram` user username
     */
    global String getUsername() {
        return payload.getString('username');
    }
}
