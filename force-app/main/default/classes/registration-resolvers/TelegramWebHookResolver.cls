/**
 * Created by Ilya Matsuev on 8/16/2020.
 */

public with sharing class TelegramWebHookResolver extends WebHookResolver {

    public override Callout setWebHook(Bot_Registration__c registration, Bot_Setting__mdt settings) {
        // TODO: call method from TelegramBotService
        String params = CalloutHelper.buildUrlParams(new Map<String, String>{
                'url' => CalloutHelper.getRESTUrlStart() + registration.WebHook_Path__c + CalloutHelper.SLASH + registration.Hashed_Token__c
        });
        String setWebHookCalloutEndpoint = settings.API_Url__c + registration.Token__c + '/setWebhook' + params;
        Callout setWebHookCallout = new Callout(setWebHookCalloutEndpoint, CalloutHelper.METHOD_GET);
        return setWebHookCallout;
    }

    public override Callout resetWebHook(Bot_Registration__c registration, Bot_Setting__mdt settings) {
        String resetWebHookCalloutEndpoint = settings.API_Url__c + registration.Token__c + '/deleteWebhook';
        Callout resetWebHookCallout = new Callout(resetWebHookCalloutEndpoint, CalloutHelper.METHOD_GET);
        return resetWebHookCallout;
    }
}
