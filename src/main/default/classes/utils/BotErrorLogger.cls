public class BotErrorLogger implements Triggers.IErrorHandler {
    public void handle(Triggers.Context context, Exception error) {
        log(error);
    }

    public static void log(Exception error) {
        insert new BotError__c(
            Message__c = error.getMessage(),
            ExceptionType__c = error.getTypeName(),
            StackTrace__c = error.getStackTraceString()
        );
    }
}
