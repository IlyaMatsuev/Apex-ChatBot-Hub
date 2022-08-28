@IsTest(IsParallel=true)
private class BotTriggerTest {
    private static final BotType BOT_TYPE = BotType.Telegram;
    private static final String BOT_TOKEN = '74712731t723gjhbbfkwnkqwguqg17g2717283';
    private static final String BOT_HANDLER = 'BotHandlerMock';

    @TestSetup
    private static void init() {
        BotSettingsProvider.settings.put(
            BOT_TYPE,
            new BotSetting__mdt(DeveloperName = BOT_TYPE.name(), ApiUrl__c = 'https://bot-api.org/bot')
        );
    }

    @IsTest
    private static void insert_withCorrectData_shouldCreateBotAndSetWebhook() {
        Test.setMock(HttpCalloutMock.class, new BotWebhookCalloutMock(BOT_TYPE, TelegramBotMethod.SetWebhook.name()));

        Test.startTest();
        insert new Bot__c(Type__c = BOT_TYPE.name(), Token__c = BOT_TOKEN, Handler__c = BOT_HANDLER);
        Test.stopTest();

        List<Bot__c> newBots = [SELECT Type__c, Handler__c, Token__c, TokenHash__c FROM Bot__c LIMIT 1];
        System.assertEquals(1, newBots.size());
        System.assert(String.isNotBlank(newBots.get(0).TokenHash__c));
    }

    @IsTest
    private static void insert_withInvalidHandler_shouldThrowException() {
        Test.setMock(HttpCalloutMock.class, new BotWebhookCalloutMock(BOT_TYPE, TelegramBotMethod.SetWebhook.name()));

        Exception error;
        Test.startTest();
        try {
            insert new Bot__c(
                Type__c = BOT_TYPE.name(),
                Token__c = BOT_TOKEN,
                Handler__c = 'BotTriggerTest.FakeBotHandler'
            );
        } catch (Exception ex) {
            error = ex;
        }
        Test.stopTest();

        System.assert(error != null);
        System.assert(
            error.getMessage().contains('Bot handler does not exist or does not implement the IBotHandler interface')
        );
    }

    @IsTest
    private static void delete_withCorrectData_shouldDeleteAndUnsetWebhook() {
        Test.setMock(HttpCalloutMock.class, new BotWebhookCalloutMock(BOT_TYPE));

        Test.startTest();
        Bot__c bot = new Bot__c(Type__c = BOT_TYPE.name(), Token__c = BOT_TOKEN, Handler__c = BOT_HANDLER);
        insert bot;

        delete bot;
        Test.stopTest();
    }
}
