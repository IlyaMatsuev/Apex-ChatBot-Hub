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
        return (IBotMessageEntity) getValueMap('message', TelegramBotMessageEntity.class);
    }

    // TODO: Move to IBotChatEntity
    // Public IBotUserEntity getSender() {
    // TelegramBotMessageEntity message = (TelegramBotMessageEntity) getMessage();
    // Return (IBotUserEntity) message.getValueMap('from', TelegramBotUserEntity.class);
    // }

    public IBotChatEntity getChat() {
        TelegramBotMessageEntity message = (TelegramBotMessageEntity) getMessage();
        return (IBotChatEntity) message.getValueMap('chat', TelegramBotChatEntity.class);
    }
}
