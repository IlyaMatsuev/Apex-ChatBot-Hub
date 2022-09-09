public class BotErrorLogger implements Triggers.IErrorHandler {
    public void handle(Triggers.Context context, Exception error) {
        log(error);
    }

    public static void log(Exception error) {
        log(null, error);
    }

    public static void log(Id botId, Exception error) {
        BotError__c botError = new BotError__c(
            Bot__c = botId,
            Message__c = error.getMessage(),
            ExceptionType__c = error.getTypeName(),
            StackTrace__c = error.getStackTraceString()
        );
        BotUtils.saveAsync(new List<SObject>{ botError }, null);
    }
}
