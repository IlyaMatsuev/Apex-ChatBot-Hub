@IsTest(IsParallel=true)
private class BotUpsertDataEventTriggerTest {
    private static final String BOT_TYPE = BotType.Telegram.name();
    private static final String BOT_TOKEN = '74712731t723gjhbbfkwnkqwguqg17g2717283';
    private static final String BOT_HANDLER = 'BotHandlerMock';

    @TestSetup
    private static void init() {
        Test.setMock(
            HttpCalloutMock.class,
            new BotWebhookCalloutMock(BotType.valueOf(BOT_TYPE), TelegramBotMethod.SetWebhook.name())
        );
        BotType type = BotType.valueOf(BOT_TYPE);
        BotSettingsProvider.settings.put(
            type,
            new BotSetting__mdt(DeveloperName = type.name(), ApiUrl__c = 'https://bot-api.org/bot')
        );
        insert new Bot__c(Type__c = BOT_TYPE, Token__c = type.name(), Handler__c = BOT_HANDLER);
    }

    @IsTest
    private static void handle_upsertMultipleRecords_shouldUpsertRecords() {
    }

    @IsTest
    private static void handle_upsertMultipleRecordsWithExternalId_shouldUpsertRecords() {
    }
}
