@IsTest(isParallel = true)
private class BotTriggerTest {
    private static final String BOT_TOKEN = '74712731t723gjhbbfkwnkqwguqg17g2717283';
    private static final String BOT_HANDLER = 'BotHandlerMock';

    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    /**
     * Telegram tests
     */

    @IsTest
    private static void insert_telegramWithCorrectData_shouldCreateBotAndSetWebhook() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        Test.startTest();
        insert new Bot__c(Type__c = BotType.Telegram.name(), Token__c = BOT_TOKEN, Handler__c = BOT_HANDLER);
        Test.stopTest();

        List<Bot__c> newBots = [
            SELECT Type__c, WebhookEvents__c, Handler__c, Token__c, TokenHash__c
            FROM Bot__c
            LIMIT 1
        ];
        Assert.areEqual(1, newBots.size());
        Assert.isTrue(String.isNotBlank(newBots.get(0).TokenHash__c));
    }

    @IsTest
    private static void insert_telegramWithInvalidHandler_shouldThrowException() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        Exception error;
        Test.startTest();
        try {
            insert new Bot__c(
                Type__c = BotType.Telegram.name(),
                Token__c = BOT_TOKEN,
                Handler__c = 'BotTriggerTest.FakeBotHandler'
            );
        } catch (Exception ex) {
            error = ex;
        }
        Test.stopTest();

        Assert.isTrue(error != null);
        Assert.isTrue(
            error.getMessage().contains('Bot handler does not exist or does not implement the IBotHandler interface')
        );
        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        Assert.areEqual(0, errors.size());
    }

    @IsTest
    private static void delete_telegramWithCorrectData_shouldDeleteAndUnsetWebhook() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        Test.startTest();
        Bot__c bot = new Bot__c(Type__c = BotType.Telegram.name(), Token__c = BOT_TOKEN, Handler__c = BOT_HANDLER);
        insert bot;

        delete bot;
        Test.stopTest();
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void insert_viberWithCorrectData_shouldCreateBotAndSetWebhook() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        Test.startTest();
        insert new Bot__c(Type__c = BotType.Viber.name(), Token__c = BOT_TOKEN, Handler__c = BOT_HANDLER);
        Test.stopTest();

        List<Bot__c> newBots = [
            SELECT Type__c, WebhookEvents__c, Handler__c, Token__c, TokenHash__c
            FROM Bot__c
            LIMIT 1
        ];
        Assert.areEqual(1, newBots.size());
        Assert.isTrue(String.isNotBlank(newBots.get(0).TokenHash__c));
    }

    @IsTest
    private static void insert_viberWithInvalidHandler_shouldThrowException() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        Exception error;
        Test.startTest();
        try {
            insert new Bot__c(
                Type__c = BotType.Viber.name(),
                Token__c = BOT_TOKEN,
                Handler__c = 'BotTriggerTest.FakeBotHandler'
            );
        } catch (Exception ex) {
            error = ex;
        }
        Test.stopTest();

        Assert.isTrue(error != null);
        Assert.isTrue(
            error.getMessage().contains('Bot handler does not exist or does not implement the IBotHandler interface')
        );
        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        Assert.areEqual(0, errors.size());
    }

    @IsTest
    private static void delete_viberWithCorrectData_shouldDeleteAndUnsetWebhook() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        Test.startTest();
        Bot__c bot = new Bot__c(Type__c = BotType.Viber.name(), Token__c = BOT_TOKEN, Handler__c = BOT_HANDLER);
        insert bot;

        delete bot;
        Test.stopTest();
    }
}
