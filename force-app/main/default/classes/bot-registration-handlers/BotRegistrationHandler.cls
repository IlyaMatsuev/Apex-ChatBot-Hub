/**
 * Created by Ilya Matsuev on 7/25/2020.
 */

public with sharing class BotRegistrationHandler implements ITriggerHandler {

    public void handle(TriggerContext context, ITriggerService service) {
        switch on context.triggerEvent {
            when AFTER_INSERT, AFTER_UNDELETE {
                registerWebHookHandlers(context.newList);
            }
            when AFTER_UPDATE {
                updateWebHookHandlers(context.newList, (Map<Id, Bot_Registration__c>) context.oldMap);
            }
            when AFTER_DELETE {
                removeWebHookHandlers(context.oldList);
            }
        }
    }

    private void registerWebHookHandlers(List<Bot_Registration__c> registrations) {
        for (Bot_Registration__c registration: registrations) {
            WebHookRegistrationHelper.registerWebHookHandler(registration);
        }
    }

    private void updateWebHookHandlers(List<Bot_Registration__c> registrations, Map<Id, Bot_Registration__c> oldRegistrations) {
        for (Bot_Registration__c registration: registrations) {
            Bot_Registration__c oldRegistration = oldRegistrations.get(registration.Id);
            WebHookRegistrationHelper.updateWebHookHandler(oldRegistration, registration);
        }
    }

    private void removeWebHookHandlers(List<Bot_Registration__c> registrations) {
        for (Bot_Registration__c registration: registrations) {
            WebHookRegistrationHelper.removeWebHookHandler(registration);
        }
    }
}