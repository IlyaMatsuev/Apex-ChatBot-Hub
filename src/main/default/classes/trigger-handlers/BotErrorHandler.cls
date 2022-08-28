public class BotErrorHandler implements Triggers.IErrorHandler {
    private final static String ERROR_EMAIL_SUBJECT = 'Bot Exception';

    public void handle(Triggers.Context context, Exception error) {
        // If it's async execution then delete the created bots. Attach an error for sync execution
        if (context.props.isAsync) {
            Database.delete(context.props.newList?.isEmpty() == false ? context.props.newList : context.props.oldList);
        } else {
            getRecord(context).addError(error);
        }
    }

    private Bot__c getRecord(Triggers.Context context) {
        return (Bot__c) (context.props.isInsert || context.props.isUndelete
                ? context.props.newList
                : context.props.oldList)
            .get(0);
    }
}
