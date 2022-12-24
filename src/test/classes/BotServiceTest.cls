@IsTest(IsParallel = true)
public class BotServiceTest {
    private static final BotType BOT_TYPE = BotType.Telegram;

    @TestSetup
    private static void init() {
        Test.setMock(HttpCalloutMock.class, new BotWebhookCalloutMock(BOT_TYPE, TelegramBotMethod.SetWebhook.name()));
        BotSettingsProvider.settings.put(
            BOT_TYPE,
            new BotSetting__mdt(DeveloperName = BOT_TYPE.name(), ApiUrl__c = 'https://bot-api.org/bot')
        );
        insert new Bot__c(
            Type__c = BOT_TYPE.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
    }

    @IsTest
    private static void send_telegramSendMessage_shouldSendAndCreateMessageRecord() {
        Bot__c bot = getBot();
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new TelegramBotService(bot);
        Test.setMock(HttpCalloutMock.class, new BotWebhookCalloutMock(BOT_TYPE, TelegramBotMethod.SendMessage.name()));

        Test.startTest();
        service.send(chat.ExternalId__c, 'Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [SELECT Bot__c, User__c, Chat__c, Text__c, ExternalId__c FROM ChatMessage__c];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals('Hello world!', messages.get(0).Text__c);
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void send_telegramSendMessageWithFailResponse_shouldThrowException() {
        Bot__c bot = getBot();
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new TelegramBotService(bot);
        Test.setMock(
            HttpCalloutMock.class,
            new BotWebhookCalloutMock(BOT_TYPE, TelegramBotMethod.SendMessage.name())
                .overrideResponse(400, 'Server is temporary down')
        );

        Test.startTest();
        Exception error;
        try {
            service.send(chat.ExternalId__c, 'Hello world!');
        } catch (Exception ex) {
            error = ex;
        }
        Test.stopTest();
    }

    @IsTest
    private static void send_withoutSendMessageImplementation_shouldThrowException() {
        Exception error;
        try {
            new NoImplementationBotService(getBot()).send('fake-id', 'Hello world!');
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
    }

    private static Bot__c getBot() {
        return [SELECT Type__c, Handler__c, Token__c, TokenHash__c FROM Bot__c LIMIT 1];
    }

    private class NoImplementationBotService extends BotService {
        private NoImplementationBotService(Bot__c bot) {
            super(bot);
        }
    }
}
