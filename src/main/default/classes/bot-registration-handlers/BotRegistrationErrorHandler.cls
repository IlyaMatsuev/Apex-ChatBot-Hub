/**
 * Created by Ilya Matsuev on 8/16/2020.
 */

public with sharing class BotRegistrationErrorHandler implements ITriggerErrorHandler {
    public final static String ERROR_EMAIL_SUBJECT = 'BotRegistration Error';

    public void handle(TriggerContext context, Exception error) {
        String emailMessage = null;

        if (error instanceof BotRegistrationException) {
            BotRegistrationException registrationError = (BotRegistrationException) error;
            emailMessage = registrationError.getEmailMessage();
        } else {
            emailMessage = error.getMessage() + '\n\n' + error.getStackTraceString();
        }

        if (shallNotify(context)) {
            NotificationHelper.sendEmail(ERROR_EMAIL_SUBJECT, emailMessage, UserInfo.getUserEmail());
        }

        // If it's a sync trigger call then it's not necessary to delete registrations - the transaction will cancel itself
        if (context.isAsyncRun) {
            deleteRecentlyCreatedRegistrations(context.newList);
        } else {
            getActualRegistration(context).addError(error);
        }
    }

    private Boolean shallNotify(TriggerContext context) {
        return String.isNotBlank(UserInfo.getUserEmail()) && getActualRegistration(context).Notify_On_Error__c;
    }

    private Bot_Registration__c getActualRegistration(TriggerContext context) {
        String triggerEvent = context.triggerEvent.name();
        Bot_Registration__c registration = null;
        if (triggerEvent.contains('INSERT') || triggerEvent.contains('UNDELETE')) {
            registration = (Bot_Registration__c) context.newList.get(0);
        } else {
            registration = (Bot_Registration__c) context.oldList.get(0);
        }
        return registration;
    }

    private static void deleteRecentlyCreatedRegistrations(List<Bot_Registration__c> registrations) {
        if (!registrations.isEmpty()) {
            delete registrations;
        }
    }
}
