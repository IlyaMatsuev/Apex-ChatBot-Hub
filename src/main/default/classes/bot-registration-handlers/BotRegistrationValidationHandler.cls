/**
 * Created by Ilya Matsuev on 7/25/2020.
 */

public with sharing class BotRegistrationValidationHandler implements ITriggerHandler {
    public void handle(TriggerContext context, ITriggerService service) {
        if (duplicateNameExists(context.newList)) {
            throw new BotRegistrationException(Label.DuplicateBotRegistrationName);
        } else if (!classTemplateExists()) {
            throw new BotRegistrationException(Label.NoWebHookTemplate);
        } else if (!webHookPathMatchesUrlFormat(context.newList)) {
            throw new BotRegistrationException(Label.InvalidWebHookPath);
        }
    }

    private Boolean duplicateNameExists(List<Bot_Registration__c> registrations) {
        Set<String> newRegistrationNames = new Set<String>();
        for (Bot_Registration__c registration : registrations) {
            newRegistrationNames.add(registration.Name);
        }
        Integer duplicateRegistrationsCount = [
            SELECT COUNT()
            FROM Bot_Registration__c
            WHERE Name IN :newRegistrationNames
        ];
        return duplicateRegistrationsCount > 0;
    }

    private Boolean classTemplateExists() {
        return WebHookRegistrationHelper.webHookClassTemplate != null;
    }

    private Boolean webHookPathMatchesUrlFormat(List<Bot_Registration__c> registrations) {
        final String WEB_HOOK_REGEX_PATTERN = '^(/\\w+)+$';
        for (Bot_Registration__c registration : registrations) {
            if (!Pattern.matches(WEB_HOOK_REGEX_PATTERN, registration.WebHook_Path__c)) {
                return false;
            }
        }
        return true;
    }
}
