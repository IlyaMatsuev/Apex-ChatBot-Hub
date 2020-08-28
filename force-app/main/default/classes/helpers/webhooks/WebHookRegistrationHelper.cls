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

    public static final String FORCE_SITE_NAME = 'Test1';
    public static final String FORCE_SITE_PROFILE_NAME = FORCE_SITE_NAME + ' Profile';
    public static final String WEB_HOOK_CLASS_PREFIX = 'BotRegistration_';
    public static final String WEB_HOOK_CLASS_TEMPLATE_NAME = 'WebHookServiceTemplate';

    private static final Map<String, String> toolingAPIHeaders = new Map<String, String>{
            CalloutHelper.AUTHORIZATION_HEADER => CalloutHelper.BEARER_AUTHORIZATION + CalloutHelper.SPACE + UserInfo.getSessionId(),
            CalloutHelper.CONTENT_TYPE_HEADER => CalloutHelper.JSON_CONTENT_TYPE
    };


    public static void registerWebHookHandler(Bot_Registration__c registration) {
        Bot_Setting__mdt botSettings = BotSettingsService.getBotSettings(registration.System__c);
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
            giveRESTClassAccess(className);
            WebHookResolver resolver = WebHookResolver.getResolver(registration.System__c);
            Callout setWebHookCallout = resolver.setWebHook(registration);
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
        Bot_Setting__mdt botSettings = BotSettingsService.getBotSettings(registration.System__c);
        String className = generateClassName(registration);
        List<ApexClass> classes = [SELECT Id FROM ApexClass WHERE Name = :className LIMIT 1];
        if (!classes.isEmpty()) {
            Id classId = classes.get(0).Id;
            Callout deleteClassCallout = new Callout(
                    CalloutHelper.getToolingApexClassesAPIUrl() + CalloutHelper.SLASH + classId,
                    CalloutHelper.METHOD_DELETE,
                    toolingAPIHeaders
            );
            if (deleteClassCallout.isSuccess() && botSettings != null) {
                WebHookResolver resolver = WebHookResolver.getResolver(registration.System__c);
                Callout resetWebHookCallout = resolver.resetWebHook(registration);
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

    private static void giveRESTClassAccess(String className) {
        MetadataService.Profile siteProfile = new MetadataService.Profile();
        siteProfile.fullName = FORCE_SITE_PROFILE_NAME;
        MetadataService.ProfileApexClassAccess classAccess = new MetadataService.ProfileApexClassAccess();
        classAccess.apexClass = className;
        classAccess.enabled = true;
        siteProfile.classAccesses = new MetadataService.ProfileApexClassAccess[] {classAccess};
        MetadataService.SaveResult updateResult = MetadataProvider.updateMetadata(siteProfile);
        if (!updateResult.success) {
            throw new BotRegistrationException(Label.ClassGrantAccessError.replace('{0}', className).replace('{1}', updateResult.errors.get(0).message));
        }
    }
}
