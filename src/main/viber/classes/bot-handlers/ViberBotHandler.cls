/**
 * @description The class designed for handling webhook events specifically for `Viber` bots
 */
global abstract class ViberBotHandler implements IBotHandler {
    /**
     * @description The method that is called when a user subscribed to the bot in `Viber`
     * @param context The `Viber` bot context
     * @param user The instance of <<ChatUserModel>> class, describing the subscribed user
     */
    global virtual void onSubscribe(ViberBotContext context, ChatUserModel user) {}

    /**
     * @description The method that is called when a user unsubscribed from the bot in `Viber`
     * @param context The `Viber` bot context
     * @param user The instance of <<ChatUserModel>> class, describing the unsubscribed user
     */
    global virtual void onUnsubscribe(ViberBotContext context, ChatUserModel user) {}

    /**
     * @description The method that is called when a message sent to a user has been successfully delivered
     * @param context The `Viber` bot context
     * @param message The instance of <<ChatMessageModel>> class, describing the sent message
     */
    global virtual void onMessageDelivered(ViberBotContext context, ChatMessageModel message) {}

    /**
     * @description The method that is called when a message sent to a user has been seen by the user
     * @param context The `Viber` bot context
     * @param message The instance of <<ChatMessageModel>> class, describing the sent message
     */
    global virtual void onMessageSeen(ViberBotContext context, ChatMessageModel message) {}

    // TODO: Need to also have a cause of the failure
    /**
     * @description The method that is called when a message sent to a user has failed to be delivered
     * @param context The `Viber` bot context
     * @param message The instance of <<ChatMessageModel>> class, describing the sent message
     */
    global virtual void onMessageFailed(ViberBotContext context, ChatMessageModel message) {}

    /**
     * @description The method that is called when a new message is received from a user
     * @param context The `Viber` bot context
     * @param message The instance of <<ChatMessageModel>> class, describing the received message
     */
    global abstract void onMessageReceived(ViberBotContext context, ChatMessageModel message);

    global void handle(IBotContext context, IBotUpdateEvent event) {
        ViberBotContext viberContext = (ViberBotContext) context;
        ViberBotUpdateEvent viberEvent = (ViberBotUpdateEvent) event;
        ViberBotUpdateEventType eventType = viberEvent.getType();

        // TODO: Need to find a way to have all possible event payloads under a single interface, otherwise it's gonna be a piece of shit
        if (eventType == ViberBotUpdateEventType.Message) {
            onMessageReceived(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Delivered) {
            onMessageDelivered(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Seen) {
            onMessageSeen(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Failed) {
            onMessageFailed(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Subscribed) {
            onSubscribe(viberContext, null);
        } else if (eventType == ViberBotUpdateEventType.Unsubscribed) {
            onUnsubscribe(viberContext, null);
        }
    }
}
