public class TelegramBotUpdateEventEntity extends ValueMap implements IBotUpdateEventEntity {
    public String getId() {
        return getString('update_id');
    }

    public String getType() {
        // TODO: Check what is provided in the payload and decide on the event type. Available events:
        // - message
        // - edited_message
        // - channel_post
        // - edited_channel_post
        // - inline_query
        // - chosen_inline_result
        // - callback_query
        // - shipping_query
        // - pre_checkout_query
        // - poll
        // - poll_answer
        // - my_chat_member
        // - chat_member
        // - chat_join_request
        return 'message';
    }

    public IBotMessageEntity getMessage() {
        return (IBotMessageEntity) getValueMap(getType(), TelegramBotMessageEntity.class);
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
