// TODO: Optimize tests, remove duplicated code
@IsTest(isParallel = true)
private class BotServiceTest {
    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    @IsTest
    private static void sendMessage_withoutImplementation_shouldThrowException() {
        Exception error;
        try {
            new NoImplementationBotService(prepareBot(BotType.Telegram)).sendMessage('fake-id', 'Hello world!');
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assertEquals('fake-id', serviceError.payload.getString('chatId'));
        ValueMap params = ValueMap.fromJson(JSON.serialize(serviceError.payload.get('params')));
        System.assertEquals('Hello world!', params.getString('text'));
    }

    @IsTest
    private static void sendImage_withoutImplementation_shouldThrowException() {
        Exception error;
        try {
            new NoImplementationBotService(prepareBot(BotType.Telegram)).sendImage('fake-id', '/fake-url.jpeg');
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assertEquals('fake-id', serviceError.payload.getString('chatId'));
        ValueMap params = ValueMap.fromJson(JSON.serialize(serviceError.payload.get('params')));
        System.assert(params.getString('text') == null);
        System.assertEquals('/fake-url.jpeg', params.getString('mediaUrl'));
    }

    @IsTest
    private static void sendVideo_withoutImplementation_shouldThrowException() {
        Exception error;
        try {
            new NoImplementationBotService(prepareBot(BotType.Telegram)).sendVideo('fake-id', '/fake-video.mp4');
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assertEquals('fake-id', serviceError.payload.getString('chatId'));
        ValueMap params = ValueMap.fromJson(JSON.serialize(serviceError.payload.get('params')));
        System.assert(params.getString('text') == null);
        System.assertEquals('/fake-video.mp4', params.getString('mediaUrl'));
    }

    @IsTest
    private static void sendFile_withoutImplementation_shouldThrowException() {
        Exception error;
        try {
            new NoImplementationBotService(prepareBot(BotType.Telegram)).sendFile('fake-id', '/fake-file.pdf');
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assertEquals('fake-id', serviceError.payload.getString('chatId'));
        ValueMap params = ValueMap.fromJson(JSON.serialize(serviceError.payload.get('params')));
        System.assert(params.getString('text') == null);
        System.assertEquals('/fake-file.pdf', params.getString('mediaUrl'));
    }

    @IsTest
    private static void sendContact_withoutImplementation_shouldThrowException() {
        Exception error;
        try {
            new NoImplementationBotService(prepareBot(BotType.Telegram))
                .sendContact('fake-id', 'John Wick', '3168998280');
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assertEquals('fake-id', serviceError.payload.getString('chatId'));
        ValueMap params = ValueMap.fromJson(JSON.serialize(serviceError.payload.get('params')));
        System.assert(params.getString('text') == null);
        System.assert(params.getString('mediaUrl') == null);

        ValueMap additionalInfo = params.getValueMap('additionalInfo').getValueMap('values');
        System.assertEquals('John Wick', additionalInfo.getString('name'));
        System.assertEquals('3168998280', additionalInfo.getString('phone'));
    }

    @IsTest
    private static void sendLocation_withoutImplementation_shouldThrowException() {
        Decimal lat = 38.9228;
        Decimal lon = 96.1232;
        Exception error;
        try {
            new NoImplementationBotService(prepareBot(BotType.Telegram)).sendLocation('fake-id', lat, lon);
        } catch (Exception ex) {
            error = ex;
        }

        System.assert(error != null);
        System.assert(error instanceof BotService.BotServiceException);
        BotService.BotServiceException serviceError = (BotService.BotServiceException) error;
        System.assertEquals('fake-id', serviceError.payload.getString('chatId'));
        ValueMap params = ValueMap.fromJson(JSON.serialize(serviceError.payload.get('params')));
        System.assert(params.getString('text') == null);
        System.assert(params.getString('mediaUrl') == null);

        ValueMap additionalInfo = params.getValueMap('additionalInfo').getValueMap('values');
        System.assertEquals(String.valueOf(lat), additionalInfo.getString('lat'));
        System.assertEquals(String.valueOf(lon), additionalInfo.getString('lon'));
    }

    /**
     * Telegram tests
     */

    @IsTest
    private static void sendMessage_telegram_shouldSendAndCreateMessageRecord() {
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
        service.sendMessage(chat.ExternalId__c, 'Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals('Hello world!', messages.get(0).Text__c);
        System.assertEquals(BotMessageType.Text.name(), messages.get(0).Type__c);
        System.assert(String.isBlank(messages.get(0).MediaUrl__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendMessage_telegramWithFailResponse_shouldThrowException() {
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
            service.sendMessage(chat.ExternalId__c, 'Hello world!');
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

    @IsTest
    private static void sendImage_telegram_shouldSendAndCreateMessageRecord() {
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
        service.sendImage(chat.ExternalId__c, 'https://example.com/image.jpeg');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Image.name(), messages.get(0).Type__c);
        System.assertEquals('https://example.com/image.jpeg', messages.get(0).MediaUrl__c);
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendVideo_telegram_shouldSendAndCreateMessageRecord() {
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
        service.sendVideo(chat.ExternalId__c, 'https://example.com/video.mp4');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Video.name(), messages.get(0).Type__c);
        System.assertEquals('https://example.com/video.mp4', messages.get(0).MediaUrl__c);
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendFile_telegram_shouldSendAndCreateMessageRecord() {
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
        service.sendFile(chat.ExternalId__c, 'https://example.com/file.pdf');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.File.name(), messages.get(0).Type__c);
        System.assertEquals('https://example.com/file.pdf', messages.get(0).MediaUrl__c);
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendContact_telegram_shouldSendAndCreateMessageRecord() {
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
        service.sendContact(chat.ExternalId__c, 'John Wick', '3168998280');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, Parameters__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Contact.name(), messages.get(0).Type__c);
        System.assert(String.isBlank(messages.get(0).MediaUrl__c));
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));

        ValueMap additionalInfo = ValueMap.fromJson(messages.get(0).Parameters__c);
        System.assertEquals('John Wick', additionalInfo.getString('name'));
        System.assertEquals('3168998280', additionalInfo.getString('phone'));
    }

    @IsTest
    private static void sendLocation_telegram_shouldSendAndCreateMessageRecord() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Telegram));

        Decimal lat = 38.9228;
        Decimal lon = 96.1232;
        Bot__c bot = prepareBot(BotType.Telegram);
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new TelegramBotService(bot);

        Test.startTest();
        service.sendLocation(chat.ExternalId__c, lat, lon);
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, Parameters__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Location.name(), messages.get(0).Type__c);
        System.assert(String.isBlank(messages.get(0).MediaUrl__c));
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));

        ValueMap additionalInfo = ValueMap.fromJson(messages.get(0).Parameters__c);
        System.assertEquals(String.valueOf(lat), additionalInfo.getString('lat'));
        System.assertEquals(String.valueOf(lon), additionalInfo.getString('lon'));
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void sendMessage_viber_shouldSendAndCreateMessageRecord() {
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
        service.sendMessage(chat.ExternalId__c, 'Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals('Hello world!', messages.get(0).Text__c);
        System.assertEquals(BotMessageType.Text.name(), messages.get(0).Type__c);
        System.assert(String.isBlank(messages.get(0).MediaUrl__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendMessage_viberWithFailResponse_shouldThrowException() {
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
            service.sendMessage(chat.ExternalId__c, 'Hello world!');
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

    @IsTest
    private static void sendImage_viber_shouldSendAndCreateMessageRecord() {
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
        service.sendImage(chat.ExternalId__c, 'https://example.com/image.jpeg');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Image.name(), messages.get(0).Type__c);
        System.assertEquals('https://example.com/image.jpeg', messages.get(0).MediaUrl__c);
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendVideo_viber_shouldSendAndCreateMessageRecord() {
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
        service.sendVideo(chat.ExternalId__c, 'https://example.com/video.mp4');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Video.name(), messages.get(0).Type__c);
        System.assertEquals('https://example.com/video.mp4', messages.get(0).MediaUrl__c);
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendFile_viber_shouldSendAndCreateMessageRecord() {
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
        service.sendFile(chat.ExternalId__c, 'https://example.com/file.pdf');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.File.name(), messages.get(0).Type__c);
        System.assertEquals('https://example.com/file.pdf', messages.get(0).MediaUrl__c);
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));
    }

    @IsTest
    private static void sendContact_viber_shouldSendAndCreateMessageRecord() {
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
        service.sendContact(chat.ExternalId__c, 'John Wick', '3168998280');
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, Parameters__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Contact.name(), messages.get(0).Type__c);
        System.assert(String.isBlank(messages.get(0).MediaUrl__c));
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));

        ValueMap additionalInfo = ValueMap.fromJson(messages.get(0).Parameters__c);
        System.assertEquals('John Wick', additionalInfo.getString('name'));
        System.assertEquals('3168998280', additionalInfo.getString('phone'));
    }

    @IsTest
    private static void sendLocation_viber_shouldSendAndCreateMessageRecord() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Viber));

        Decimal lat = 55.7439;
        Decimal lon = -10.1442;
        Bot__c bot = prepareBot(BotType.Viber);
        Chat__c chat = new Chat__c(
            Name = 'Test',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        BotService service = new ViberBotService(bot);

        Test.startTest();
        service.sendLocation(chat.ExternalId__c, lat, lon);
        Test.getEventBus().deliver();
        Test.stopTest();

        List<ChatMessage__c> messages = [
            SELECT Bot__c, User__c, Chat__c, Text__c, Type__c, MediaUrl__c, Parameters__c, ExternalId__c
            FROM ChatMessage__c
        ];
        System.assertEquals(1, messages.size());
        System.assertEquals(bot.Id, messages.get(0).Bot__c);
        System.assertEquals(chat.Id, messages.get(0).Chat__c);
        System.assertEquals(BotMessageType.Location.name(), messages.get(0).Type__c);
        System.assert(String.isBlank(messages.get(0).MediaUrl__c));
        System.assert(String.isBlank(messages.get(0).Text__c));
        System.assert(String.isBlank(messages.get(0).User__c));
        System.assert(String.isNotBlank(messages.get(0).ExternalId__c));

        ValueMap additionalInfo = ValueMap.fromJson(messages.get(0).Parameters__c);
        System.assertEquals(String.valueOf(lat), additionalInfo.getString('lat'));
        System.assertEquals(String.valueOf(lon), additionalInfo.getString('lon'));
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
