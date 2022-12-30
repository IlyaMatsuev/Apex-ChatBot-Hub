public class TelegramBotWebhookEvent extends ValueMap implements IBotWebhookEventEntity {
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

    public IBotUpdateEntity getUpdate() {
        return (IBotUpdateEntity) ValueMap.fromJson(toJson(), TelegramBotUpdate.class);
    }
}
