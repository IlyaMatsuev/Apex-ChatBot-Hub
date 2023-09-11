@IsTest(isParallel = true)
private class BotUpdateEventTriggerTest {
    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    // TODO: Add tests
    // - handle for an update that should be ignored (not included in the `WebhookEvents__c` value
    // - handle for an update without a message object

    /**
     * Telegram tests
     */

    @IsTest
    private static void handle_telegramBotMessage_shouldHandleMessageAndInsertChatDetails() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        BotModel bot = createBot(BotType.Telegram);
        Test.startTest();
        EventBus.publish(new BotUpdateEvent__e(Bot__c = bot.toJson(), Payload__c = createTelegramPayload().toJson()));
        Test.getEventBus().deliver();
        Test.stopTest();

        List<Chat__c> chats = [SELECT Name, Bot__c, ExternalId__c FROM Chat__c];
        List<ChatUser__c> users = [SELECT Name, FirstName__c, LastName__c, Username__c, ExternalId__c FROM ChatUser__c];
        List<ChatMessage__c> messages = [
            SELECT Name, Text__c, User__c, Bot__c, Chat__c, ExternalId__c, SendDate__c
            FROM ChatMessage__c
        ];
        // Chat
        Assert.areEqual(1, chats.size());
        Assert.areEqual('matsuev', chats.get(0).Name);
        Assert.areEqual(bot.id, chats.get(0).Bot__c);
        Assert.areEqual('876541222:'.rightPad(40, bot.tokenHash), chats.get(0).ExternalId__c);
        // User
        Assert.areEqual(1, users.size());
        Assert.areEqual('matsuev', users.get(0).Name);
        Assert.isNull(users.get(0).FirstName__c);
        Assert.areEqual('matsuev', users.get(0).LastName__c);
        Assert.areEqual('ilyamatsuev', users.get(0).Username__c);
        Assert.areEqual('876541222', users.get(0).ExternalId__c);
        // Message
        Assert.areEqual(1, messages.size());
        Assert.areEqual('Hello world!', messages.get(0).Text__c);
        Assert.areEqual(users.get(0).Id, messages.get(0).User__c);
        Assert.areEqual(chats.get(0).Id, messages.get(0).Chat__c);
        Assert.isNull(messages.get(0).Bot__c);
        Assert.areEqual('223123123:876541222', messages.get(0).ExternalId__c);
        Assert.areEqual(Date.newInstance(2022, 1, 1), messages.get(0).SendDate__c.date());

