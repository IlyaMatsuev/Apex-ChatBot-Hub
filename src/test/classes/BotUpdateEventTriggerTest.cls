@IsTest(isParallel = true)
private class BotUpdateEventTriggerTest {
    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    /**
     * Telegram tests
     */

    @IsTest
    private static void handle_telegramBotMessage_shouldHandleMessageAndInsertChatDetails() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Telegram));

        BotModel bot = createBot(BotType.Telegram);
        Test.startTest();
        Eventbus.publish(new BotUpdateEvent__e(Bot__c = bot.toJson(), Payload__c = createTelegramPayload().toJson()));
        Test.getEventBus().deliver();
        Test.stopTest();

        List<Chat__c> chats = [SELECT Name, Bot__c, ExternalId__c FROM Chat__c];
        List<ChatUser__c> users = [SELECT Name, FirstName__c, LastName__c, Username__c, ExternalId__c FROM ChatUser__c];
        List<ChatMessage__c> messages = [
            SELECT Name, Text__c, User__c, Bot__c, Chat__c, ExternalId__c, SendDate__c
            FROM ChatMessage__c
        ];
        // Chat
        System.assertEquals(1, chats.size());
        System.assertEquals('matsuev', chats.get(0).Name);
        System.assertEquals(bot.id, chats.get(0).Bot__c);
        System.assertEquals('876541222:'.rightPad(40, bot.tokenHash), chats.get(0).ExternalId__c);
        // User
        System.assertEquals(1, users.size());
        System.assertEquals('matsuev', users.get(0).Name);
        System.assertEquals(null, users.get(0).FirstName__c);
        System.assertEquals('matsuev', users.get(0).LastName__c);
        System.assertEquals('ilyamatsuev', users.get(0).Username__c);
        System.assertEquals('876541222', users.get(0).ExternalId__c);
        // Message
        System.assertEquals(1, messages.size());
        System.assertEquals('Hello world!', messages.get(0).Text__c);
        System.assertEquals(users.get(0).Id, messages.get(0).User__c);
        System.assertEquals(chats.get(0).Id, messages.get(0).Chat__c);
        System.assertEquals(null, messages.get(0).Bot__c);
        System.assertEquals('223123123', messages.get(0).ExternalId__c);
        System.assertEquals(Date.newInstance(2022, 1, 1), messages.get(0).SendDate__c.date());

        List<BotContext> contexts = BotHandlerMock.executedContexts;
        System.assertEquals(1, contexts.size());
    }

    @IsTest
    private static void handle_telegramUpdateWithUnexpectedException_shouldThrowExceptionAndLogError() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Telegram));

        BotModel bot = createBot(BotType.Telegram);
        BotHandlerMock.throwError = true;
        Test.startTest();
        Eventbus.publish(new BotUpdateEvent__e(Bot__c = bot.toJson(), Payload__c = createTelegramPayload().toJson()));
        Test.getEventBus().deliver();
        Test.stopTest();

        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];

        System.assertEquals(1, errors.size());
        System.assertEquals(1, chats.size());
        System.assertEquals(1, users.size());
        System.assertEquals(1, messages.size());
    }

    @IsTest
    private static void handle_telegramNotSupportedUpdateType_shouldIgnoreUpdate() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Telegram));

        BotModel bot = createBot(BotType.Telegram);
        Test.startTest();
        Eventbus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createTelegramPayload(TelegramBotUpdateEventType.EditedMessage).toJson()
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

        System.assert(chats.isEmpty());
        System.assert(users.isEmpty());
        System.assert(messages.isEmpty());
        System.assert(BotHandlerMock.executedContexts.isEmpty());
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void handle_viberBotMessage_shouldHandleMessageAndInsertChatDetails() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Viber));

        BotModel bot = createBot(BotType.Viber);
        Test.startTest();
        Eventbus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createViberPayload(ViberBotUpdateEventType.Message).toJson()
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
        System.assertEquals(1, chats.size());
        System.assertEquals('John McClane', chats.get(0).Name);
        System.assertEquals(bot.id, chats.get(0).Bot__c);
        System.assertEquals('01234567890A=:'.rightPad(40, bot.tokenHash), chats.get(0).ExternalId__c);
        // User
        System.assertEquals(1, users.size());
        System.assertEquals('John McClane', users.get(0).Name);
        System.assertEquals('John', users.get(0).FirstName__c);
        System.assertEquals('McClane', users.get(0).LastName__c);
        System.assertEquals('01234567890A=', users.get(0).Username__c);
        System.assertEquals('01234567890A=', users.get(0).ExternalId__c);
        // Message
        System.assertEquals(1, messages.size());
        System.assertEquals('Hello world!', messages.get(0).Text__c);
        System.assertEquals(users.get(0).Id, messages.get(0).User__c);
        System.assertEquals(chats.get(0).Id, messages.get(0).Chat__c);
        System.assertEquals(null, messages.get(0).Bot__c);
        System.assertEquals('4912661846655238145', messages.get(0).ExternalId__c);
        System.assertEquals(Date.newInstance(2022, 1, 1), messages.get(0).SendDate__c.date());

        List<BotContext> contexts = BotHandlerMock.executedContexts;
        System.assertEquals(1, contexts.size());
    }

    @IsTest
    private static void handle_viberUpdateWithUnexpectedException_shouldThrowExceptionAndLogError() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Viber));

        BotModel bot = createBot(BotType.Viber);
        BotHandlerMock.throwError = true;
        Test.startTest();
        Eventbus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createViberPayload(ViberBotUpdateEventType.Message).toJson()
            )
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];

        System.assertEquals(1, errors.size());
        System.assertEquals(1, chats.size());
        System.assertEquals(1, users.size());
        System.assertEquals(1, messages.size());
    }

    @IsTest
    private static void handle_viberWebhookUrlCallback_shouldIgnore() {
        Test.setMock(HttpCalloutMock.class, new BotCalloutMock(BotType.Viber));

        BotModel bot = createBot(BotType.Viber);
        Test.startTest();
        Eventbus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createViberPayload(ViberBotUpdateEventType.WebhookCallback).toJson()
            )
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        List<Chat__c> chats = [SELECT Id FROM Chat__c];
        List<ChatUser__c> users = [SELECT Id FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];

        System.assert(errors.isEmpty());
        System.assert(chats.isEmpty());
        System.assert(users.isEmpty());
        System.assert(messages.isEmpty());
        System.assert(BotHandlerMock.executedContexts.isEmpty());
    }

    private static BotModel createBot(BotType type) {
        insert new Bot__c(
            Name = type.name(),
            Type__c = type.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return new BotModel(
            [SELECT Name, Type__c, Handler__c, TokenHash__c FROM Bot__c WHERE Type__c = :type.name() LIMIT 1]
        );
    }

    private static ValueMap createTelegramPayload() {
        return createTelegramPayload(TelegramBotUpdateEventType.Message);
    }

    private static ValueMap createTelegramPayload(TelegramBotUpdateEventType eventType) {
        return new ValueMap()
            .set('update_id', 12312311L)
            .set(
                eventType.name(),
                new ValueMap()
                    .set('message_id', 223123123L)
                    .set(
                        'from',
                        new ValueMap()
                            .set('id', 876541222L)
                            .set('first_name', null)
                            .set('last_name', 'matsuev')
                            .set('username', 'ilyamatsuev')
                    )
                    .set('date', DateTime.newInstance(2022, 1, 1).getTime())
                    .set(
                        'chat',
                        new ValueMap()
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

    private static ValueMap createViberPayload(ViberBotUpdateEventType eventType) {
        ValueMap payload = new ValueMap()
            .set('event', eventType.name())
            .set('timestamp', DateTime.newInstance(2022, 1, 1).getTime())
            .set('message_token', 4912661846655238145L);

        if (eventType == ViberBotUpdateEventType.Message) {
            payload
                .set(
                    'sender',
                    new ValueMap()
                        .set('id', '01234567890A=')
                        .set('name', 'John McClane')
                        .set('avatar', 'http://avatar.example.com')
                        .set('country', 'UK')
                        .set('language', 'en')
                        .set('api_version', 1)
                )
                .set(
                    'message',
                    new ValueMap()
                        .set('type', 'text')
                        .set('text', 'Hello world!')
                        .set('media', 'https://example.com')
                        .set('location', new ValueMap().set('lat', 50.76891).set('lon', 6.11499))
                );
        }
        return payload;
    }
}
