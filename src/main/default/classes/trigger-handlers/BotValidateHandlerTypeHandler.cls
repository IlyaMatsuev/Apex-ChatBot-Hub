public class BotValidateHandlerTypeHandler implements Triggers.IHandler {
    public void handle(Triggers.Context context) {
        for (Bot__c bot : (List<Bot__c>) context.props.newList) {
            Type handlerType = Type.forName(bot.Handler__c);
            if (handlerType == null || !IBotHandler.class.isAssignableFrom(handlerType)) {
                throw new BotValidationException(
                    'Bot handler does not exist or does not implement the IBotHandler interface: ' + bot.Handler__c
                );
            }
        }
    }
}
