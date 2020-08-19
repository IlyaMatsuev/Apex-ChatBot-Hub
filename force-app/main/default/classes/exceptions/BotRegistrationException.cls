/**
 * Created by Ilya Matsuev on 7/25/2020.
 */

public with sharing class BotRegistrationException extends Exception {

    public Callout failedCallout {get; private set;}
    public Bot_Setting__mdt botSettings {get; private set;}


    public BotRegistrationException(String message, Callout failedCallout) {
        this(message);
        this.failedCallout = failedCallout;
    }

    public BotRegistrationException(String message, Bot_Setting__mdt botSettings) {
        this(message);
        this.botSettings = botSettings;
    }

    public BotRegistrationException(String message, Callout failedCallout, Bot_Setting__mdt botSettings) {
        this(message, failedCallout);
        this.botSettings = botSettings;
    }


    public String getEmailMessage() {
        String message = this.getMessage();
        if (failedCallout == null) {
            message += '\n\n' + this.getStackTraceString();
        } else {
            message += '\n\n' + 'Here is a response: \n\n' + failedCallout.responseBody;
        }
        return message;
    }
}
