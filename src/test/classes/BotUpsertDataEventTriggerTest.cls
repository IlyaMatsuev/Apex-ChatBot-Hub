@IsTest(isParallel = true)
private class BotUpsertDataEventTriggerTest {
    @TestSetup
    private static void init() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Telegram));
        BotSettingsProvider.mock();
        insert new Bot__c(
            Type__c = BotType.Telegram.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
    }

    @IsTest
    private static void handle_upsertMultipleRecords_shouldUpsertRecords() {
        Bot__c bot = [SELECT Id FROM Bot__c LIMIT 1];
        insert new Chat__c(Name = 'Chat1', Bot__c = bot.id, ExternalId__c = '1234');

        List<SObject> records = new List<SObject> {
            new Chat__c(Name = 'Chat11', Bot__c = bot.id, ExternalId__c = '1235'),
            new Chat__c(Name = 'Chat2', Bot__c = bot.id, ExternalId__c = '4321'),
            new ChatUser__c(Name = 'Test1', Username__c = 'username1', ExternalId__c = '1234'),
            new ChatMessage__c(
                Bot__c = bot.id,
                Chat__r = new Chat__c(ExternalId__c = '1234'),
                Text__c = 'test1',
                ExternalId__c = '0987'
            ),
            new ChatMessage__c(
                User__r = new ChatUser__c(ExternalId__c = '1234'),
                Chat__r = new Chat__c(ExternalId__c = '1234'),
                Text__c = 'test2',
                ExternalId__c = '5678'
            )
        };

        Test.startTest();
        Eventbus.publish(new BotUpsertDataEvent__e(Data__c = JSON.serialize(records)));
        Test.getEventBus().deliver();
        Test.stopTest();

        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];
        System.assertEquals(3, chats.size());
        System.assertEquals(1, users.size());
        System.assertEquals(2, messages.size());
    }

    @IsTest
    private static void handle_upsertMultipleRecordsWithExternalId_shouldUpsertRecords() {
        Bot__c bot = [SELECT Id FROM Bot__c LIMIT 1];
        insert new Chat__c(Name = 'Chat1', Bot__c = bot.id, ExternalId__c = '1234');

        List<SObject> records = new List<SObject> {
            new Chat__c(Name = 'Chat11', Bot__c = bot.id, ExternalId__c = '1234'),
            new Chat__c(Name = 'Chat2', Bot__c = bot.id, ExternalId__c = '4321'),
            new ChatUser__c(Name = 'Test1', Username__c = 'username1', ExternalId__c = '1234'),
            new ChatMessage__c(
                Bot__c = bot.id,
                Chat__r = new Chat__c(ExternalId__c = '1234'),
                Text__c = 'test1',
                ExternalId__c = '0987'
            ),
            new ChatMessage__c(
                User__r = new ChatUser__c(ExternalId__c = '1234'),
                Chat__r = new Chat__c(ExternalId__c = '1234'),
                Text__c = 'test2',
                ExternalId__c = '5678'
            )
        };

        Test.startTest();
        Eventbus.publish(
            new BotUpsertDataEvent__e(Data__c = JSON.serialize(records), ExternalIdField__c = 'ExternalId__c')
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];
        System.assertEquals(2, chats.size());
        System.assertEquals(1, users.size());
        System.assertEquals(2, messages.size());
    }
}
