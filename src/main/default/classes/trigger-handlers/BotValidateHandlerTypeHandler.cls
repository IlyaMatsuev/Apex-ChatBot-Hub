public class BotValidateHandlerTypeHandler implements Triggers.IHandler {
    private static final Map<BotType, Type> HANDLER_TYPES = new Map<BotType, Type>{
        BotType.Telegram => ITelegramBotHandler.class
    };

    public void handle(Triggers.Context context) {
        for (Bot__c bot : (List<Bot__c>) context.props.newList) {
            validateHandlerType(Type.forName(bot.Handler__c), BotType.valueOf(bot.Type__c));
        }
    }

    private void validateHandlerType(Type handlerType, BotType botType) {
        if (handlerType == null || !HANDLER_TYPES.get(botType).isAssignableFrom(handlerType)) {
            throw new TypeException(
                'Bot handler does not exist or does not implement the appropriate interface: ' + handlerType.getName()
            );
        }
    }
}
