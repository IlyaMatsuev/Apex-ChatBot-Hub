/**
 * @description The class designed for handling webhook events specifically for `Viber` bots
 */
global abstract class ViberBotHandler implements IBotHandler {
    /**
     * @description The method that is called when a user subscribed to the bot in `Viber`
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberBotSubscribedEvent>> class, describing the subscribed user event
     */
    global virtual void onSubscribe(ViberBotContext context, ViberBotSubscribedEvent event) {}

    /**
     * @description The method that is called when a user unsubscribed from the bot in `Viber`
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberBotMessageEvent>> class, describing the unsubscribed user event
     */
    global virtual void onUnsubscribe(ViberBotContext context, ViberBotMessageEvent event) {}

    /**
     * @description The method that is called when a message sent to a user has been successfully delivered
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberBotMessageEvent>> class, describing the delivered message event
     */
    global virtual void onMessageDelivered(ViberBotContext context, ViberBotMessageEvent event) {}

    /**
     * @description The method that is called when a message sent to a user has been seen by the user. Received only once even for multiple messages or devices
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberBotMessageEvent>> class, describing the seen event
     */
    global virtual void onMessageSeen(ViberBotContext context, ViberBotMessageEvent event) {}

    /**
     * @description The method that is called when a message sent to a user has failed to be delivered
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberBotMessageFailedEvent>> class, describing the failed message event
     */
    global virtual void onMessageFailed(ViberBotContext context, ViberBotMessageFailedEvent event) {}

    /**
     * @description The method that is called when a new message is received from a user
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberBotMessageReceivedEvent>> class, describing the received message event
     */
    global abstract void onMessageReceived(ViberBotContext context, ViberBotMessageReceivedEvent event);

    /**
     * @description The common handler for all webhook event types
     * @param context The context variable that contains all necessary methods for handling the incoming update. The instance of the <<ViberBotContext>> class
     * @param event The information about the received update from the bot. E.g. new message, sender, chat, etc. The instance of the <<ViberBotUpdateEvent>> class
     */
    global void handle(IBotContext context, IBotUpdateEvent event) {
        ViberBotContext viberContext = (ViberBotContext) context;
        ViberBotUpdateEvent viberEvent = (ViberBotUpdateEvent) event;
        ViberBotUpdateEventType eventType = viberEvent.getType();

        if (eventType == ViberBotUpdateEventType.Subscribed) {
            onSubscribe(viberContext, new ViberBotSubscribedEvent(viberEvent));
        } else if (eventType == ViberBotUpdateEventType.Unsubscribed) {
            onUnsubscribe(viberContext, new ViberBotMessageEvent(viberEvent));
        } else if (eventType == ViberBotUpdateEventType.Message) {
            onMessageReceived(viberContext, new ViberBotMessageReceivedEvent(viberEvent));
        } else if (eventType == ViberBotUpdateEventType.Delivered) {
            onMessageDelivered(viberContext, new ViberBotMessageEvent(viberEvent));
        } else if (eventType == ViberBotUpdateEventType.Seen) {
            onMessageSeen(viberContext, new ViberBotMessageEvent(viberEvent));
        } else if (eventType == ViberBotUpdateEventType.Failed) {
            onMessageFailed(viberContext, new ViberBotMessageFailedEvent(viberEvent));
        }
    }
}
