public class BotValidateHandlerTypeHandler implements Triggers.IHandler {
    public void handle(Triggers.Context context) {
        for (Bot__c bot : (List<Bot__c>) context.props.newList) {
            verifyHandlerImplementationType(Type.forName(bot.Handler__c), BotType.valueOf(bot.Type__c));
        }
    }

    private void verifyHandlerImplementationType(Type botHandlerType, BotType botType) {
        if (botHandlerType == null || !IBotHandler.class.isAssignableFrom(botHandlerType)) {
            throw new BotValidationException(
                'Bot handler does not exist or does not implement the IBotHandler interface: ' + botHandlerType
            );
        }

        for (BotSetting__mdt setting : BotSettingsProvider.getAll()) {
            verifyBaseHandlerImplementationType(botType, botHandlerType, setting);
        }
    }

    private void verifyBaseHandlerImplementationType(BotType botType, Type botHandlerType, BotSetting__mdt setting) {
        Type baseHandlerType = Type.forName(setting.BaseBotHandler__c);
        if (
            baseHandlerType != null &&
            baseHandlerType.isAssignableFrom(botHandlerType) &&
            botType.name() != setting.DeveloperName
        ) {
            throw new BotValidationException(
                'Bot handler that extends ' + baseHandlerType + ' must be of type ' + setting.DeveloperName
            );
        }
    }
}
