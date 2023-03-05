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
        for (BotModel bot : getBots(context.props)) {
            BotWebhookService service = serviceFactory.createWebhookService(bot);
            if (context.props.isInsert || context.props.isUndelete) {
                service.setWebhook();
            }
            if (context.props.isDelete) {
                service.unsetWebhook();
            }
        }
    }

    private List<BotModel> getBots(Triggers.Props props) {
        List<BotModel> bots = new List<BotModel>();
        for (Bot__c bot : (List<Bot__c>) (props.isDelete ? props.oldList : props.newList)) {
            bots.add(new BotModel(bot));
        }
        return bots;
    }
}