        List<BotHandlerMock.ReceivedContext> contexts = BotHandlerMock.executedContexts;
        Assert.areEqual(1, contexts.size());
    }

    @IsTest
    private static void handle_telegramUpdateWithUnexpectedException_shouldThrowExceptionAndLogError() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        BotModel bot = createBot(BotType.Telegram);
        BotHandlerMock.throwError = true;
        Test.startTest();
        EventBus.publish(new BotUpdateEvent__e(Bot__c = bot.toJson(), Payload__c = createTelegramPayload().toJson()));
        Test.getEventBus().deliver();
        Test.stopTest();

        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];

        Assert.areEqual(1, errors.size());
        Assert.areEqual(1, chats.size());
        Assert.areEqual(1, users.size());
        Assert.areEqual(1, messages.size());
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void handle_viberBotMessage_shouldHandleMessageAndInsertChatDetails() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        BotModel bot = createBot(BotType.Viber);
        Test.startTest();
        EventBus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createViberPayload(ViberUpdateEventType.Message).toJson()
            )
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<Chat__c> chats = [SELECT Name, Bot__c, ExternalId__c FROM Chat__c];
        List<ChatUser__c> users = [SELECT Name, FirstName__c, LastName__c, Username__c, ExternalId__c FROM ChatUser__c];
        List<ChatMessage__c> messages = [
            SELECT Name, Text__c, User__c, Bot__c, Chat__c, ExternalId__c, SendDate__c
            FROM ChatMessage__c
        ];
        // Chat
        Assert.areEqual(1, chats.size());
        Assert.areEqual('John McClane', chats.get(0).Name);
        Assert.areEqual(bot.id, chats.get(0).Bot__c);
        Assert.areEqual('01234567890A=:'.rightPad(40, bot.tokenHash), chats.get(0).ExternalId__c);
        // User
        Assert.areEqual(1, users.size());
        Assert.areEqual('John McClane', users.get(0).Name);
        Assert.areEqual('John', users.get(0).FirstName__c);
        Assert.areEqual('McClane', users.get(0).LastName__c);
        Assert.areEqual('01234567890A=', users.get(0).Username__c);
        Assert.areEqual('01234567890A=', users.get(0).ExternalId__c);
        // Message
        Assert.areEqual(1, messages.size());
        Assert.areEqual('Hello world!', messages.get(0).Text__c);
        Assert.areEqual(users.get(0).Id, messages.get(0).User__c);
        Assert.areEqual(chats.get(0).Id, messages.get(0).Chat__c);
        Assert.isNull(messages.get(0).Bot__c);
        Assert.areEqual('4912661846655238145:01234567890A=', messages.get(0).ExternalId__c);
        Assert.areEqual(Date.newInstance(2022, 1, 1), messages.get(0).SendDate__c.date());

        List<BotHandlerMock.ReceivedContext> contexts = BotHandlerMock.executedContexts;
        Assert.areEqual(1, contexts.size());
    }

    @IsTest
    private static void handle_viberUpdateWithUnexpectedException_shouldThrowExceptionAndLogError() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        BotModel bot = createBot(BotType.Viber);
        BotHandlerMock.throwError = true;
        Test.startTest();
        EventBus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createViberPayload(ViberUpdateEventType.Message).toJson()
            )
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];

        Assert.areEqual(1, errors.size());
        Assert.areEqual(1, chats.size());
        Assert.areEqual(1, users.size());
        Assert.areEqual(1, messages.size());
    }

    @IsTest
    private static void handle_viberWebhookUrlCallback_shouldHandleUpdateAndIgnoreChatDetails() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        BotModel bot = createBot(BotType.Viber);
        Test.startTest();
        EventBus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createViberPayload(ViberUpdateEventType.WebhookCallback).toJson()
            )
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];

        Assert.isTrue(errors.isEmpty());
        Assert.isTrue(chats.isEmpty());
        Assert.isTrue(users.isEmpty());
        Assert.isTrue(messages.isEmpty());
        Assert.areEqual(1, BotHandlerMock.executedContexts.size());
        Assert.areEqual(ViberUpdateEventType.WebhookCallback, BotHandlerMock.executedContexts.get(0).event.getType());
    }

    private static BotModel createBot(BotType type) {
        insert new Bot__c(
            Name = type.name(),
            Type__c = type.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return new BotModel(
            [
                SELECT Name, Type__c, WebhookEvents__c, Handler__c, TokenHash__c
                FROM Bot__c
                WHERE Type__c = :type.name()
                LIMIT 1
            ]
        );
    }

    private static BotJsonPayload createTelegramPayload() {
        return createTelegramPayload(TelegramUpdateEventType.Message);
    }

    private static BotJsonPayload createTelegramPayload(TelegramUpdateEventType eventType) {
        return new BotJsonPayload()
            .set('update_id', 12312311L)
            .set(
                eventType.name(),
                new BotJsonPayload()
                    .set('message_id', 223123123L)
                    .set(
                        'from',
                        new BotJsonPayload()
                            .set('id', 876541222L)
                            .set('first_name', null)
                            .set('last_name', 'matsuev')
                            .set('username', 'ilyamatsuev')
                    )
                    .set('date', DateTime.newInstance(2022, 1, 1).getTime())
                    .set(
                        'chat',
                        new BotJsonPayload()
                            .set('id', 876541222L)
                            .set('type', 'private')
                            .set('title', null)
                            .set('first_name', null)
                            .set('last_name', 'matsuev')
                            .set('username', 'ilyamatsuev')
                            .set('description', null)
                    )
                    .set('text', 'Hello world!')
            );
    }

    private static BotJsonPayload createViberPayload(ViberUpdateEventType eventType) {
        BotJsonPayload payload = new BotJsonPayload()
            .set('event', eventType.name())
            .set('timestamp', DateTime.newInstance(2022, 1, 1).getTime())
            .set('message_token', 4912661846655238145L);

        if (eventType == ViberUpdateEventType.Message) {
            payload
                .set(
                    'sender',
                    new BotJsonPayload()
                        .set('id', '01234567890A=')
                        .set('name', 'John McClane')
                        .set('avatar', 'http://avatar.example.com')
                        .set('country', 'UK')
                        .set('language', 'en')
                        .set('api_version', 1)
                )
                .set(
                    'message',
                    new BotJsonPayload()
                        .set('type', 'text')
                        .set('text', 'Hello world!')
                        .set('media', 'https://example.com')
                        .set('location', new BotJsonPayload().set('lat', 50.76891).set('lon', 6.11499))
                );
        }
        return payload;
    }
}
