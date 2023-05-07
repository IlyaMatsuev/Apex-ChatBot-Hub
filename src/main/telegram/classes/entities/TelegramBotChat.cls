/**
 * @description Describes the chat payload received as an update from a `Telegram` bot
 */
global class TelegramBotChat extends BotPayload implements IBotChat {
    public TelegramBotChat(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Returns the `Telegram` chat id
     * @return The `Telegram` chat id
     */
    global String getId() {
        return payload.getString('id');
    }

    /**
     * @description Returns the chat title
     * @return The chat title
     */
    global String getTitle() {
        if (payload.hasValue('title')) {
            return payload.getString('title');
        } else if (payload.hasValue('first_name') || payload.hasValue('last_name')) {
            return (payload.getString('first_name', '') + ' ' + payload.getString('last_name', '')).trim();
        }
        return payload.getString('username');
    }

    /**
     * @description Returns the payload of the `Telegram` user who wrote the message received in the update
     * @return The instance of the <<TelegramBotUser>> class
     */
    global TelegramBotUser getSender() {
        return (TelegramBotUser) payload.get('user');
    }
}
