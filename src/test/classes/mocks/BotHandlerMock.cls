@IsTest
public class BotHandlerMock implements IBotHandler {
    public static final List<IBotContext> executedContexts = new List<IBotContext>();
    public static Boolean throwError = false;

    public void handle(IBotContext context) {
        if (throwError) {
            throw new TypeException('Unexpected error!');
        }
        executedContexts.add(context);
    }
}
