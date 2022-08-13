public class BotErrorHandler implements Triggers.IErrorHandler {
    private final static String ERROR_EMAIL_SUBJECT = 'Bot Exception';

    public void handle(Triggers.Context context, Exception error) {
        Bot__c bot = getRecord(context);

        if (bot.NotifyOnError__c) {
            notify(ERROR_EMAIL_SUBJECT, error.getMessage() + '\n\n' + error.getStackTraceString());
        }

        // If it's async execution then delete the created bots. Attach an error for sync execution
        if (context.props.isAsync) {
            Database.delete(context.props.newList?.isEmpty() == false ? context.props.newList : context.props.oldList);
        } else {
            bot.addError(error);
        }
    }

    private Bot__c getRecord(Triggers.Context context) {
        return (Bot__c) (context.props.isInsert || context.props.isUndelete
                ? context.props.newList
                : context.props.oldList)
            .get(0);
    }

    // TODO: Figure out why sending email doesn't work
    private void notify(String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setToAddresses(new List<String>{ UserInfo.getUserEmail() });
        mail.setCharset('UTF-8');
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
    }
}
