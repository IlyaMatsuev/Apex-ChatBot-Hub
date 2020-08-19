/**
 * Created by Ilya Matsuev on 7/25/2020.
 */

public with sharing class WebHookRegistrationHelper {

    public static String webHookClassTemplate {
        get {
            if (webHookClassTemplate == null) {
                List<StaticResource> resources = [
                        SELECT Body
                        FROM StaticResource
                        WHERE Name = :WEB_HOOK_CLASS_TEMPLATE_NAME
                        LIMIT 1
                ];
                if (!resources.isEmpty() && resources.get(0).Body != null) {
                    webHookClassTemplate = resources.get(0).Body.toString();
                }
            }
            return webHookClassTemplate;
        }
        private set;
    }

    public static final String WEB_HOOK_CLASS_PREFIX = 'BotRegistration_';
    public static final String WEB_HOOK_CLASS_TEMPLATE_NAME = 'WebHookServiceTemplate';

    private static final Map<String, String> toolingAPIHeaders = new Map<String, String>{
            CalloutHelper.AUTHORIZATION_HEADER => CalloutHelper.BEARER_AUTHORIZATION + CalloutHelper.SPACE + UserInfo.getSessionId(),
            CalloutHelper.CONTENT_TYPE_HEADER => CalloutHelper.JSON_CONTENT_TYPE
    };


    public static void registerWebHookHandler(Bot_Registration__c registration) {
        Bot_Setting__mdt botSettings = getBotSettings(registration.System__c);
        Map<String, String> restHandlerParams = new Map<String, String>();
        String className = generateClassName(registration);
        String classBody = generateClassBody(registration, className);
        restHandlerParams.put('Name', className);
        restHandlerParams.put('Body', classBody);
        Callout generateClassCallout = new Callout(
                CalloutHelper.getToolingApexClassesAPIUrl(),
                CalloutHelper.METHOD_POST,
                toolingAPIHeaders,
                JSON.serialize(restHandlerParams)
        );
        if (generateClassCallout.isSuccess() && botSettings != null) {
            WebHookResolver resolver = WebHookResolver.getResolver(registration.System__c);
            Callout setWebHookCallout = resolver.setWebHook(registration, botSettings);
            if (!setWebHookCallout.isSuccess()) {
                throw new BotRegistrationException(Label.SetWebHookCalloutError, setWebHookCallout);
            }
        } else {
            throw new BotRegistrationException(Label.WebHookClassCreateError, generateClassCallout);
        }
    }

    public static void updateWebHookHandler(Bot_Registration__c oldRegistration, Bot_Registration__c registration) {
        removeWebHookHandler(oldRegistration);
        registerWebHookHandler(registration);
    }

    public static void removeWebHookHandler(Bot_Registration__c registration) {
        Bot_Setting__mdt botSettings = getBotSettings(registration.System__c);
        String className = generateClassName(registration);
        List<ApexClass> classes = [SELECT Id FROM ApexClass WHERE Name = :className];
        if (!classes.isEmpty()) {
            Id classId = classes.get(0).Id;
            Callout deleteClassCallout = new Callout(
                    CalloutHelper.getToolingApexClassesAPIUrl() + CalloutHelper.SLASH + classId,
                    CalloutHelper.METHOD_DELETE,
                    toolingAPIHeaders
            );
            if (deleteClassCallout.isSuccess() && botSettings != null) {
                WebHookResolver resolver = WebHookResolver.getResolver(registration.System__c);
                Callout resetWebHookCallout = resolver.resetWebHook(registration, botSettings);
                if (!resetWebHookCallout.isSuccess()) {
                    throw new BotRegistrationException(Label.ResetWebHookCalloutError, resetWebHookCallout);
                }
            } else {
                throw new BotRegistrationException(Label.WebHookClassDeleteError, deleteClassCallout);
            }
        }
    }


    private static String generateClassName(Bot_Registration__c registration) {
        return WEB_HOOK_CLASS_PREFIX + registration.Name;
    }

    private static String generateClassBody(Bot_Registration__c registration, String className) {
        return webHookClassTemplate
                .replace('%className%', className)
                .replace('%path%', registration.WebHook_Path__c);
    }

    private static Bot_Setting__mdt getBotSettings(String systemName) {
        List<Bot_Setting__mdt> settingsList = [
                SELECT DeveloperName, API_Url__c
                FROM Bot_Setting__mdt
                WHERE DeveloperName = :systemName
        ];
        Bot_Setting__mdt settings = null;
        if (!settingsList.isEmpty()) {
            settings = settingsList.get(0);
        }
        return settings;
    }
}
