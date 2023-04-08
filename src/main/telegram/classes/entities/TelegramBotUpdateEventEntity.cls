/**
 * @description Describes the payload received as an update from a `Telegram` bot
 */
global class TelegramBotUpdateEventEntity extends ValueMap implements IBotUpdateEventEntity {
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
     * @return The instance of the <<TelegramBotMessageEntity>> interface
     */
    global TelegramBotMessageEntity getMessage() {
        return (TelegramBotMessageEntity) getValueMap(getType().name(), TelegramBotMessageEntity.class);
    }

    /**
     * @description Returns the `Telegram` chat payload received in the update
     * @return The instance of the <<TelegramBotChatEntity>> interface
     */
    global TelegramBotChatEntity getChat() {
        TelegramBotMessageEntity message = (TelegramBotMessageEntity) getMessage();
        TelegramBotUserEntity user = (TelegramBotUserEntity) message.getValueMap('from', TelegramBotUserEntity.class);
        TelegramBotChatEntity chat = (TelegramBotChatEntity) message.getValueMap('chat', TelegramBotChatEntity.class);
        // Set user payload into the chat payload so that it can be accessed from the IBotChatEntity
        chat.set('user', user);
        return chat;
    }
}
