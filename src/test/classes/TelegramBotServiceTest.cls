@IsTest(isParallel = true)
private class TelegramBotServiceTest {
    private static final BotType BOT_TYPE = BotType.Telegram;

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

        fixture.assertMessageIsCreated(BotMessageType.Text, 'Hello world!', null, new BotJsonPayload());
    }

    @IsTest
    private static void send_textAsUrl_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).text('https://example.com/#some-topic');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Url,
            null,
            'https://example.com/#some-topic',
            new BotJsonPayload()
        );
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

        fixture.assertCalloutException(TelegramBotMethod.SendMessage, error, 500);
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
        TelegramSendKeyboardOptions expectedKeyboard = new TelegramSendKeyboardOptions()
            .addButton(new TelegramSendKeyboardOptions.Button('Share my contact ☎️').asContactRequest())
            .addButton(1, new TelegramSendKeyboardOptions.Button('Share my location 📍').asLocationRequest())
            .addButton(2, new TelegramSendKeyboardOptions.Button('I do not wanna share anything 😤'));

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withReplyKeyboard(replyButtons).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Text,
            'Hello world!',
            null,
            new BotJsonPayload().set('keyboard', expectedKeyboard)
        );
    }

    @IsTest
    private static void send_textWithTelegramReplyKeyboard_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendKeyboardOptions keyboard = new TelegramSendKeyboardOptions()
            .allowResizeKeyboard()
            .asPersistent()
            .asOneTimeKeyboard()
            .asSelective()
            .setInputPlaceholder('Select an answer instead of typing...')
            .addButton(new TelegramSendKeyboardOptions.Button('Share one of my contacts').asUserRequest())
            .addButton(1, new TelegramSendKeyboardOptions.Button('Share one of my chats').asChatRequest())
            .addButton(
                1,
                new TelegramSendKeyboardOptions.Button('Share one of my special chats')
                    .asChatRequest(
                        new TelegramSendKeyboardOptions.ButtonRequestChatConfigs()
                            .withChannels(true)
                            .withForums(false)
                            .withUsername(true)
                            .withCreated(false)
                            .withBot(true)
                            .withUserAdminRights(new List<String> { 'is_anonymous', 'can_manage_chat' })
                            .withBotAdminRights(new List<String> { 'is_anonymous', 'can_manage_chat' })
                    )
            )
            .addButton(2, new TelegramSendKeyboardOptions.Button('Create a pool').asPollRequest())
            .addButton(2, new TelegramSendKeyboardOptions.Button('Launch a game!').asWebAppLauncher('some-app-url'));

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withReplyKeyboard(keyboard).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Text,
            'Hello world!',
            null,
            new BotJsonPayload().set('keyboard', keyboard)
        );
    }

    @IsTest
    private static void send_textWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendTextOptions options = new TelegramSendTextOptions()
            .withThreadId(null)
            .withParseMode('HTML')
            .withoutNotification()
            .withProtectedContent()
            .withoutLinksPreview()
            .asReplyToMessage('some-message-id')
            .withMessageEntity(
                new TelegramSendMessageOptions.MessageEntity('text_mention', 23, 8).asUserMention('12312')
            );

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).text('Hello world! The user: userLink', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Text,
            'Hello world! The user: userLink',
            null,
            options.getJsonPayload()
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

        fixture.assertMessageIsCreated(
            BotMessageType.Image,
            null,
            'https://example.com/image.jpeg',
            new BotJsonPayload()
        );
    }

    @IsTest
    private static void send_imageWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).image('https://example.com/image.jpeg', 'Some caption');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Image,
            'Some caption',
            'https://example.com/image.jpeg',
            new BotJsonPayload().set('caption', 'Some caption')
        );
    }

    @IsTest
    private static void send_imageWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendImageOptions options = new TelegramSendImageOptions()
            .withThreadId(null)
            .withCaption('Some caption with url')
            .withSpoiler()
            .withParseMode('HTML')
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id')
            .withMessageEntity(new TelegramSendMessageOptions.MessageEntity('url', 18, 3).asUrl('https://example.com'));

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).image('https://example.com/image.jpeg', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Image,
            'Some caption with url',
            'https://example.com/image.jpeg',
            options.getJsonPayload()
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
            new BotJsonPayload()
        );
    }

    @IsTest
    private static void send_videoWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).video('https://example.com/video.mp4', 'Some caption');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Video,
            'Some caption',
            'https://example.com/video.mp4',
            new BotJsonPayload().set('caption', 'Some caption')
        );
    }

    @IsTest
    private static void send_videoWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendVideoOptions options = new TelegramSendVideoOptions()
            .withThreadId(null)
            .withThumbnail('https://example.com/thumbnail.jpg')
            .withCaption('Some caption with emoji')
            .withSpoiler()
            .withParseMode('HTML')
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id')
            .withDuration(10)
            .withLayout(400, 300)
            .withStreamingSupport()
            .withMessageEntity(
                new TelegramSendMessageOptions.MessageEntity('custom_emoji', 18, 5).asCustomEmoji('emoji-id')
            );

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).video('https://example.com/video.mp4', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Video,
            'Some caption with emoji',
            'https://example.com/video.mp4',
            options.getJsonPayload()
        );
    }

    @IsTest
    private static void send_videoNote_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).videoNote('some-video-id');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Video,
            null,
            null,
            new BotJsonPayload().set('videoNoteId', 'some-video-id')
        );
    }

    @IsTest
    private static void send_videoNoteWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendVideoNoteOptions options = new TelegramSendVideoNoteOptions()
            .withThreadId(null)
            .withThumbnail('https://example.com/thumbnail.jpg')
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id')
            .withDuration(10)
            .withSize(300);

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).videoNote('some-video-id', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Video,
            null,
            null,
            new BotJsonPayload(options).set('videoNoteId', 'some-video-id')
        );
    }

    @IsTest
    private static void send_animation_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).animation('https://example.com/mem.gif');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Animation,
            null,
            'https://example.com/mem.gif',
            new BotJsonPayload()
        );
    }

    @IsTest
    private static void send_animationWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).animation('https://example.com/mem.gif', 'Some caption');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Animation,
            'Some caption',
            'https://example.com/mem.gif',
            new BotJsonPayload().set('caption', 'Some caption')
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

        fixture.assertMessageIsCreated(BotMessageType.File, null, 'https://example.com/file.pdf', new BotJsonPayload());
    }

    @IsTest
    private static void send_fileWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).file('https://example.com/file.pdf', 'Some caption');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.File,
            'Some caption',
            'https://example.com/file.pdf',
            new BotJsonPayload().set('caption', 'Some caption')
        );
    }

    @IsTest
    private static void send_fileWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendFileOptions options = new TelegramSendFileOptions()
            .withThreadId(null)
            .withThumbnail('https://example.com/thumbnail.jpg')
            .withCaption('Some caption with Integer i = 0;')
            .withParseMode('HTML')
            .withoutNotification()
            .withProtectedContent()
            .withoutContentTypeDetection()
            .asReplyToMessage('some-message-id')
            .withMessageEntity(
                new TelegramSendMessageOptions.MessageEntity('pre', 18, 14).asProgrammingLanguage('java')
            );

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).file('https://example.com/file.pdf', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.File,
            'Some caption with Integer i = 0;',
            'https://example.com/file.pdf',
            options.getJsonPayload()
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
            new BotJsonPayload().set('name', 'John Wick').set('phone', '3168998280')
        );
    }

    @IsTest
    private static void send_contactWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendContactOptions options = new TelegramSendContactOptions()
            .withThreadId(null)
            .withVCard(
                'BEGIN:VCARD\nFN:Simon Perreault\nN:Perreault;Simon;;;ing. jr,M.Sc.\nBDAY:--0203\nGENDER:M\nEMAIL;TYPE=work:simon.perreault@viagenie.ca\nEND:VCARD'
            )
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id');

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).contact('John Wick', '3168998280', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Contact,
            null,
            null,
            new BotJsonPayload(options).set('name', 'John Wick').set('phone', '3168998280')
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
            new BotJsonPayload().set('lat', lat).set('lon', lon)
        );
    }

    @IsTest
    private static void send_locationWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        Decimal lat = 38.9228;
        Decimal lon = 96.1232;
        SenderFixture fixture = new SenderFixture();
        TelegramSendLocationOptions options = new TelegramSendLocationOptions()
            .withThreadId(null)
            .withHorizontalAccuracy(100.5)
            .withLivePeriod(100)
            .withProximityAlertRadius(10)
            .withHeading(10)
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id');

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).location(lat, lon, options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Location,
            null,
            null,
            new BotJsonPayload(options).set('lat', lat).set('lon', lon)
        );
    }

    @IsTest
    private static void send_venue_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        String title = 'Party!';
        String address = 'Collingwood 122';
        Decimal lat = 38.9228;
        Decimal lon = 96.1232;
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).venue(title, address, lat, lon);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Venue,
            title,
            null,
            new BotJsonPayload().set('title', title).set('address', address).set('lat', lat).set('lon', lon)
        );
    }

    @IsTest
    private static void send_venueWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        String title = 'Party!';
        String address = 'Collingwood 122';
        Decimal lat = 38.9228;
        Decimal lon = 96.1232;
        SenderFixture fixture = new SenderFixture();
        TelegramSendVenueOptions options = new TelegramSendVenueOptions()
            .withThreadId(null)
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id')
            .asFoursquarePlace('some-id', 'arts_entertainment/aquarium')
            .asGooglePlace(null, null);

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).venue(title, address, lat, lon, options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Venue,
            title,
            null,
            new BotJsonPayload(options).set('title', title).set('address', address).set('lat', lat).set('lon', lon)
        );
    }

    @IsTest
    private static void send_stickerAsId_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).sticker('some-long-sticker-id');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Sticker,
            null,
            null,
            new BotJsonPayload().set('stickerId', 'some-long-sticker-id')
        );
    }

    @IsTest
    private static void send_stickerAsUrl_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).sticker('http://example.com/some-sticker-url');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Sticker,
            null,
            'http://example.com/some-sticker-url',
            new BotJsonPayload()
        );
    }

    @IsTest
    private static void send_stickerWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendStickerOptions options = new TelegramSendStickerOptions()
            .withThreadId(null)
            .asEmoji('😀')
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id');

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).sticker('some-long-sticker-id', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Sticker,
            null,
            null,
            new BotJsonPayload(options).set('stickerId', 'some-long-sticker-id')
        );
    }

    @IsTest
    private static void send_audio_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).audio('https://examlple.com/audio.mp3');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Audio,
            null,
            'https://examlple.com/audio.mp3',
            new BotJsonPayload()
        );
    }

    @IsTest
    private static void send_audioWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).audio('https://examlple.com/audio.mp3', 'Hello World!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Audio,
            'Hello World!',
            'https://examlple.com/audio.mp3',
            new BotJsonPayload().set('caption', 'Hello World!')
        );
    }

    @IsTest
    private static void send_audioWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendAudioOptions options = new TelegramSendAudioOptions()
            .withThreadId(null)
            .withTrackName('Arctic Monkeys', 'Do I Wanna Know?')
            .withThumbnail('https://example.com/thumbnail.jpg')
            .withCaption('Some caption')
            .withParseMode(null)
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('some-message-id')
            .withDuration(210)
            .withMessageEntity(new TelegramSendMessageOptions.MessageEntity('italic', 0, 23));

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).audio('https://examlple.com/audio.mp3', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Audio,
            'Some caption',
            'https://examlple.com/audio.mp3',
            options.getJsonPayload()
        );
    }

    @IsTest
    private static void send_voice_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).audio('https://examlple.com/audio.ogg');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Audio,
            null,
            'https://examlple.com/audio.ogg',
            new BotJsonPayload()
        );
    }

    @IsTest
    private static void send_voiceWithCaption_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).audio('https://examlple.com/audio.ogg', 'Hello World!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Audio,
            'Hello World!',
            'https://examlple.com/audio.ogg',
            new BotJsonPayload().set('caption', 'Hello World!')
        );
    }

    @IsTest
    private static void send_poll_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        List<String> answers = new List<String> { 'Answer1?', 'Answer2?', 'Answer3?' };

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).poll('question?', answers);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Poll,
            'question?',
            null,
            new BotJsonPayload().set('options', answers)
        );
    }

    @IsTest
    private static void send_pollWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendPollOptions options = new TelegramSendPollOptions()
            .withAnswer('answer1')
            .withAnswer('answer2')
            .withAnswer('answer3')
            .allowMultipleAnswers()
            .asAnonymous()
            .asQuiz(1, 'I <b>dont</b> care what you choose')
            .withExplanationParseMode('HTML')
            .withExplanationMessageEntity(new TelegramSendMessageOptions.MessageEntity('italic', 14, 4))
            .withOpenPeriod(null)
            .withCloseDate(DateTime.now().addSeconds(100))
            .asClosed()
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('reply-message-id')
            .withThreadId(null);

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).poll('question?', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Poll, 'question?', null, options.getJsonPayload());
    }

    @IsTest
    private static void send_dice_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).dice();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Other, null, null, new BotJsonPayload());
    }

    @IsTest
    private static void send_diceWithOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramSendDiceOptions options = new TelegramSendDiceOptions()
            .withEmoji('🎲')
            .withoutNotification()
            .withProtectedContent()
            .asReplyToMessage('reply-message-id')
            .withThreadId(null);

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).dice(options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(BotMessageType.Other, null, null, options.getJsonPayload());
    }

    @IsTest
    private static void send_chatAction_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).chatAction('typing');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsNotCreated();
    }

    private class SenderFixture {
        public BotModel bot;
        public Chat__c chat;

        private SenderFixture() {
            this.bot = createBot();
            this.chat = createChat(bot);
        }

        public TelegramBotService sut() {
            return createService(bot);
        }

        public void assertMessageIsCreated(
            BotMessageType messageType,
            String text,
            String mediaUrl,
            BotJsonPayload params
        ) {
            assertMessageIsCreated(null, messageType, text, mediaUrl, params);
        }

        public void assertMessageIsCreated(
            String chatId,
            BotMessageType messageType,
            String text,
            String mediaUrl,
            BotJsonPayload params
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

        public void assertMessageIsNotCreated() {
            List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];
            Assert.isTrue(messages.isEmpty());
        }

        public void assertCalloutException(TelegramBotMethod method, Exception error, Integer statusCode) {
            Assert.isNotNull(error);
            Assert.isInstanceOfType(error, BotCalloutService.BotCalloutException.class);

            BotCustomException customException = (BotCustomException) error;
            Assert.isTrue(customException.payload.has('request'));

            BotJsonPayload requestPayload = customException.payload.getJsonPayload('request');
            Assert.areEqual(bot.id, requestPayload.getString('botId'));
            Assert.areEqual(method.name(), requestPayload.getString('botMethod'));

            Assert.isTrue(customException.payload.has('response'));
            Assert.areEqual(statusCode, customException.payload.getJsonPayload('response').getInteger('statusCode'));
        }
    }

    private static BotCalloutMock setCalloutMock() {
        BotCalloutMock mock = new TelegramBotCalloutMock();
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

    private static TelegramBotService createService(BotModel bot) {
        return (TelegramBotService) new BotServiceFactory().createBotService(bot);
    }
}
