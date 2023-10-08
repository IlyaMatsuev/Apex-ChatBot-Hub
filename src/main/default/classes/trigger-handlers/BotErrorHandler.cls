public class BotErrorHandler implements Triggers.IErrorHandler {
    public void handle(Triggers.Context context, Exception error) {
        // TODO: Do not delete bots in case of error
        List<Bot__c> botsToDelete = new List<Bot__c>();
        for (Bot__c bot : getRecords(context)) {
            // If it's async execution then delete the created bots. Attach an error for sync execution
            if (context.props.isAsync) {
                botsToDelete.add(bot);
            } else {
                bot.addError(error);
            }
        }
        if (!botsToDelete.isEmpty()) {
            Database.delete(botsToDelete, false);
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
