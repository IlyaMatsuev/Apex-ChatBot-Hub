@IsTest(isParallel = true)
private class BotContextTest {
    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    @IsTest
    private static void getService_forDifferentBot_shouldCreateNewService() {
        BotContext context = createBotContext(BotType.Telegram, createTelegramPayload());

        Test.startTest();
        Bot__c differentBot = new Bot__c(
            Name = 'Test',
            Type__c = BotType.Viber.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g23323423werw',
            Handler__c = 'BotHandlerMock'
        );
        insert differentBot;
        IBotService newService = context.getService(new BotModel(differentBot));
        Test.stopTest();

        Assert.isTrue(newService != ((IBotContext) context).getService());
        Assert.isTrue(newService instanceof BotServiceMock);
    }

    @IsTest
    private static void getService_sameBot_shouldCreateNewService() {
        BotContext context = createBotContext(BotType.Telegram, createTelegramPayload());

        Test.startTest();
        IBotService newService = context.getService(context.bot);
        Test.stopTest();

        Assert.isTrue(newService == ((IBotContext) context).getService());
        Assert.isTrue(newService instanceof BotServiceMock);
    }

    @IsTest
    private static void save_noExternalId_shouldPublishUpsertEvent() {
        BotContext context = createBotContext(BotType.Telegram, createTelegramPayload());

        Test.startTest();
        context.save(new ChatUser__c(Name = 'Test', Username__c = 'test.name', ExternalId__c = '1234'));
        Test.stopTest();

        Assert.areEqual(1, [SELECT Id FROM ChatUser__c].size());
    }

    @IsTest
    private static void reply_shouldReturnSender() {
        IBotContext context = createBotContext(BotType.Telegram, createTelegramPayload());
        Assert.isInstanceOfType(context.reply(), BotServiceMock.SenderService.class);
    }

    /**
     * Telegram tests
     */

    @IsTest
    private static void received_telegramUpdateModelWithMessage_containsAllFields() {
        IBotContext context = createBotContext(BotType.Telegram, createTelegramPayload());

        ValueMap expectedPayload = new ValueMap()
            .set(
                'chat',
                new ValueMap()
                    .set('id', '876541222')
                    .set('isDM', true)
                    .set(
                        'sender',
                        new ValueMap()
                            .set('firstName', null)
                            .set('id', '876541222')
                            .set('lastName', 'matsuev')
                            .set('username', 'ilyamatsuev')
                    )
                    .set('title', 'matsuev')
            )
            .set('eventType', new ValueMap().set('value', 'message'))
            .set(
                'message',
                new ValueMap()
                    .set(
                        'command',
                        new ValueMap().set('name', 'start').set('params', new List<String> { 'hello', 'world!' })
                    )
                    .set('id', '223123123')
                    .set('sentAt', DateTime.newInstanceGmt(2022, 1, 1, 8, 0, 0))
                    .set('text', '/start hello   world!')
            );

        Assert.areEqual(expectedPayload.toJson(), JSON.serialize(context.getReceivedUpdate()));
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void received_viberUpdateModelWithMessage_containsAllFields() {
        IBotContext context = createBotContext(BotType.Viber, createViberPayload());

        ValueMap expectedPayload = new ValueMap()
            .set(
                'chat',
                new ValueMap()
                    .set('id', '01234567890A=')
                    .set('isDM', true)
                    .set(
                        'sender',
                        new ValueMap()
                            .set('firstName', 'John')
                            .set('id', '01234567890A=')
                            .set('lastName', 'McClane')
                            .set('username', '01234567890A=')
                    )
                    .set('title', 'John McClane')
            )
            .set('eventType', new ValueMap().set('value', 'message'))
            .set(
                'message',
                new ValueMap()
                    .set(
                        'command',
                        new ValueMap().set('name', 'start').set('params', new List<String> { 'hello', 'world!' })
                    )
                    .set('id', '4912661846655238145')
                    .set('sentAt', DateTime.newInstance(2022, 1, 1))
                    .set('text', '/start hello   world!')
            );

        Assert.areEqual(expectedPayload.toJson(), JSON.serialize(context.getReceivedUpdate()));
    }

    private static BotContext createBotContext(BotType botType, ValueMap payload) {
        insert new Bot__c(
            Name = botType.name(),
            Type__c = botType.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        Bot__c bot = [
            SELECT Name, Type__c, Handler__c, TokenHash__c
            FROM Bot__c
            WHERE Type__c = :botType.name()
            LIMIT 1
        ];
        return (BotContext) new BotServiceFactoryMock().createBotContext(new BotModel(bot), payload.toJson());
    }

    private static ValueMap createTelegramPayload() {
        return new ValueMap()
            .set('update_id', 12312311L)
            .set(
                'message',
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
                    .set('date', 1641024000)
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
                    .set('text', '/start hello   world!')
            );
    }

    private static ValueMap createViberPayload() {
        return new ValueMap()
            .set('event', 'message')
            .set('timestamp', DateTime.newInstance(2022, 1, 1).getTime())
            .set('message_token', 4912661846655238145L)
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
                    .set('text', '/start hello   world!')
                    .set('media', 'https://example.com')
                    .set('location', new ValueMap().set('lat', 50.76891).set('lon', 6.11499))
            );
    }

    private class BotServiceFactoryMock extends BotServiceFactory {
        public override IBotService createBotService(BotModel bot) {
            return new BotServiceMock(bot);
        }

        public override BotWebhookService createWebhookService(BotModel bot) {
            return null;
        }

        public override IBotContext createBotContext(BotModel bot, String updatePayload) {
            return super.createBotContext(bot, updatePayload);
        }
    }
}
