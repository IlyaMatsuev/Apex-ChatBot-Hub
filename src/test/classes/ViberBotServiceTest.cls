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
        fixture.sut().send(fixture.chat.ExternalId__c).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Text, 'Hello world!', null, new ValueMap());
    }

    @IsTest
    private static void send_textAsUrl_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).text('https://example.com/#some-topic');
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
            fixture.sut().send(fixture.chat.ExternalId__c).text('Hello world!');
        } catch (Exception ex) {
            error = ex;
        }
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertCalloutException(ViberBotMethod.SendMessage, error, 500);
    }

    @IsTest
    private static void send_textWithReplyKeyboard_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        List<BotReplyKeyboardButton> replyButtons = new List<BotReplyKeyboardButton> {
            new BotReplyKeyboardButton('Share my contact ☎️').shareContact(),
            new BotReplyKeyboardButton('Share my location 📍').shareLocation(),
            new BotReplyKeyboardButton('I do not wanna share anything 😤')
        };
        ViberSendKeyboardOptions expectedKeyboard = new ViberSendKeyboardOptions()
            .addButton(new ViberSendKeyboardOptions.Button().asPhoneSharing('Share my contact ☎️'))
            .addButton(new ViberSendKeyboardOptions.Button().asLocationSharing('Share my location 📍'))
            .addButton(
                new ViberSendKeyboardOptions.Button()
                    .asReply('I do not wanna share anything 😤', 'I do not wanna share anything 😤')
            )
            .setType('keyboard');

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withReplyKeyboard(replyButtons).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Text,
            'Hello world!',
            null,
            new ValueMap().set('keyboard', expectedKeyboard)
        );
    }

    @IsTest
    private static void send_image_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).image('https://example.com/image.jpeg');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Image, null, 'https://example.com/image.jpeg', new ValueMap());
    }

    @IsTest
    private static void send_imageWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).image('https://example.com/image.jpeg', 'Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Image,
            'Hello world!',
            'https://example.com/image.jpeg',
            new ValueMap()
        );
    }

    @IsTest
    private static void send_video_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).video('https://example.com/video.mp4');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Video,
            null,
            'https://example.com/video.mp4',
            new ValueMap().set('size', 10000)
        );
    }

    @IsTest
    private static void send_videoWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).video('https://example.com/video.mp4', 'Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Video,
            'Hello world!',
            'https://example.com/video.mp4',
            new ValueMap().set('size', 10000)
        );
    }

    @IsTest
    private static void send_file_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).file('https://example.com/file.pdf');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.File,
            null,
            'https://example.com/file.pdf',
            new ValueMap().set('size', 10000).set('fileName', 'file.pdf')
        );
    }

    @IsTest
    private static void send_fileWithEmptyCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).file('https://example.com/file.pdf', '');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.File,
            null,
            'https://example.com/file.pdf',
            new ValueMap().set('size', 10000).set('fileName', 'file.pdf')
        );
    }

    @IsTest
    private static void send_fileWithDifferentFileName_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut()
            .send(fixture.chat.ExternalId__c)
            .file('https://example.com/file.pdf', new ViberSendFileOptions(null, 'new-file.pdf', null));
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.File,
            null,
            'https://example.com/file.pdf',
            new ValueMap().set('size', 10000).set('fileName', 'new-file.pdf')
        );
    }

    @IsTest
    private static void send_contact_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).contact('John Wick', '3168998280');
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
        fixture.sut().send(fixture.chat.ExternalId__c).location(lat, lon);
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
        fixture.sut().send(fixture.chat.ExternalId__c).sticker(12345);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Sticker, null, null, new ValueMap().set('stickerId', '12345'));
    }

    @IsTest
    private static void send_url_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).url('https://example.com/#some-topic');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Url, null, 'https://example.com/#some-topic', new ValueMap());
    }

    @IsTest
    private static void send_carousel_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        ViberSendKeyboardOptions.ButtonInternalBrowser internalBrowserConfig = new ViberSendKeyboardOptions.ButtonInternalBrowser()
            .setActionButton('none', null, null)
            .setTitle('default')
            .setTitle('Some cool browser page!')
            .setMode('fullscreen')
            .withFooter(true);

        ViberSendKeyboardOptions.ButtonMediaPlayer buttonMediaPlayerConfig = new ViberSendKeyboardOptions.ButtonMediaPlayer(
            'Cool player!',
            'I\'m telling you!',
            null,
            null
        );

        ViberSendKeyboardOptions.FavoritesMetadata favorites = new ViberSendKeyboardOptions.FavoritesMetadata(
                'link',
                'https://example.com/images/1'
            )
            .setTitle('Nice picture!')
            .setDomain('https://example.com')
            .setThumbnail(null, null, null)
            .setAlternativeContent(
                'Unfortunately you can not see it, follow the link',
                'https://example.com/alternative-url'
            );

        ViberSendKeyboardOptions carouselOptions = new ViberSendKeyboardOptions()
            .setLayout(7, 6)
            .setBackgroundColor('#242240')
            .setHeight(null, null, true)
            .setInputFieldState('hidden')
            .allowSaveToFavorites(favorites)
            .addButton(
                new ViberSendKeyboardOptions.Button()
                    .asOpenUrl('https://www.google.com')
                    .setBackgroundColor('#BDCCFF')
                    .setLayout(7, 6)
            )
            .addButton(
                new ViberSendKeyboardOptions.Button()
                    .asOpenUrl('https://www.google.com', 'video', buttonMediaPlayerConfig, internalBrowserConfig)
                    .setBackgroundColor('#BDCCFF')
                    .setLayout(7, 6)
                    .setImage('https://example.com/images/1')
            )
            .addButton(
                new ViberSendKeyboardOptions.Button()
                    .asOpenMap(12.22, 120.55)
                    .setBackgroundMedia('https://example.com/images/2', 'fill', false, false)
                    .setLayout(7, 6)
                    .setText('Open Map!')
            )
            .addButton(
                new ViberSendKeyboardOptions.Button()
                    .asReply('Value!', 'Some text')
                    .setLayout(7, 6)
                    .setTextStyle(null, 'large', null, null)
                    .setBorders(2, 15, '#2398AB')
                    .useSilentMode(true)
            )
            .addButton(
                new ViberSendKeyboardOptions.Button()
                    .asReplyWithImage('Value!', 'https://example.com/images/3')
                    .setLayout(7, 6)
                    .setTextStyle(null, 'large', null, null)
            )
            .addButton(
                new ViberSendKeyboardOptions.Button()
                    .asNoActionButton('Some text, no action')
                    .setTextAlignment('middle', 'left')
                    .setTextPaddings(0, 10, 0, 10)
                    .setLayout(7, 6)
            );

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).carousel(carouselOptions);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Custom, null, null, carouselOptions);
    }

    @IsTest
    private static void sendBroadcast_text_shouldSendAndCreateMessageRecords() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        List<String> chatIds = new List<String> {
            fixture.chat.ExternalId__c,
            createChat(fixture.bot, 1).ExternalId__c,
            createChat(fixture.bot, 2).ExternalId__c
        };

        Test.startTest();
        fixture.sut().sendBroadcast(chatIds).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(chatIds.get(0), BotMessageType.Text, 'Hello world!', null, new ValueMap());
        fixture.assertMessageIsCreated(chatIds.get(1), BotMessageType.Text, 'Hello world!', null, new ValueMap());
        fixture.assertMessageIsCreated(chatIds.get(2), BotMessageType.Text, 'Hello world!', null, new ValueMap());
    }

    private class SenderFixture {
        public BotModel bot;
        public Chat__c chat;

        private SenderFixture() {
            this.bot = createBot();
            this.chat = createChat(bot, 0);
        }

        public ViberBotService sut() {
            return createService(bot);
        }

        public void assertMessageIsCreated(BotMessageType messageType, String text, String mediaUrl, ValueMap params) {
            assertMessageIsCreated(null, messageType, text, mediaUrl, params);
        }

        public void assertMessageIsCreated(
            String chatId,
            BotMessageType messageType,
            String text,
            String mediaUrl,
            ValueMap params
        ) {
            List<ChatMessage__c> messages = (List<ChatMessage__c>) Database.query(
                'SELECT Bot__c, User__c, Chat__c, Chat__r.ExternalId__c, ExternalId__c, Text__c, Type__c, MediaUrl__c, Parameters__c ' +
                    'FROM ChatMessage__c ' +
                    (chatId == null ? '' : 'WHERE Chat__r.ExternalId__c = \'' + chatId + '\'')
            );
            Assert.areEqual(1, messages.size());
            ChatMessage__c message = messages.get(0);
            Assert.areEqual(bot.id, message.Bot__c);
            Assert.areEqual(chatId == null ? chat.ExternalId__c : chatId, message.Chat__r.ExternalId__c);
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

    private static Chat__c createChat(BotModel bot, Integer index) {
        Chat__c chat = new Chat__c(
            Name = 'TestChat' + index,
            Bot__c = bot.id,
            ExternalId__c = (3214 + index) + ':' + bot.tokenHash.substring(0, 20)
        );
        insert chat;
        return chat;
    }

    private static ViberBotService createService(BotModel bot) {
        return (ViberBotService) new BotServiceFactory().createBotService(bot);
    }
}
