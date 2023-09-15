@IsTest(isParallel = true)
private class ViberBotHandlerTest {
    private static final BotType BOT_TYPE = BotType.Viber;

    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    @IsTest
    private static void onMessageReceived_shouldPopulateMessageReceivedEventFields() {
        BotPayload event = runTest(ViberUpdateEventType.Message);
        Assert.isInstanceOfType(event, ViberMessageReceivedEvent.class);

        ViberMessageReceivedEvent message = (ViberMessageReceivedEvent) event;
        Assert.areEqual('4912661846655238145', message.messageToken);
        Assert.areEqual(Date.newInstance(2022, 1, 1), message.timestamp.date());
        Assert.isNull(message.userId);
        assertUser(message.sender);
        assertMessage(message.message);
    }

    @IsTest
    private static void onMessageDelivered_shouldPopulateMessageEventFields() {
        BotPayload event = runTest(ViberUpdateEventType.Delivered);
        Assert.isInstanceOfType(event, ViberMessageEvent.class);

        ViberMessageEvent message = (ViberMessageEvent) event;
        Assert.areEqual('4912661846655238145', message.messageToken);
        Assert.areEqual(Date.newInstance(2022, 1, 1), message.timestamp.date());
        Assert.areEqual('01234567890A=', message.userId);
    }

    @IsTest
    private static void onMessageSeen_shouldPopulateMessageEventFields() {
        BotPayload event = runTest(ViberUpdateEventType.Seen);
        Assert.isInstanceOfType(event, ViberMessageEvent.class);

        ViberMessageEvent message = (ViberMessageEvent) event;
        Assert.areEqual('4912661846655238145', message.messageToken);
        Assert.areEqual(Date.newInstance(2022, 1, 1), message.timestamp.date());
        Assert.areEqual('01234567890A=', message.userId);
    }

    @IsTest
    private static void onMessageFailed_shouldPopulateMessageFailedEventFields() {
        BotPayload event = runTest(ViberUpdateEventType.Failed);
        Assert.isInstanceOfType(event, ViberMessageEvent.class);

        ViberMessageFailedEvent failure = (ViberMessageFailedEvent) event;
        Assert.areEqual('4912661846655238145', failure.messageToken);
        Assert.areEqual(Date.newInstance(2022, 1, 1), failure.timestamp.date());
        Assert.areEqual('Some error!', failure.description);
        Assert.areEqual('01234567890A=', failure.userId);
    }

    @IsTest
    private static void onUnsubscribe_shouldPopulateMessageEventFields() {
        BotPayload event = runTest(ViberUpdateEventType.Unsubscribed);
        Assert.isInstanceOfType(event, ViberMessageEvent.class);

        ViberMessageEvent message = (ViberMessageEvent) event;
        Assert.areEqual('4912661846655238145', message.messageToken);
        Assert.areEqual(Date.newInstance(2022, 1, 1), message.timestamp.date());
        Assert.areEqual('01234567890A=', message.userId);
    }

    @IsTest
    private static void onSubscribe_shouldPopulateSubscribedEventFields() {
        BotPayload event = runTest(ViberUpdateEventType.Subscribed);
        Assert.isInstanceOfType(event, ViberMessageEvent.class);

        ViberSubscribedEvent subscription = (ViberSubscribedEvent) event;
        Assert.areEqual('4912661846655238145', subscription.messageToken);
        Assert.areEqual(Date.newInstance(2022, 1, 1), subscription.timestamp.date());
        Assert.isNull(subscription.userId);
        assertUser(subscription.user);
    }

    private static BotPayload runTest(ViberUpdateEventType eventType) {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        BotModel bot = createBot();
        Test.startTest();
        EventBus.publish(new BotUpdateEvent__e(Bot__c = bot.toJson(), Payload__c = createPayload(eventType).toJson()));
        Test.getEventBus().deliver();
        Test.stopTest();

        Assert.isNotNull(ViberBotHandlerMock.lastEvent);
        return ViberBotHandlerMock.lastEvent;
    }

    private static BotModel createBot() {
        insert new Bot__c(
            Name = 'Test Bot',
            Type__c = BOT_TYPE.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'ViberBotHandlerMock'
        );
        return new BotModel(
            [
                SELECT Name, Type__c, WebhookEvents__c, Handler__c, TokenHash__c
                FROM Bot__c
                WHERE Type__c = :BOT_TYPE.name()
                LIMIT 1
            ]
        );
    }

    private static BotJsonPayload createPayload(ViberUpdateEventType eventType) {
        BotJsonPayload eventPayload = new BotJsonPayload()
            .set('event', eventType.name())
            .set('timestamp', DateTime.newInstance(2022, 1, 1).getTime())
            .set('message_token', 4912661846655238145L);

        if (eventType == ViberUpdateEventType.Message) {
            eventPayload.set('message', createMessagePayload());
            eventPayload.set('sender', createUserPayload());
        } else if (
            eventType == ViberUpdateEventType.Delivered ||
            eventType == ViberUpdateEventType.Seen ||
            eventType == ViberUpdateEventType.Unsubscribed
        ) {
            eventPayload.set('user_id', '01234567890A=');
        } else if (eventType == ViberUpdateEventType.Failed) {
            eventPayload.set('user_id', '01234567890A=');
            eventPayload.set('desc', 'Some error!');
        } else if (eventType == ViberUpdateEventType.Subscribed) {
            eventPayload.set('user', createUserPayload());
        }
        return eventPayload;
    }

    private static BotJsonPayload createMessagePayload() {
        return new BotJsonPayload()
            .set('type', 'location')
            .set('text', 'Hello World!')
            .set('media', 'https://example.com/img.png')
            .set('location', new BotJsonPayload().set('lat', 50.76891).set('lon', 6.11499))
            .set('tracking_data', 'tracking');
    }

    private static BotJsonPayload createUserPayload() {
        return new BotJsonPayload()
            .set('id', '01234567890A=')
            .set('name', 'John McClane')
            .set('avatar', 'https://avatar.example.com')
            .set('country', 'UK')
            .set('language', 'en')
            .set('api_version', 1);
    }

    private static void assertMessage(ViberMessage message) {
        Assert.areEqual('location', message.type);
        Assert.areEqual('Hello World!', message.text);
        Assert.areEqual('https://example.com/img.png', message.media);
        Assert.areEqual('tracking', message.trackingData);
        Assert.isNull(message.fileName);
        Assert.isNull(message.fileSize);
        Assert.isNull(message.duration);
        Assert.isNull(message.stickerId);

        ViberMessage.Location location = message.location;
        Assert.areEqual(50.76891, location.latitude);
        Assert.areEqual(6.11499, location.longitude);

        ViberMessage.Contact contact = message.contact;
        Assert.isNull(contact.name);
        Assert.isNull(contact.phoneNumber);
        Assert.isNull(contact.avatar);
    }

    private static void assertUser(ViberUser user) {
        Assert.areEqual('01234567890A=', user.id);
        Assert.areEqual('John McClane', user.name);
        Assert.areEqual('https://avatar.example.com', user.avatar);
        Assert.areEqual('UK', user.country);
        Assert.areEqual('en', user.language);
        Assert.areEqual(1, user.apiVersion);
    }
}
