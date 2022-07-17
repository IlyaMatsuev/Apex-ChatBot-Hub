public class BotWebhookHandler implements Triggers.IHandler {
    private final BotServiceFactory factory;

    public BotWebhookHandler() {
        this(new BotServiceFactory());
    }

    @TestVisible
    private BotWebhookHandler(BotServiceFactory factory) {
        this.factory = factory;
    }

    public void handle(Triggers.Context context) {
        if (context.props.isBefore) {
            return;
        }

        for (Bot__c bot : ((List<Bot__c>) (context.props.isDelete ? context.props.oldList : context.props.newList))) {
            BotService service = factory.create(bot);
            if (context.props.isInsert || context.props.isUndelete) {
                service.setWebhook();
            }
            if (context.props.isDelete) {
                service.unsetWebhook();
            }
        }
    }
}
