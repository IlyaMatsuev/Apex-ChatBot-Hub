public class ViberBotWebhookEvent extends ValueMap implements IBotWebhookEventEntity {
    public String getType() {
        // TODO: Check what is provided in the payload and decide on the event type. Available events:
        // - message
        // - delivered
        // - seen
        // - failed
        // - subscribed
        // - unsubscribed
        // - conversation_started
        return 'message';
    }

    public IBotUpdateEntity getUpdate() {
        // TODO: Get update entity from the payload
        return null;
    }
}
