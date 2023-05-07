/**
 * @description Describes the payload received as an update from a `Telegram` bot
 */
global class TelegramBotUpdateEvent extends BotPayload implements IBotUpdateEvent {
    private static final String ID_FIELD_NAME = 'update_id';

    /**
     * @description Returns the type of the received `Telegram` update
     * @return The instance of the <<TelegramBotUpdateEventType>> enum
     */
    global TelegramBotUpdateEventType getType() {
        // Telegram Webhook update payload contains only "update_id" and one optional object that represents event type
        for (String key : payload.getValues().keySet()) {
            if (key != ID_FIELD_NAME) {
                return TelegramBotUpdateEventType.valueOf(key);
            }
        }
        throw new NoSuchElementException('There is no event type in the webhook provided');
    }

    /**
     * @description Returns the `Telegram` message payload received in the update. Can be `null` in case of another update type
     * @return The instance of the <<TelegramBotMessage>> class
     */
    global TelegramBotMessage getMessage() {
        if (getType() != TelegramBotUpdateEventType.Message) {
            return null;
        }
        return new TelegramBotMessage(payload.getJsonPayload(TelegramBotUpdateEventType.Message.name()));
    }

    // TODO: Check if this can ever be null
    /**
     * @description Returns the `Telegram` chat payload received in the update
     * @return The instance of the <<TelegramBotChat>> class
     */
    global TelegramBotChat getChat() {
        // TODO: This won't work in case on another update type other than `message`
        TelegramBotMessage message = getMessage();
        TelegramBotUser user = new TelegramBotUser(message.payload.getJsonPayload('from'));
        TelegramBotChat chat = new TelegramBotChat(message.payload.getJsonPayload('chat'));
        // Set user payload into the chat payload so that it can be accessed from the IBotChat
        chat.payload.set('user', user);
        return chat;
    }

    /**
     * @description Returns the source JSON payload of the update event
     * @return The instance of the <<BotJsonPayload>>
     */
    global BotJsonPayload getPayload() {
        return getJsonPayload();
    }
}
