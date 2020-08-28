/**
 * Created by Ilya Matsuev on 8/26/2020.
 */

public with sharing class VKWebHookResolver extends WebHookResolver {

    public override Callout setWebHook(Bot_Registration__c registration) {
        VKBotService botService = new VKBotService(registration);
        return botService.setWebHook(CalloutHelper.getRESTUrlStart() + registration.WebHook_Path__c + CalloutHelper.SLASH + registration.Hashed_Token__c);
    }

    public override Callout resetWebHook(Bot_Registration__c registration) {
        VKBotService botService = new VKBotService(registration);
        return botService.deleteWebHook();
    }
}
