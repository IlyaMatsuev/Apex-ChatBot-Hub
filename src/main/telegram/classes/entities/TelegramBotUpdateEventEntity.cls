public class TelegramBotUpdateEventEntity extends ValueMap implements IBotUpdateEventEntity {
    private static final String ID_FIELD_NAME = 'update_id';

    public String getId() {
        return getString(ID_FIELD_NAME);
    }

    public BotUpdateEventType getType() {
        // Telegram Webhook update payload contains only "update_id" and one optional object that represents event type
        for (String key : getValues().keySet()) {
            if (key != ID_FIELD_NAME) {
                return BotUpdateEventType.valueOf(key);
            }
        }
        throw new NoSuchElementException('There is no event type in the webhook provided');
    }

    public IBotMessageEntity getMessage() {
        return (IBotMessageEntity) getValueMap(getType().name(), TelegramBotMessageEntity.class);
    }

    public IBotChatEntity getChat() {
        TelegramBotMessageEntity message = (TelegramBotMessageEntity) getMessage();
        TelegramBotUserEntity user = (TelegramBotUserEntity) message.getValueMap('from', TelegramBotUserEntity.class);
        TelegramBotChatEntity chat = (TelegramBotChatEntity) message.getValueMap('chat', TelegramBotChatEntity.class);
        // Set user payload into the chat payload so that it can be accessed from the IBotChatEntity
        chat.set('user', user);
        return chat;
    }
}
