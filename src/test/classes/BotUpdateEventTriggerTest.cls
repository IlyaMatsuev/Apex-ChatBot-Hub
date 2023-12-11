@IsTest(isParallel = true)
private class BotUpdateEventTriggerTest {
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
        Assert.areEqual('Awesome chat', chats.get(0).Name);
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

        List<IBotContext> contexts = BotHandlerMock.executedContexts;
        Assert.areEqual(1, contexts.size());
        Assert.isInstanceOfType(contexts.get(0).getUpdateEvent(), TelegramUpdateEvent.class);

        IBotUpdateEvent updateEvent = contexts.get(0).getUpdateEvent();
        Assert.areEqual(TelegramUpdateEventType.Message, updateEvent.getType());

        IBotMessage messageUpdate = updateEvent.getMessage();

        Assert.areEqual('223123123', messageUpdate.getId());
        Assert.areEqual('Hello world!', messageUpdate.getText());
        Assert.isNull(messageUpdate.getMediaUrl());
        Assert.areEqual(BotMessageType.Text, messageUpdate.getType());
        Assert.isNotNull(messageUpdate.getParameters());
        Assert.areEqual(Date.newInstance(2022, 1, 1), messageUpdate.getSendDate().date());

        IBotChat chatUpdate = updateEvent.getChat();

        Assert.areEqual('876541222', chatUpdate.getId());
        Assert.areEqual('Awesome chat', chatUpdate.getTitle());

        IBotUser userUpdate = chatUpdate.getSender();

        Assert.areEqual('876541222', userUpdate.getId());
        Assert.isNull(userUpdate.getFirstName());
        Assert.areEqual('matsuev', userUpdate.getLastName());
        Assert.areEqual('ilyamatsuev', userUpdate.getUsername());
    }

    @IsTest
    private static void handle_telegramBotInlineQuery_shouldHandleInlineQueryAndInsertChatDetails() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        BotModel bot = createBot(BotType.Telegram);
        Test.startTest();
        EventBus.publish(
            new BotUpdateEvent__e(
                Bot__c = bot.toJson(),
                Payload__c = createTelegramPayload(TelegramUpdateEventType.InlineQuery).toJson()
            )
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<Chat__c> chats = [SELECT Name, Bot__c, ExternalId__c FROM Chat__c];
        List<ChatUser__c> users = [SELECT Name, FirstName__c, LastName__c, Username__c, ExternalId__c FROM ChatUser__c];
        List<ChatMessage__c> messages = [SELECT Id FROM ChatMessage__c];
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
        Assert.isTrue(messages.isEmpty());

        List<IBotContext> contexts = BotHandlerMock.executedContexts;
        Assert.areEqual(1, contexts.size());
        Assert.isInstanceOfType(contexts.get(0).getUpdateEvent(), TelegramUpdateEvent.class);

        IBotUpdateEvent updateEvent = contexts.get(0).getUpdateEvent();
        Assert.areEqual(TelegramUpdateEventType.InlineQuery, updateEvent.getType());
        Assert.isNull(updateEvent.getMessage());

        IBotChat chatUpdate = updateEvent.getChat();

        Assert.areEqual('876541222', chatUpdate.getId());
        Assert.areEqual('matsuev', chatUpdate.getTitle());

        IBotUser userUpdate = chatUpdate.getSender();

        Assert.areEqual('876541222', userUpdate.getId());
        Assert.isNull(userUpdate.getFirstName());
        Assert.areEqual('matsuev', userUpdate.getLastName());
        Assert.areEqual('ilyamatsuev', userUpdate.getUsername());
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

        List<IBotContext> contexts = BotHandlerMock.executedContexts;
        Assert.areEqual(1, contexts.size());
        Assert.isInstanceOfType(contexts.get(0).getUpdateEvent(), ViberUpdateEvent.class);

        IBotUpdateEvent updateEvent = contexts.get(0).getUpdateEvent();
        Assert.areEqual(ViberUpdateEventType.Message, updateEvent.getType());

        IBotMessage messageUpdate = updateEvent.getMessage();

        Assert.areEqual('4912661846655238145', messageUpdate.getId());
        Assert.areEqual('Hello world!', messageUpdate.getText());
        Assert.areEqual('https://example.com', messageUpdate.getMediaUrl());
        Assert.areEqual(BotMessageType.Text, messageUpdate.getType());
        Assert.isNotNull(messageUpdate.getParameters());
        Assert.areEqual(Date.newInstance(2022, 1, 1), messageUpdate.getSendDate().date());

        IBotChat chatUpdate = updateEvent.getChat();

        Assert.areEqual('01234567890A=', chatUpdate.getId());
        Assert.areEqual('John McClane', chatUpdate.getTitle());

        IBotUser userUpdate = chatUpdate.getSender();

        Assert.areEqual('01234567890A=', userUpdate.getId());
        Assert.areEqual('John', userUpdate.getFirstName());
        Assert.areEqual('McClane', userUpdate.getLastName());
        Assert.areEqual('01234567890A=', userUpdate.getUsername());
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

        List<IBotContext> contexts = BotHandlerMock.executedContexts;
        Assert.areEqual(1, contexts.size());
        Assert.isInstanceOfType(contexts.get(0).getUpdateEvent(), ViberUpdateEvent.class);

        IBotUpdateEvent updateEvent = contexts.get(0).getUpdateEvent();
        Assert.areEqual(ViberUpdateEventType.WebhookCallback, updateEvent.getType());

        Assert.isNull(updateEvent.getMessage());
        Assert.isNull(updateEvent.getChat());
    }

    private static BotModel createBot(BotType type) {
        insert new Bot__c(
            Name = type.name(),
            Type__c = type.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t72317g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return new BotModel(
            [
                SELECT Name, Type__c, WebhookEvents__c, Handler__c, Token__c, TokenHash__c
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
        BotJsonPayload eventPayload = new BotJsonPayload();
        if (eventType == TelegramUpdateEventType.Message || eventType == TelegramUpdateEventType.EditedMessage) {
            eventPayload
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
                        .set('title', 'Awesome chat')
                        .set('first_name', null)
                        .set('last_name', 'matsuev')
                        .set('username', 'ilyamatsuev')
                        .set('description', null)
                )
                .set('text', 'Hello world!');
        } else if (eventType == TelegramUpdateEventType.InlineQuery) {
            eventPayload
                .set('id', '')
                .set(
                    'from',
                    new BotJsonPayload()
                        .set('id', 876541222L)
                        .set('first_name', null)
                        .set('last_name', 'matsuev')
                        .set('username', 'ilyamatsuev')
                )
                .set('query', 'abra bla bla');
        }
        return new BotJsonPayload().set('update_id', 12312311L).set(eventType.name(), eventPayload);
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
