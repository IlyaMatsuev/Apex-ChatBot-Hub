@IsTest
public class BotHandlerMock implements IBotHandler {
    public static final List<BotContext> executedContexts = new List<BotContext>();
    public static Boolean throwError = false;

    public void handle(BotContext context) {
        if (throwError) {
            throw new TypeException('Unexpected error!');
        }
        executedContexts.add(context);
    }
}
