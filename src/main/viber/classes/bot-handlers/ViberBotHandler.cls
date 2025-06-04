/**
 * @description The class designed for handling webhook events specifically for `Viber` bots
 */
global abstract class ViberBotHandler implements IBotHandler {
    /**
     * @description The method that is called when a user subscribed to the bot in `Viber`
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberSubscribedEvent>> class, describing the subscribed user event
     */
    global virtual void onSubscribe(ViberBotContext context, ViberSubscribedEvent event) {}

    /**
     * @description The method that is called when a user unsubscribed from the bot in `Viber`
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberMessageEvent>> class, describing the unsubscribed user event
     */
    global virtual void onUnsubscribe(ViberBotContext context, ViberMessageEvent event) {}

    /**
     * @description The method that is called when a message sent to a user has been successfully delivered
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberMessageEvent>> class, describing the delivered message event
     */
    global virtual void onMessageDelivered(ViberBotContext context, ViberMessageEvent event) {}

    /**
     * @description The method that is called when a message sent to a user has been seen by the user. Received only once even for multiple messages or devices
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberMessageEvent>> class, describing the seen event
     */
    global virtual void onMessageSeen(ViberBotContext context, ViberMessageEvent event) {}

    /**
     * @description The method that is called when a message sent to a user has failed to be delivered
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberMessageFailedEvent>> class, describing the failed message event
     */
    global virtual void onMessageFailed(ViberBotContext context, ViberMessageFailedEvent event) {}

    /**
     * @description The method that is called when a new message is received from a user
     * @param context The `Viber` bot context
     * @param event The instance of <<ViberMessageReceivedEvent>> class, describing the received message event
     */
    global abstract void onMessageReceived(ViberBotContext context, ViberMessageReceivedEvent event);

    /**
     * @description The common handler for all webhook event types
     * @param context The context variable that contains all necessary methods for handling the incoming update. The instance of the <<ViberBotContext>> class
     */
    global void handle(IBotContext context) {
        try {
            ViberBotContext viberContext = (ViberBotContext) context;
            ViberUpdateEvent viberEvent = viberContext.getUpdateEvent();
            ViberUpdateEventType eventType = viberEvent.getType();

            if (eventType == ViberUpdateEventType.Subscribed) {
                onSubscribe(viberContext, new ViberSubscribedEvent(viberEvent));
            } else if (eventType == ViberUpdateEventType.Unsubscribed) {
                onUnsubscribe(viberContext, new ViberMessageEvent(viberEvent));
            } else if (eventType == ViberUpdateEventType.Message) {
                onMessageReceived(viberContext, new ViberMessageReceivedEvent(viberEvent));
            } else if (eventType == ViberUpdateEventType.Delivered) {
                onMessageDelivered(viberContext, new ViberMessageEvent(viberEvent));
            } else if (eventType == ViberUpdateEventType.Seen) {
                onMessageSeen(viberContext, new ViberMessageEvent(viberEvent));
            } else if (eventType == ViberUpdateEventType.Failed) {
                onMessageFailed(viberContext, new ViberMessageFailedEvent(viberEvent));
            }
        } catch (Exception ex) {
            BotErrorLogger.log(context?.getBot()?.id, ex);
        }
    }
}
