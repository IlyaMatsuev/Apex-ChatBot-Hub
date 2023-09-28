public class BotWebhookHandler implements Triggers.IHandler {
    private final BotServiceFactory serviceFactory;

    public BotWebhookHandler() {
        this(new BotServiceFactory());
    }

    @TestVisible
    private BotWebhookHandler(BotServiceFactory serviceFactory) {
        this.serviceFactory = serviceFactory;
    }

    public void handle(Triggers.Context context) {
        for (BotModel bot : filterBots(context.props)) {
            BotWebhookService service = serviceFactory.createWebhookService(bot);
            if (context.props.isInsert || context.props.isUndelete || context.props.isUpdate) {
                service.setWebhook();
            }
            if (context.props.isDelete) {
                service.unsetWebhook();
            }
        }
    }

    private List<BotModel> filterBots(Triggers.Props props) {
        List<BotModel> bots = new List<BotModel>();
        for (Bot__c bot : (List<Bot__c>) (props.isDelete ? props.oldList : props.newList)) {
            Bot__c oldBot = (Bot__c) props.oldMap?.get(bot.Id);
            if (
                props.isInsert ||
                props.isDelete ||
                props.isUndelete ||
                (props.isUpdate && areWebhookEventsChanged(bot, oldBot))
            ) {
                bots.add(new BotModel(bot));
            }
        }
        return bots;
    }

    private Boolean areWebhookEventsChanged(Bot__c bot, Bot__c oldBot) {
        return bot.WebhookEvents__c != oldBot?.WebhookEvents__c;
    }
}
