public class BotErrorLogger implements Triggers.IErrorHandler {
    public void handle(Triggers.Context context, Exception error) {
        log(error);
    }

    public static void log(Exception error) {
        log(null, error);
    }

    public static void log(Id botId, Exception error) {
        System.debug(LoggingLevel.ERROR, error.getMessage() + '\n' + error.getStackTraceString());
        BotError__c botError = new BotError__c(
            Bot__c = botId,
            Message__c = error.getMessage().abbreviate(255),
            ExceptionType__c = error.getTypeName(),
            StackTrace__c = error.getStackTraceString()
        );
        if (error instanceof BotCustomException) {
            botError.Payload__c = ((BotCustomException) error).payload.toJson(true);
        }
        BotUtils.saveAsync(new List<SObject> { botError }, null);
    }
}
