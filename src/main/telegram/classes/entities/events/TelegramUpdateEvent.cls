/**
 * @description Describes the payload received as an update from a `Telegram` bot
 */
global class TelegramUpdateEvent extends BotPayload implements IBotUpdateEvent {
    private static final String ID_FIELD_NAME = 'update_id';

    private final TelegramUpdateEventType eventType {
        get {
            if (eventType == null) {
                // Telegram Webhook update payload contains `update_id` and one optional object that represents event type
                for (String key : payload.getValues().keySet()) {
                    if (key != ID_FIELD_NAME) {
                        eventType = TelegramUpdateEventType.valueOf(key);
                    }
                }
            }
            return eventType;
        }
        set;
    }

    /**
     * @description Returns the type of the received `Telegram` update
     * @return The instance of the <<TelegramUpdateEventType>> enum
     */
    global TelegramUpdateEventType getType() {
        return eventType;
    }

    /**
     * @description Returns the `Telegram` message payload received in the update. Can be `null` in case of another update type
     * @return The instance of the <<TelegramMessage>> class
     */
    global TelegramMessage getMessage() {
        if (!TelegramUpdateEventType.isMessageEventType(eventType)) {
            return null;
        }
        return new TelegramMessage(payload.getJsonPayload(eventType.name()));
    }

    /**
     * @description Returns the `Telegram` chat payload received in the update. Can be `null` if the update is not chat-related
     * @return The instance of the <<TelegramChat>> class
     */
    global TelegramChat getChat() {
        BotJsonPayload updatePayload = payload.getJsonPayload(getType().name());
        TelegramChat chat;
        if (updatePayload.has('chat')) {
            chat = new TelegramChat(updatePayload.getJsonPayload('chat'));
            chat.payload.set('user', new TelegramUser(updatePayload.getJsonPayload('from')));
        } else if (updatePayload.has('from')) {
            chat = new TelegramChat(updatePayload.getJsonPayload('from'));
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
