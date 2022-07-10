public class BotRegistrationException extends Exception {
    private final Callout failedCallout;

    public BotRegistrationException(String message, Callout failedCallout) {
        this(message, failedCallout, null);
    }

    public BotRegistrationException(String message, Callout failedCallout) {
        super(message);
        this.failedCallout = failedCallout;
    }

    public override String getMessage() {
        String message = super.getMessage();
        if (failedCallout != null) {
            message += '\n\nResponse: ' + failedCallout.responseBody;
        }
        return message;
    }
}
