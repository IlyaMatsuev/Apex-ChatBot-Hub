@IsTest(isParallel = true)
private class BotServiceTest {
    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    @IsTest
    private static void send_withoutSendMessageImplementation_shouldThrowException() {
        Exception error;
        try {
            new NoImplementationBotService(prepareBot(BotType.Telegram)).send('fake-id', 'Hello world!');
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assertEquals('fake-id', serviceError.payload.getString('chatId'));
        System.assertEquals('Hello world!', serviceError.payload.getString('message'));
    }

    /**
     * Telegram tests
     */

    @IsTest
    private static void send_telegramSendMessage_shouldSendAndCreateMessageRecord() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Telegram));

        Bot__c bot = prepareBot(BotType.Telegram);
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new TelegramBotService(bot);

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
        BotCalloutMock calloutMock = new BotCalloutMock(BotType.Telegram);
        Test.setMock(HttpCalloutMock.class, calloutMock);

        Bot__c bot = prepareBot(BotType.Telegram);
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new TelegramBotService(bot);

        calloutMock.overrideResponse(500, 'Server is temporary down');

        Test.startTest();
        Exception error;
        try {
            service.send(chat.ExternalId__c, 'Hello world!');
        } catch (Exception ex) {
            error = ex;
        }
        Test.stopTest();

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assert(serviceError.payload.has('request'));
        System.assertEquals(bot.Id, serviceError.payload.getValueMap('request').getString('botId'));
        System.assertEquals(
            TelegramBotMethod.SendMessage.name(),
            serviceError.payload.getValueMap('request').getString('botMethod')
        );
        System.assert(serviceError.payload.has('response'));
        System.assertEquals(500, serviceError.payload.getValueMap('response').getInteger('statusCode'));
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void send_viberSendMessage_shouldSendAndCreateMessageRecord() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Viber));

        Bot__c bot = prepareBot(BotType.Viber);
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new ViberBotService(bot);

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
    private static void send_viberSendMessageWithFailResponse_shouldThrowException() {
        BotCalloutMock calloutMock = new BotCalloutMock(BotType.Viber);
        Test.setMock(HttpCalloutMock.class, calloutMock);

        Bot__c bot = prepareBot(BotType.Viber);
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new ViberBotService(bot);

        calloutMock.overrideResponse(500, 'Server is temporary down');

        Test.startTest();
        Exception error;
        try {
            service.send(chat.ExternalId__c, 'Hello world!');
        } catch (Exception ex) {
            error = ex;
        }
        Test.stopTest();

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assert(serviceError.payload.has('request'));
        System.assertEquals(bot.Id, serviceError.payload.getValueMap('request').getString('botId'));
        System.assertEquals(
            ViberBotMethod.SendMessage.name(),
            serviceError.payload.getValueMap('request').getString('botMethod')
        );
        System.assert(serviceError.payload.has('response'));
        System.assertEquals(500, serviceError.payload.getValueMap('response').getInteger('statusCode'));
    }

    private static Bot__c prepareBot(BotType type) {
        insert new Bot__c(
            Name = type.name(),
            Type__c = type.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return [
            SELECT Name, Type__c, Handler__c, Token__c, TokenHash__c
            FROM Bot__c
            WHERE Type__c = :type.name()
            LIMIT 1
        ];
    }

    private class NoImplementationBotService extends BotService {
        private NoImplementationBotService(Bot__c bot) {
            super(bot);
        }
    }
}
