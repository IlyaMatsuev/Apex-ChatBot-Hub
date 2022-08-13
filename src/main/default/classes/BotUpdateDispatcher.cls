public class BotUpdateDispatcher {
    public void dispatch(Bot__c bot) {
        handleUpdate(JSON.serialize(bot), bot.Handler__c);
    }

    @Future(callout=true)
    private static void handleUpdate(String jsonBot, String handlerType) {
        Bot__c bot = (Bot__c) JSON.deserialize(jsonBot, Bot__c.class);
        BotService service = new BotServiceFactory().create(bot);
        BotType btType = BotType.valueOf(bot.Type__c);
        Object handler = Type.forName(handlerType).newInstance();
        if (btType == BotType.Telegram) {
            ((ITelegramBotHandler) handler).handle((TelegramBotService) service);
        }
    }
}
