/**
 * @description Describes the chat payload received as an update from a `Telegram` bot
 */
global class TelegramBotChat extends BotJsonPayload implements IBotChat {
    /**
     * @description Returns the `Telegram` chat id
     * @return The `Telegram` chat id
     */
    global String getId() {
        return getString('id');
    }

    /**
     * @description Returns the chat title
     * @return The chat title
     */
    global String getTitle() {
        if (hasValue('title')) {
            return getString('title');
        } else if (hasValue('first_name') || hasValue('last_name')) {
            String firstName = hasValue('first_name') ? getString('first_name') : '';
            String lastName = hasValue('last_name') ? getString('last_name') : '';
            return (firstName + ' ' + lastName).trim();
        }
        return getString('username');
    }

    /**
     * @description Returns the payload of the `Telegram` user who wrote the message received in the update
     * @return The instance of the <<TelegramBotUser>> interface
     */
    global TelegramBotUser getSender() {
        return (TelegramBotUser) getJsonPayload('user', TelegramBotUser.class);
    }
}
