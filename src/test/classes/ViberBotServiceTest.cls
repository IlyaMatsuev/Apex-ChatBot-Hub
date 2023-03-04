@IsTest(isParallel = true)
private class ViberBotServiceTest {
    private static final BotType BOT_TYPE = BotType.Viber;

    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    @IsTest
    private static void send_text_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Text, 'Hello world!', null, new ValueMap());
    }

    @IsTest
    private static void send_textAsUrl_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().text('https://example.com/#some-topic');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Url, null, 'https://example.com/#some-topic', new ValueMap());
    }

    @IsTest
    private static void send_textWithFailResponse_shouldThrowException() {
        BotCalloutMock calloutMock = setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        calloutMock.overrideResponse(500, 'Server is temporary down');

        Test.startTest();
        Exception error;
        try {
            fixture.sut().text('Hello world!');
        } catch (Exception ex) {
            error = ex;
        }
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertCalloutException(ViberBotMethod.SendMessage, error, 500);
    }

    @IsTest
    private static void send_image_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().image('https://example.com/image.jpeg');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Image, null, 'https://example.com/image.jpeg', new ValueMap());
    }

    @IsTest
    private static void send_video_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().video('https://example.com/video.mp4');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Video, null, 'https://example.com/video.mp4', new ValueMap());
    }

    @IsTest
    private static void send_file_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().file('https://example.com/file.pdf');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.File, null, 'https://example.com/file.pdf', new ValueMap());
    }

    @IsTest
    private static void send_contact_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().contact('John Wick', '3168998280');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Contact,
            null,
            null,
            new ValueMap().set('name', 'John Wick').set('phone', '3168998280')
        );
    }

    @IsTest
    private static void send_location_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        Decimal lat = 38.9228;
        Decimal lon = 96.1232;
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().location(lat, lon);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Location,
            null,
            null,
            new ValueMap().set('lat', lat).set('lon', lon)
        );
    }

    @IsTest
    private static void send_sticker_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().sticker(12345);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Sticker, null, null, new ValueMap().set('stickerId', '12345'));
    }

    @IsTest
    private static void send_url_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().url('https://example.com/#some-topic');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Url, null, 'https://example.com/#some-topic', new ValueMap());
    }

    private class SenderFixture {
        public Bot__c bot;
        public Chat__c chat;

        private SenderFixture() {
            this.bot = createBot();
            this.chat = createChat(bot);
        }

        public ViberBotSenderService sut() {
            return createService(bot).send(chat.ExternalId__c);
        }

        public void assertMessageIsCreated(BotMessageType messageType, String text, String mediaUrl, ValueMap params) {
            List<ChatMessage__c> messages = [
                SELECT Bot__c, User__c, Chat__c, ExternalId__c, Text__c, Type__c, MediaUrl__c, Parameters__c
                FROM ChatMessage__c
            ];
            System.assertEquals(1, messages.size());
            ChatMessage__c message = messages.get(0);
            System.assertEquals(bot.Id, message.Bot__c);
            System.assertEquals(chat.Id, message.Chat__c);
            System.assert(String.isNotBlank(message.ExternalId__c));
            System.assert(String.isBlank(message.User__c));

            System.assertEquals(messageType.name(), message.Type__c);
            System.assertEquals(text, message.Text__c);
            System.assertEquals(mediaUrl, message.MediaUrl__c);
            System.assertEquals(params.toJson(true), message.Parameters__c);
        }

        public void assertCalloutException(ViberBotMethod method, Exception error, Integer statusCode) {
            System.assert(error != null);
            System.assert(error instanceof BotCalloutService.BotCalloutException);

            BotCustomException customException = (BotCustomException) error;
            System.assert(customException.payload.has('request'));

            ValueMap requestPayload = customException.payload.getValueMap('request');
            System.assertEquals(bot.Id, requestPayload.getString('botId'));
            System.assertEquals(method.name(), requestPayload.getString('botMethod'));

            System.assert(customException.payload.has('response'));
            System.assertEquals(statusCode, customException.payload.getValueMap('response').getInteger('statusCode'));
        }
    }

    private static BotCalloutMock setCalloutMock() {
        BotCalloutMock mock = new BotCalloutMock(BOT_TYPE);
        Test.setMock(HttpCalloutMock.class, mock);
        return mock;
    }

    private static Bot__c createBot() {
        insert new Bot__c(
            Name = 'TestBot',
            Type__c = BOT_TYPE.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return [
            SELECT Name, Type__c, Handler__c, Token__c, TokenHash__c
            FROM Bot__c
            LIMIT 1
        ];
    }

    private static Chat__c createChat(Bot__c bot) {
        Chat__c chat = new Chat__c(
            Name = 'TestChat',
            Bot__c = bot.Id,
            ExternalId__c = '3214:' + bot.TokenHash__c.substring(0, 20)
        );
        insert chat;
        return chat;
    }

    private static ViberBotService createService(Bot__c bot) {
        return (ViberBotService) new BotServiceFactory().createBotService(bot);
    }
}