@IsTest
public class BotHandlerMock implements IBotHandler {
    public static final List<BotContext> executedContexts = new List<BotContext>();

    public void handle(BotContext context) {
        executedContexts.add(context);
    }
}
