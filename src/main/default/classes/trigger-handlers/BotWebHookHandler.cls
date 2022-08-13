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
        if (context.props.isBefore) {
            return;
        }

        for (Bot__c bot : getBots(context.props)) {
            BotService service = serviceFactory.create(bot);
            if (context.props.isInsert || context.props.isUndelete) {
                service.setWebhook();
            }
            if (context.props.isDelete) {
                service.unsetWebhook();
            }
        }
    }

    private List<Bot__c> getBots(Triggers.Props props) {
        return (List<Bot__c>) (props.isDelete ? props.oldList : props.newList);
    }
}
