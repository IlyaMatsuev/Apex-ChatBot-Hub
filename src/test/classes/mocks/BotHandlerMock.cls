@IsTest
public class BotHandlerMock implements IBotHandler {
    public static final List<ReceivedContext> executedContexts = new List<ReceivedContext>();
    public static Boolean throwError = false;

    public void handle(IBotContext context, IBotUpdateEvent event) {
        if (throwError) {
            throw new TypeException('Unexpected error!');
        }
        executedContexts.add(new ReceivedContext(context, event));
    }

    public class ReceivedContext {
        public final IBotContext context;
        public final IBotUpdateEvent event;

        public ReceivedContext(IBotContext context, IBotUpdateEvent event) {
            this.context = context;
            this.event = event;
        }
    }
}
