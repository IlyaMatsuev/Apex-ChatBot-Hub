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

    /**
     * @description Returns the `Telegram` chat payload received in the update. Can be `null` if the update is not chat-related
     * @return The instance of the <<TelegramBotChat>> class
     */
    global TelegramBotChat getChat() {
        BotJsonPayload updatePayload = payload.getJsonPayload(getType().name());
        TelegramBotChat chat;
        if (updatePayload.has('chat')) {
            chat = new TelegramBotChat(updatePayload.getJsonPayload('chat'));
            chat.payload.set('user', new TelegramBotUser(updatePayload.getJsonPayload('from')));
        } else if (updatePayload.has('from')) {
            chat = new TelegramBotChat(updatePayload.getJsonPayload('from'));
        }
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
