global abstract class ViberBotHandler extends IBotHandler {
    global virtual void onSubscribe(ViberBotContext context, ChatUser__c user) {}

    global virtual void onUnsubscribe(ViberBotContext context, ChatUser__c user) {}

    global virtual void onMessageDelivered(ViberBotContext context, ChatMessage__c message) {}

    global virtual void onMessageSeen(ViberBotContext context, ChatMessage__c message) {}

    global virtual void onMessageFailed(ViberBotContext context, ChatMessage__c message) {}

    global abstract void onMessageReceived(ViberBotContext context);

    global void handle(IBotContext context, IBotUpdateEvent event) {
        ViberBotContext viberContext = (ViberBotContext) context;
        ViberBotUpdateEvent viberEvent = (ViberBotUpdateEvent) event;
        ViberBotUpdateEventType eventType = viberEvent.getType();

        // TODO: Instead of `ViberBotUpdateEvent` consider passing a separate entities, like ViberBotMessage
        if (eventType == ViberBotUpdateEventType.Message) {
            onMessageReceived(viberContext);
        } else if (eventType == ViberBotUpdateEventType.Delivered) {
            onMessageDelivered(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Seen) {
            onMessageSeen(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Failed) {
            onMessageFailed(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Subscribed) {
            onSubscribe(context, null);
        } else if (eventType == ViberBotUpdateEventType.Unsubscribed) {
            onUnsubscribe(context, null);
        }
    }
}
