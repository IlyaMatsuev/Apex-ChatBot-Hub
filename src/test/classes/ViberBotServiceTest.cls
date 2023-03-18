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
        public BotModel bot;
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
            Assert.areEqual(1, messages.size());
            ChatMessage__c message = messages.get(0);
            Assert.areEqual(bot.id, message.Bot__c);
            Assert.areEqual(chat.Id, message.Chat__c);
            Assert.isTrue(String.isNotBlank(message.ExternalId__c));
            Assert.isTrue(String.isBlank(message.User__c));

            Assert.areEqual(messageType.name(), message.Type__c);
            Assert.areEqual(text, message.Text__c);
            Assert.areEqual(mediaUrl, message.MediaUrl__c);
            Assert.areEqual(params.toJson(true), message.Parameters__c);
        }

        public void assertCalloutException(ViberBotMethod method, Exception error, Integer statusCode) {
            Assert.isNotNull(error);
            Assert.isInstanceOfType(error, BotCalloutService.BotCalloutException.class);

            BotCustomException customException = (BotCustomException) error;
            Assert.isTrue(customException.payload.has('request'));

            ValueMap requestPayload = customException.payload.getValueMap('request');
            Assert.areEqual(bot.id, requestPayload.getString('botId'));
            Assert.areEqual(method.name(), requestPayload.getString('botMethod'));

            Assert.isTrue(customException.payload.has('response'));
            Assert.areEqual(statusCode, customException.payload.getValueMap('response').getInteger('statusCode'));
        }
    }

    private static BotCalloutMock setCalloutMock() {
        BotCalloutMock mock = new ViberBotCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        return mock;
    }

    private static BotModel createBot() {
        insert new Bot__c(
            Name = 'TestBot',
            Type__c = BOT_TYPE.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return new BotModel(
            [
                SELECT Name, Type__c, Handler__c, Token__c, TokenHash__c
                FROM Bot__c
                LIMIT 1
            ]
        );
    }

    private static Chat__c createChat(BotModel bot) {
        Chat__c chat = new Chat__c(
            Name = 'TestChat',
            Bot__c = bot.id,
            ExternalId__c = '3214:' + bot.tokenHash.substring(0, 20)
        );
        insert chat;
        return chat;
    }

    private static ViberBotService createService(BotModel bot) {
        return (ViberBotService) new BotServiceFactory().createBotService(bot);
    }
}
