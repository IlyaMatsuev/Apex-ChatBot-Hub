@IsTest
public class ViberBotHandlerMock extends ViberBotHandler {
    public static BotPayload lastEvent;

    public override void onMessageReceived(ViberBotContext context, ViberMessageReceivedEvent event) {
        lastEvent = event;
    }

    public override void onMessageDelivered(ViberBotContext context, ViberMessageEvent event) {
        super.onMessageDelivered(context, event);
        lastEvent = event;
    }

    public override void onMessageSeen(ViberBotContext context, ViberMessageEvent event) {
        super.onMessageSeen(context, event);
        lastEvent = event;
    }

    public override void onMessageFailed(ViberBotContext context, ViberMessageFailedEvent event) {
        super.onMessageFailed(context, event);
        lastEvent = event;
    }

    public override void onSubscribe(ViberBotContext context, ViberSubscribedEvent event) {
        super.onSubscribe(context, event);
        lastEvent = event;
    }

    public override void onUnsubscribe(ViberBotContext context, ViberMessageEvent event) {
        super.onUnsubscribe(context, event);
        lastEvent = event;
    }
}
