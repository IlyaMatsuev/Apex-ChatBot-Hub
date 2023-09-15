/**
 * @description !This class is not part of the package and is being used specifically for testing the functionality!
 */
public class TestViberBotHandler extends ViberBotHandler {
    public override void onMessageReceived(ViberBotContext context, ViberMessageReceivedEvent event) {
        context.reply().text('Echo: ' + event.message.text);
        logEvent(context.getBot().id, 'onMessageReceived', event);
    }

    public override void onMessageDelivered(ViberBotContext context, ViberMessageEvent event) {
        logEvent(context.getBot().id, 'onMessageDelivered', event);
    }

    public override void onMessageSeen(ViberBotContext context, ViberMessageEvent event) {
        logEvent(context.getBot().id, 'onMessageSeen', event);
    }

    public override void onSubscribe(ViberBotContext context, ViberSubscribedEvent event) {
        context.reply().text('Hi! Nice to meet you!');
        logEvent(context.getBot().id, 'onSubscribe', event);
    }

    public override void onUnsubscribe(ViberBotContext context, ViberMessageEvent event) {
        logEvent(context.getBot().id, 'onUnsubscribe', event);
    }

    private void logEvent(Id botId, String methodName, BotPayload eventPayload) {
        BotJsonPayload payload = new BotJsonPayload();
        payload.set('event', eventPayload.getJsonPayload());

        BotErrorLogger.log(botId, new ViberBotLogEntryException(methodName + ': Success', payload));
    }

    public class ViberBotLogEntryException extends BotCustomException {
        public ViberBotLogEntryException(String message, BotJsonPayload payload) {
            super(message, payload);
        }
    }
}
