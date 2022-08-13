// This event handler suppose to handle only one event at time
public class BotUpdateHandler implements Triggers.IHandler {
    public void handle(Triggers.Context context) {
        BotUpdateEvent__e event = (BotUpdateEvent__e) context.props.newList.get(0);
        Bot__c bot = (Bot__c) JSON.deserialize(event.Bot__c, Bot__c.class);
        getBotHandler(bot.Handler__c).handle(createBotContext(bot, event.Payload__c));
    }

    private IBotHandler getBotHandler(String handlerType) {
        return (IBotHandler) Type.forName(handlerType).newInstance();
    }

    private BotContext createBotContext(Bot__c bot, String payload) {
        BotService service = new BotServiceFactory().create(bot);
        // TODO: Add Update model
        return new BotContext(bot, service);
    }
}
