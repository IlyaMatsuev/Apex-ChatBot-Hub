public class TelegramWebHookResolver extends WebHookResolver {
    public override Callout setWebHook(Bot__c registration) {
        TelegramBotService botService = new TelegramBotService(registration);
        return botService.setWebHook(
            CalloutHelper.getRESTUrlStart() +
            registration.WebHookUrl__c +
            CalloutHelper.SLASH +
            registration.TokenHash__c
        );
    }

    public override Callout resetWebHook(Bot__c registration) {
        TelegramBotService botService = new TelegramBotService(registration);
        return botService.deleteWebHook();
    }
}
