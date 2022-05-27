/**
 * Created by Ilya Matsuev on 8/16/2020.
 */

public with sharing class TelegramWebHookResolver extends WebHookResolver {
    public override Callout setWebHook(Bot_Registration__c registration) {
        TelegramBotService botService = new TelegramBotService(registration);
        return botService.setWebHook(
            CalloutHelper.getRESTUrlStart() +
            registration.WebHook_Path__c +
            CalloutHelper.SLASH +
            registration.Hashed_Token__c
        );
    }

    public override Callout resetWebHook(Bot_Registration__c registration) {
        TelegramBotService botService = new TelegramBotService(registration);
        return botService.deleteWebHook();
    }
}
