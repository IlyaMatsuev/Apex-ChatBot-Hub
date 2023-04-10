/**
 * @description Describes the payload received as an update from a `Telegram` bot
 */
global class TelegramBotUpdateEvent extends ValueMap implements IBotUpdateEvent {
    private static final String ID_FIELD_NAME = 'update_id';

    /**
     * @description Returns the type of the received `Telegram` update
     * @return The instance of the <<TelegramBotUpdateEventType>> enum
     */
    global TelegramBotUpdateEventType getType() {
        // Telegram Webhook update payload contains only "update_id" and one optional object that represents event type
        for (String key : getValues().keySet()) {
            if (key != ID_FIELD_NAME) {
                return TelegramBotUpdateEventType.valueOf(key);
            }
        }
        throw new NoSuchElementException('There is no event type in the webhook provided');
    }

    /**
     * @description Returns the `Telegram` message payload received in the update. Can be null
     * @return The instance of the <<TelegramBotMessage>> interface
     */
    global TelegramBotMessage getMessage() {
        return (TelegramBotMessage) getValueMap(getType().name(), TelegramBotMessage.class);
    }

    /**
     * @description Returns the `Telegram` chat payload received in the update
     * @return The instance of the <<TelegramBotChat>> interface
     */
    global TelegramBotChat getChat() {
        TelegramBotMessage message = (TelegramBotMessage) getMessage();
        TelegramBotUser user = (TelegramBotUser) message.getValueMap('from', TelegramBotUser.class);
        TelegramBotChat chat = (TelegramBotChat) message.getValueMap('chat', TelegramBotChat.class);
        // Set user payload into the chat payload so that it can be accessed from the IBotChat
        chat.set('user', user);
        return chat;
    }
}
