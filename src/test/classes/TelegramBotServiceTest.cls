@IsTest(isParallel = true)
private class TelegramBotServiceTest {
    private static final BotType BOT_TYPE = BotType.Telegram;

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
        TelegramReplyKeyboardMarkupOptions expectedKeyboard = new TelegramReplyKeyboardMarkupOptions()
            .addButton(new TelegramReplyKeyboardMarkupOptions.Button('Share my contact ☎️').asContactRequest())
            .addButton(1, new TelegramReplyKeyboardMarkupOptions.Button('Share my location 📍').asLocationRequest())
            .addButton(2, new TelegramReplyKeyboardMarkupOptions.Button('I do not wanna share anything 😤'));

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
        TelegramReplyKeyboardMarkupOptions keyboard = new TelegramReplyKeyboardMarkupOptions()
            .allowResizeKeyboard()
            .asPersistent()
            .asOneTimeKeyboard()
            .asSelective()
            .setInputPlaceholder('Select an answer instead of typing...')
            .addButton(new TelegramReplyKeyboardMarkupOptions.Button('Share one of my contacts').asUserRequest())
            .addButton(1, new TelegramReplyKeyboardMarkupOptions.Button('Share one of my chats').asChatRequest())
            .addButton(
                1,
                new TelegramReplyKeyboardMarkupOptions.Button('Share one of my special chats')
                    .asChatRequest(
                        new TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs()
                            .withChannels(true)
                            .withForums(false)
                            .withUsername(true)
                            .withCreated(false)
                            .withBot(true)
                            .withUserAdminRights(new List<String> { 'is_anonymous', 'can_manage_chat' })
                            .withBotAdminRights(new List<String> { 'is_anonymous', 'can_manage_chat' })
                    )
            )
            .addButton(2, new TelegramReplyKeyboardMarkupOptions.Button('Create a pool').asPollRequest())
            .addButton(
                2,
                new TelegramReplyKeyboardMarkupOptions.Button('Launch a game!').asWebAppLauncher('some-app-url')
            );

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withReplyKeyboard(keyboard).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual(3, keyboard.buttons.size());
        Assert.areEqual(1, keyboard.buttons.get(0).size());
        Assert.areEqual(2, keyboard.buttons.get(1).size());
        Assert.areEqual(2, keyboard.buttons.get(2).size());

