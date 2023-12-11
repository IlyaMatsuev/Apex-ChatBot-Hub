public class BotErrorHandler implements Triggers.IErrorHandler {
    public void handle(Triggers.Context context, Exception error) {
        for (Bot__c bot : getRecords(context)) {
            if (!context.props.isAsync) {
                bot.addError(error);
            }
        }
        if (!(error instanceof BotValidationException)) {
            BotErrorLogger.log(error);
        }
    }

    private List<Bot__c> getRecords(Triggers.Context context) {
        if (context.props.isInsert || context.props.isUndelete) {
            return (List<Bot__c>) context.props.newList;
        }
        return (List<Bot__c>) context.props.oldList;
    }
}