        fixture.assertMessageIsCreated(
            BotMessageType.Text,
            'Hello world!',
            null,
            new BotJsonPayload().set('keyboard', keyboard)
        );
    }

    @IsTest
    private static void send_textWithReplyKeyboardRemoved_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramReplyKeyboardRemoveOptions expectedKeyboard = new TelegramReplyKeyboardRemoveOptions();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withReplyKeyboardRemoved().text('Hello world!');
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
    private static void send_textWithReplyKeyboardRemovedOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramReplyKeyboardRemoveOptions keyboardRemovedOptions = new TelegramReplyKeyboardRemoveOptions()
            .asSelective();

        Test.startTest();
        fixture.sut()
            .send(fixture.chat.ExternalId__c)
            .withReplyKeyboardRemoved(keyboardRemovedOptions)
            .text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Text,
            'Hello world!',
            null,
            new BotJsonPayload().set('keyboard', keyboardRemovedOptions)
        );
    }

    @IsTest
    private static void send_textWithForceReply_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramForceReplyOptions expectedKeyboard = new TelegramForceReplyOptions();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withForceReply().text('Hello world!');
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
    private static void send_textWithForceReplyOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramForceReplyOptions forceReplyOptions = new TelegramForceReplyOptions()
            .setInputPlaceholder('Reply with something...')
            .asSelective();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withForceReply(forceReplyOptions).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertMessageIsCreated(
            BotMessageType.Text,
            'Hello world!',
            null,
            new BotJsonPayload().set('keyboard', forceReplyOptions)
        );
    }

    @IsTest
    private static void send_textWithInlineKeyboard_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramInlineKeyboardMarkupOptions.Button button1 = new TelegramInlineKeyboardMarkupOptions.Button('Hello!')
            .withCallbackData('hello');

        TelegramInlineKeyboardMarkupOptions.Button button2 = new TelegramInlineKeyboardMarkupOptions.Button('World!')
            .asUrl('https://example.com');

        TelegramInlineKeyboardMarkupOptions.Button button3 = new TelegramInlineKeyboardMarkupOptions.Button('Launch')
            .asWebAppLauncher('https://example.com/app');

        TelegramInlineKeyboardMarkupOptions.Button button4 = new TelegramInlineKeyboardMarkupOptions.Button('Login')
            .asLoginUrl(
                new TelegramInlineKeyboardMarkupOptions.LoginConfigs('https://example.com/login')
                    .withForwardText('This is secret!')
                    .withAuthorizationBot('SalesforceIntegratorVictor')
                    .withWriteAccess()
            );

        TelegramInlineKeyboardMarkupOptions.Button button5 = new TelegramInlineKeyboardMarkupOptions.Button(
                'Switch chat'
            )
            .asSwitchInlineQuery('some new query')
            .asSwitchInlineQueryCurrentChat('some query in the current chat')
            .asSwitchInlineQueryChosenChat(
                new TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs('some query in another chat')
                    .withUserChats()
                    .withBotChats()
                    .withGroupChats()
                    .withChannelChats()
            );

        TelegramInlineKeyboardMarkupOptions keyboard = new TelegramInlineKeyboardMarkupOptions()
            .addButton(button1)
            .addButton(button2)
            .addButton(button3)
            .addButton(1, button4)
            .addButton(1, button5);

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).withInlineKeyboard(keyboard).text('Hello world!');
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual(2, keyboard.buttons.size());
        Assert.areEqual(3, keyboard.buttons.get(0).size());
        Assert.areEqual(2, keyboard.buttons.get(1).size());

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
            .withMessageEntity(new TelegramMessageEntity('text_mention', 23, 8).asUserMention('12312'));

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
            .withMessageEntity(new TelegramMessageEntity('url', 18, 3).asUrl('https://example.com'));

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
            .withMessageEntity(new TelegramMessageEntity('custom_emoji', 18, 5).asCustomEmoji('emoji-id'));

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
            .withMessageEntity(new TelegramMessageEntity('pre', 18, 14).asProgrammingLanguage('java'));

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
                'BEGIN:VCARD\nFN:Simon Perrault\nN:Perrault;Simon;;;ing. jr,M.Sc.\nBDAY:--0203\nGENDER:M\nEMAIL;TYPE=work:simon.perreault@viagenie.ca\nEND:VCARD'
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
            .withMessageEntity(new TelegramMessageEntity('italic', 0, 23));

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
        fixture.sut().send(fixture.chat.ExternalId__c).voice('https://examlple.com/audio.ogg');
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
        fixture.sut().send(fixture.chat.ExternalId__c).voice('https://examlple.com/audio.ogg', 'Hello World!');
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
            .withExplanationMessageEntity(new TelegramMessageEntity('italic', 14, 4))
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
    private static void forward_withoutOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).forward(fixture.chat.ExternalId__c, '1234');
        Test.getEventBus().deliver();
        Test.stopTest();

        BotJsonPayload expectedOptions = new BotJsonPayload()
            .set('from_chat_id', fixture.chat.ExternalId__c)
            .set('message_id', '1234')
            .set('type', 'Forward');

        fixture.assertMessageIsCreated(BotMessageType.Other, null, null, expectedOptions);
    }

    @IsTest
    private static void forward_withOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramForwardOptions options = new TelegramForwardOptions()
            .withoutNotification()
            .withProtectedContent()
            .withThreadId(null);

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).forward(fixture.chat.ExternalId__c, '1234', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        BotJsonPayload expectedOptions = new BotJsonPayload(options)
            .set('from_chat_id', fixture.chat.ExternalId__c)
            .set('message_id', '1234')
            .set('type', 'Forward');

        fixture.assertMessageIsCreated(BotMessageType.Other, null, null, expectedOptions);
    }

    @IsTest
    private static void copy_withoutOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).copy(fixture.chat.ExternalId__c, '1234');
        Test.getEventBus().deliver();
        Test.stopTest();

        BotJsonPayload expectedOptions = new BotJsonPayload()
            .set('from_chat_id', fixture.chat.ExternalId__c)
            .set('message_id', '1234')
            .set('type', 'Copy');

        fixture.assertMessageIsCreated(BotMessageType.Other, null, null, expectedOptions);
    }

    @IsTest
    private static void copy_withOptions_shouldSendAndCreateMessageRecord() {
        setCalloutMock();
        SenderFixture fixture = new SenderFixture();
        TelegramCopyOptions options = new TelegramCopyOptions()
            .withCaption('Caption')
            .withParseMode('HTML')
            .withMessageEntity(null)
            .asReplyToMessage(null)
            .withoutNotification()
            .withProtectedContent()
            .withThreadId(null);

        Test.startTest();
        fixture.sut().send(fixture.chat.ExternalId__c).copy(fixture.chat.ExternalId__c, '1234', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        BotJsonPayload expectedOptions = new BotJsonPayload(options)
            .set('from_chat_id', fixture.chat.ExternalId__c)
            .set('message_id', '1234')
            .set('type', 'Copy');

        fixture.assertMessageIsCreated(BotMessageType.Other, null, null, expectedOptions);
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

    @IsTest
    private static void edit_text_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).text('Altered');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_textWithInlineKeyboard_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramInlineKeyboardMarkupOptions keyboard = new TelegramInlineKeyboardMarkupOptions()
            .addButton(new TelegramInlineKeyboardMarkupOptions.Button('Test').withCallbackData('result1'));

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).withInlineKeyboard(keyboard).text('Altered');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_textWithOptions_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramEditTextOptions options = new TelegramEditTextOptions()
            .withParseMode('HTML')
            .withMessageEntity(null)
            .withoutLinksPreview();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).text('Altered', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_caption_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).caption('Altered');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_captionWithOptions_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramEditCaptionOptions options = new TelegramEditCaptionOptions()
            .withParseMode('HTML')
            .withMessageEntity(null);

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).caption('Altered', options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_mediaWithPhoto_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramInputMedia media = new TelegramInputMediaPhoto('http://example.com/pic.jpg')
            .withCaption('Caption...')
            .withParseMode('HTML')
            .withMessageEntity(null)
            .withSpoiler();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).media(media);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_mediaWithVideo_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramInputMedia media = new TelegramInputMediaVideo('http://example.com/vid.mp4')
            .withThumbnail('http://example.com/pic.jpg')
            .withCaption('Caption...')
            .withParseMode('HTML')
            .withMessageEntity(null)
            .withDuration(10)
            .withLayout(200, 300)
            .withStreamingSupport()
            .withSpoiler();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).media(media);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_mediaWithAnimation_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramInputMedia media = new TelegramInputMediaAnimation('http://example.com/vid.mp4')
            .withThumbnail('http://example.com/pic.jpg')
            .withCaption('Caption...')
            .withParseMode('HTML')
            .withMessageEntity(null)
            .withDuration(10)
            .withLayout(200, 300)
            .withSpoiler();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).media(media);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_mediaWithAudio_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramInputMedia media = new TelegramInputMediaAudio('http://example.com/aud.mp3')
            .withThumbnail('http://example.com/pic.jpg')
            .withCaption('Caption...')
            .withParseMode('HTML')
            .withMessageEntity(null)
            .withDuration(10)
            .withTitle('Some title')
            .withPerformer('Bruce Lee');

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).media(media);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_mediaWithDocument_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramInputMedia media = new TelegramInputMediaDocument('http://example.com/doc.pdf')
            .withThumbnail('http://example.com/pic.jpg')
            .withCaption('Caption...')
            .withParseMode('HTML')
            .withMessageEntity(null)
            .withoutContentTypeDetection();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).media(media);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_liveLocation_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).liveLocation(12.4321, 43.9999);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_liveLocationWithOptions_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramEditLiveLocationOptions options = new TelegramEditLiveLocationOptions()
            .withHorizontalAccuracy(10.2)
            .withProximityAlertRadius(100)
            .withHeading(100);

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).liveLocation(12.4321, 43.9999, options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_stopLiveLocation_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).stopLiveLocation();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_inlineKeyboard_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();
        TelegramInlineKeyboardMarkupOptions keyboard = new TelegramInlineKeyboardMarkupOptions()
            .addButton(new TelegramInlineKeyboardMarkupOptions.Button('Test').withCallbackData('result1'));

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).inlineKeyboard(keyboard);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_stopPoll_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).stopPoll();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void edit_deleteMessage_shouldSendCallout() {
        setCalloutMock();
        EditorFixture fixture = new EditorFixture();

        Test.startTest();
        fixture.sut().edit(fixture.chatId, fixture.messageId).deleteMessage();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_get_shouldReturnChat() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        TelegramChat chat = fixture.sut().chat(externalChatId).get();
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual(Integer.valueOf(externalChatId), chat.id);
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_getAdministrators_shouldReturnAdmins() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        List<TelegramChatMemberAdmin> admins = fixture.sut().chat(externalChatId).getAdministrators();
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual(1, admins.size());
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_leave_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).leave();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_getMembersCount_shouldGetChatMembersCount() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        Integer members = fixture.sut().chat(externalChatId).getMembersCount();
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual(3, members);
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_setPermissions_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);
        TelegramChatPermissions permissions = new TelegramChatPermissions()
            .allowSendMessages(true)
            .allowSendAudios(true)
            .allowSendDocuments(true)
            .allowSendPhotos(true)
            .allowSendVideos(true)
            .allowSendVideoNotes(true)
            .allowSendVoiceNotes(true)
            .allowSendPolls(true)
            .allowSendOtherMessages(true)
            .allowAddWebPagePreviews(true)
            .allowChangeInfo(true)
            .allowInviteUsers(true)
            .allowPinMessages(true)
            .allowManageTopics(true);

        Test.startTest();
        fixture.sut().chat(externalChatId).setPermissions(permissions);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_setPhoto_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).setPhoto('photo_unique_tg_id');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_deletePhoto_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).deletePhoto();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_setTitle_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).setTitle('Some new title');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_setDescription_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).setDescription('Some new description');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_pinMessage_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).pinMessage('123124');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_unpinMessage_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).unpinMessage();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_unpinAllMessages_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).unpinAllMessages();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_setStickerSet_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).setStickerSet('sticker_set_name');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_deleteStickerSet_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).deleteStickerSet();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_inviteLink_export_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        String inviteLink = fixture.sut().chat(externalChatId).inviteLink().export();
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual('https://tg.com/invite/1231', inviteLink);
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_inviteLink_create_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        TelegramChatInviteLink inviteLink = fixture.sut().chat(externalChatId).inviteLink().create();
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual('https://tg.com/invite/1231', inviteLink.inviteLink);
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_inviteLink_createWithOptions_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);
        TelegramBotChatInviteLinkService.LinkOptions options = new TelegramBotChatInviteLinkService.LinkOptions('test')
            .withExpireDate(Date.today().addMonths(1))
            .withMemberLimit(null)
            .withRequestApproval();

        Test.startTest();
        TelegramChatInviteLink inviteLink = fixture.sut().chat(externalChatId).inviteLink().create(options);
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual('https://tg.com/invite/1231', inviteLink.inviteLink);
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_inviteLink_edit_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        TelegramChatInviteLink inviteLink = fixture.sut().chat(externalChatId).inviteLink().edit('test');
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.areEqual('https://tg.com/invite/1231', inviteLink.inviteLink);
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_inviteLink_revoke_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).inviteLink().revoke('https://tg.com/invite/1231');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_joinRequest_approve_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).joinRequest('1231231').approve();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_joinRequest_decline_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).joinRequest('1231231').decline();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_member_get_shouldSendCalloutAndReturnChatMember() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        TelegramChatMember member = fixture.sut().chat(externalChatId).member('1231231').get();
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.isInstanceOfType(member, TelegramChatMemberRestricted.class);
        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_member_ban_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).member('1231231').ban();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_member_unban_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).member('1231231').unban();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_member_restrict_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);
        TelegramChatPermissions permissions = new TelegramChatPermissions().allowManageTopics(false);

        Test.startTest();
        fixture.sut().chat(externalChatId).member('1231231').restrict(permissions);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_member_promote_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);
        TelegramPromoteChatMemberOptions options = new TelegramPromoteChatMemberOptions()
            .asAnonymous(true)
            .allowManageChat(true)
            .allowPostMessages(true)
            .allowEditMessages(true)
            .allowDeleteMessages(true)
            .allowManageVideoChats(true)
            .allowRestrictMembers(true)
            .allowPromoteMembers(true)
            .allowChangeInfo(true)
            .allowInviteUsers(true)
            .allowPinMessages(true)
            .allowManageTopics(false);

        Test.startTest();
        fixture.sut().chat(externalChatId).member('1231231').promote(options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void chat_member_setCustomTitle_shouldSendCallout() {
        setCalloutMock();
        ChatFixture fixture = new ChatFixture();
        String externalChatId = BotUtils.parseExternalId(fixture.chat.ExternalId__c);

        Test.startTest();
        fixture.sut().chat(externalChatId).member('1231231').setCustomTitle('The king');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withOptionsAndArticleResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        TelegramInputTextMessageContent message = new TelegramInputTextMessageContent('Message!')
            .withMessageEntity(null)
            .withParseMode('HTML')
            .disableWebPagePreview();

        TelegramInlineQueryResultArticle article1 = new TelegramInlineQueryResultArticle('art1')
            .withTitle('title')
            .withUrl('https://example.com')
            .withDescription('Description...')
            .withThumbnail('https://example.com/th.png')
            .withInputMessage(message)
            .withInlineKeyboard(null);

        TelegramAnswerInlineQueryOptions options = new TelegramAnswerInlineQueryOptions()
            .addResult(article1)
            .asPersonal()
            .withCacheTime(300)
            .withNextOffset(null)
            .withButton(new TelegramAnswerInlineQueryOptions.Button('Test').withStartParameter('test'));

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(options);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withAudioResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        TelegramInputContactMessageContent contact = new TelegramInputContactMessageContent('Ilya', '0627362273')
            .withLastName('Mister')
            .withVCard('No idea what this is');

        List<TelegramInlineQueryResultAudio> results = new List<TelegramInlineQueryResultAudio> {
            new TelegramInlineQueryResultAudio('1', 'https://example.com/audio.mp3')
                .withTitle('title')
                .withCaption('caption')
                .withPerformer('Mc POH')
                .withDuration(5)
                .withMessageEntity(null)
                .withParseMode('HTML')
                .withInputMessage(contact)
                .withInlineKeyboard(null),
            new TelegramInlineQueryResultAudio('2', 'some-file-id')
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withContactResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        TelegramInputLocationMessageContent location = new TelegramInputLocationMessageContent(10.2122, 19.4322)
            .withHorizontalAccuracy(1500)
            .withLivePeriod(80000)
            .withProximityAlertRadius(10000)
            .withHeading(180);

        List<TelegramInlineQueryResultContact> results = new List<TelegramInlineQueryResultContact> {
            new TelegramInlineQueryResultContact('1', 'Ilya', '0627362273')
                .withLastName('Mister')
                .withVCard('No idea what this is')
                .withThumbnail(null, null, null)
                .withInputMessage(location)
                .withInlineKeyboard(null)
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withDocumentResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        TelegramInputVenueMessageContent venue = new TelegramInputVenueMessageContent(10.2122, 19.4322)
            .withTitle('Party')
            .withAddress('USSR st. 69')
            .withFoursquare('123', 'arts_entertainment')
            .withGooglePlaces('321', 'aquarium');

        List<TelegramInlineQueryResultDocument> results = new List<TelegramInlineQueryResultDocument> {
            new TelegramInlineQueryResultDocument('1', 'https://example.com/doc1.pdf')
                .withTitle('Title')
                .withCaption('Caption')
                .withDescription('Caption!')
                .withMimeType('application/pdf')
                .withParseMode('HTML')
                .withThumbnail(null, null, null)
                .withMessageEntity(null)
                .withInputMessage(venue)
                .withInlineKeyboard(null),
            new TelegramInlineQueryResultDocument('2', 'some-file-id')
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withGifResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        List<TelegramInlineQueryResultGif> results = new List<TelegramInlineQueryResultGif> {
            new TelegramInlineQueryResultGif('1', 'https://example.com/gif1.gif')
                .withTitle('Title')
                .withCaption('Caption')
                .withDuration(6)
                .withSizes(200, 400)
                .withThumbnail(null, null)
                .withParseMode('HTML')
                .withMessageEntity(null)
                .withInputMessage(null)
                .withInlineKeyboard(null),
            new TelegramInlineQueryResultGif('2', 'some-file-id')
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withLocationResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        List<TelegramInlineQueryResultLocation> results = new List<TelegramInlineQueryResultLocation> {
            new TelegramInlineQueryResultLocation('1', 15.3223, 89.1232)
                .withTitle('Title')
                .withHorizontalAccuracy(1500)
                .withLivePeriod(80000)
                .withProximityAlertRadius(10000)
                .withHeading(180)
                .withThumbnail(null, null, null)
                .withInputMessage(null)
                .withInlineKeyboard(null)
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withPhotoResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        List<TelegramInlineQueryResultPhoto> results = new List<TelegramInlineQueryResultPhoto> {
            new TelegramInlineQueryResultPhoto('1', 'https://example.com/photo1.png')
                .withTitle('Title')
                .withDescription('Description...')
                .withCaption('Caption')
                .withSizes(200, 400)
                .withParseMode('HTML')
                .withMessageEntity(null)
                .withThumbnail(null)
                .withInputMessage(null)
                .withInlineKeyboard(null),
            new TelegramInlineQueryResultPhoto('2', 'some-file-id')
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withStickerResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        List<TelegramInlineQueryResultSticker> results = new List<TelegramInlineQueryResultSticker> {
            new TelegramInlineQueryResultSticker('1', 'some-file-id').withInputMessage(null).withInlineKeyboard(null)
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withVenueResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        List<TelegramInlineQueryResultVenue> results = new List<TelegramInlineQueryResultVenue> {
            new TelegramInlineQueryResultVenue('1', 15.3223, 89.1232)
                .withTitle('Title')
                .withAddress('USSR st. 69')
                .withFoursquare('123', 'arts_entertainment')
                .withGooglePlaces('321', 'aquarium')
                .withThumbnail(null, null, null)
                .withInputMessage(null)
                .withInlineKeyboard(null)
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withVideoResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        List<TelegramInlineQueryResultVideo> results = new List<TelegramInlineQueryResultVideo> {
            new TelegramInlineQueryResultVideo('1', 'https://example.com/video1.mp4')
                .withTitle('Title')
                .withDescription('Some video')
                .withCaption('Caption')
                .withMimeType('video/mp4')
                .withThumbnail(null)
                .withSizes(200, 400)
                .withDuration(10)
                .withParseMode('HTML')
                .withMessageEntity(null)
                .withInputMessage(null)
                .withInlineKeyboard(null),
            new TelegramInlineQueryResultVideo('2', 'some-file-id')
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void inlineQuery_answer_withVoiceResults_shouldSendCallout() {
        setCalloutMock();
        InlineQueryFixture fixture = new InlineQueryFixture();
        List<TelegramInlineQueryResultVoice> results = new List<TelegramInlineQueryResultVoice> {
            new TelegramInlineQueryResultVoice('1', 'https://example.com/voice.mp3')
                .withTitle('Title')
                .withCaption('Caption')
                .withDuration(10)
                .withParseMode('HTML')
                .withMessageEntity(null)
                .withInputMessage(null)
                .withInlineKeyboard(null),
            new TelegramInlineQueryResultVoice('2', 'some-file-id')
        };

        Test.startTest();
        fixture.sut().inlineQuery(fixture.inlineQueryId).answer(results);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void me_get_shouldSendAndReturnBotDetails() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        TelegramUser botDetails = fixture.sut().me().get();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
        Assert.isTrue(botDetails.isBot);
    }

    @IsTest
    private static void me_getName_shouldSendAndReturnBotName() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        String botName = fixture.sut().me().getName();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
        Assert.areEqual('Test Bot', botName);
    }

    @IsTest
    private static void me_getDescription_shouldSendAndReturnBotDescription() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        String botDescription = fixture.sut().me().getDescription();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
        Assert.areEqual('Some test description', botDescription);
    }

    @IsTest
    private static void me_getShortDescription_shouldSendAndReturnBotShortDescription() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        String botDescription = fixture.sut().me().getShortDescription();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
        Assert.areEqual('Some short test description', botDescription);
    }

    @IsTest
    private static void me_getDefaultAdminRights_shouldSendAndReturnBotDefaultChatAdminRights() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        TelegramChatAdministratorRights botRights = fixture.sut().me().getDefaultAdminRights();
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
        Assert.isNull(botRights.isAnonymous);
        Assert.isNull(botRights.canManageChat);
        Assert.isNull(botRights.canDeleteMessages);
        Assert.isNull(botRights.canManageVideoChats);
        Assert.isNull(botRights.canRestrictMembers);
        Assert.isNull(botRights.canPromoteMembers);
        Assert.isNull(botRights.canChangeInfo);
        Assert.isNull(botRights.canInviteUsers);
        Assert.isNull(botRights.canPostMessages);
        Assert.isNull(botRights.canEditMessages);
        Assert.isNull(botRights.canPinMessages);
        Assert.isNull(botRights.canManageTopics);
    }

    @IsTest
    private static void me_setName_shouldSendAndSetBotName() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        fixture.sut().me().setName('New name');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void me_setDescription_shouldSendAndSetBotDescription() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        fixture.sut().me().setDescription('New description');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void me_setShortDescription_shouldSendAndSetBotShortDescription() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();

        Test.startTest();
        fixture.sut().me().setShortDescription('New short description');
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
    }

    @IsTest
    private static void me_setDefaultAdminRights_shouldSendAndReturnBotDefaultChatAdminRights() {
        setCalloutMock();
        MeFixture fixture = new MeFixture();
        TelegramChatAdministratorRights botRights = new TelegramChatAdministratorRights()
            .asAnonymous(true)
            .allowManageChat(false)
            .allowPostMessages(false)
            .allowEditMessages(false)
            .allowDeleteMessages(false)
            .allowManageVideoChats(false)
            .allowRestrictMembers(false)
            .allowPromoteMembers(false)
            .allowChangeInfo(false)
            .allowInviteUsers(false)
            .allowPinMessages(false)
            .allowManageTopics(false);

        Test.startTest();
        fixture.sut().me().setDefaultAdminRights(botRights);
        Test.getEventBus().deliver();
        Test.stopTest();

        fixture.assertErrorIsNotCreated();
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

    private class EditorFixture {
        public BotModel bot;
        public String chatId;
        public String messageId;

        private EditorFixture() {
            this.bot = createBot();
            this.chatId = '41241241';
            this.messageId = '1234';
        }

        public TelegramBotService sut() {
            return createService(bot);
        }

        public void assertErrorIsNotCreated() {
            List<BotError__c> errors = [SELECT Id FROM BotError__c];
            Assert.isTrue(errors.isEmpty());
        }
    }

    private class ChatFixture {
        public BotModel bot;
        public Chat__c chat;

        private ChatFixture() {
            this.bot = createBot();
            this.chat = createChat(bot);
        }

        public TelegramBotService sut() {
            return createService(bot);
        }

        public void assertErrorIsNotCreated() {
            List<BotError__c> errors = [SELECT Id FROM BotError__c];
            Assert.isTrue(errors.isEmpty());
        }
    }

    private class InlineQueryFixture {
        public BotModel bot;
        public String inlineQueryId;

        private InlineQueryFixture() {
            this.bot = createBot();
            this.inlineQueryId = 'test_query';
        }

        public TelegramBotService sut() {
            return createService(bot);
        }

        public void assertErrorIsNotCreated() {
            List<BotError__c> errors = [SELECT Id FROM BotError__c];
            Assert.isTrue(errors.isEmpty());
        }
    }

    private class MeFixture {
        public BotModel bot;

        private MeFixture() {
            this.bot = createBot();
        }

        public TelegramBotService sut() {
            return createService(bot);
        }

        public void assertErrorIsNotCreated() {
            List<BotError__c> errors = [SELECT Id FROM BotError__c];
            Assert.isTrue(errors.isEmpty());
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
            WebhookEvents__c = 'message',
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return new BotModel(
            [
                SELECT Name, Type__c, WebhookEvents__c, Handler__c, Token__c, TokenHash__c
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
