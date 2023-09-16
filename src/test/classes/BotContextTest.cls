@IsTest(isParallel = true)
private class BotContextTest {
    @IsTest
    private static void save_noExternalId_shouldPublishUpsertEvent() {
        IBotContext context = createBotContext(BotType.Telegram);

        Test.startTest();
        context.save(new ChatUser__c(Name = 'Test', Username__c = 'test.name', ExternalId__c = '1234'));
        Test.stopTest();

        Assert.areEqual(1, [SELECT Id FROM ChatUser__c].size());
    }

    @IsTest
    private static void createBotContext_missingRequiredFields_shouldThrowException() {
        createBotContext(BotType.Telegram);
        BotModel bot = new BotModel([SELECT Id, Name, Type__c FROM Bot__c LIMIT 1]);

        try {
            new BotServiceFactoryMock().createBotContext(bot, createTelegramPayload().toJson());
            Assert.fail('The exception was not thrown');
        } catch (Exception ex) {
            Assert.isInstanceOfType(ex, BotServiceFactory.BotMissingRequiredFieldsException.class);
        }
    }

    /**
     * Telegram tests
     */

    @IsTest
    private static void getService_telegramForDifferentBot_shouldCreateNewService() {
        IBotContext context = createBotContext(BotType.Telegram);

        Test.startTest();
        Bot__c differentBot = new Bot__c(
            Name = 'Test',
            Type__c = BotType.Viber.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t72317g23323423',
            TokenHash__c = '74712731t72317g23323423',
            Handler__c = 'BotHandlerMock'
        );
        insert differentBot;
        IBotService newService = context.getService(new BotModel(differentBot));
        Test.stopTest();

        Assert.isInstanceOfType(context.getService(), TelegramBotService.class);
        Assert.isInstanceOfType(newService, ViberBotService.class);
    }

    @IsTest
    private static void reply_telegramContext_shouldReturnSender() {
        IBotContext context = createBotContext(BotType.Telegram);
        Assert.isInstanceOfType(context.reply(), TelegramBotSenderService.class);
    }

    @IsTest
    private static void reply_telegramContextWithoutChat_shouldThrowException() {
        BotJsonPayload payload = createTelegramPayload();
        Map<String, Object> messagePayload = payload.getJsonPayload('message').getValues();
        messagePayload.remove('chat');
        messagePayload.remove('from');

        IBotContext context = createBotContext(BotType.Telegram, payload);

        try {
            context.reply();
            Assert.fail('The exception was not thrown');
        } catch (Exception error) {
            Assert.isInstanceOfType(error, BotContext.NoReplyOptionException.class);
        }
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void getService_viberContext_shouldReturnViberService() {
        IBotContext context = createBotContext(BotType.Viber);
        Assert.isInstanceOfType(context.getService(), ViberBotService.class);
    }

    @IsTest
    private static void reply_viberContext_shouldReturnSender() {
        IBotContext context = createBotContext(BotType.Viber);
        Assert.isInstanceOfType(context.reply(), ViberBotSenderService.class);
    }

    @IsTest
    private static void reply_viberContextWithoutChat_shouldThrowException() {
        BotJsonPayload payload = createViberPayload();
        payload.getValues().remove('sender');

        IBotContext context = createBotContext(BotType.Viber, payload);

        try {
            context.reply();
            Assert.fail('The exception was not thrown');
        } catch (Exception error) {
            Assert.isInstanceOfType(error, BotContext.NoReplyOptionException.class);
        }
    }

    private static IBotContext createBotContext(BotType type) {
        BotJsonPayload payload = type == BotType.Telegram ? createTelegramPayload() : createViberPayload();
        return createBotContext(type, payload);
    }

    private static IBotContext createBotContext(BotType type, BotJsonPayload payload) {
        setCalloutMock(type);
        insert new Bot__c(
            Name = type.name(),
            Type__c = type.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
        Bot__c bot = [
            SELECT Name, Type__c, WebhookEvents__c, Handler__c, Token__c, TokenHash__c
            FROM Bot__c
            WHERE Type__c = :type.name()
            LIMIT 1
        ];
        return new BotServiceFactoryMock().createBotContext(new BotModel(bot), payload.toJson());
    }

    private static BotCalloutMock setCalloutMock(BotType type) {
        BotCalloutMock mock;
        if (type == BotType.Telegram) {
            mock = new TelegramBotCalloutMock();
        } else if (type == BotType.Viber) {
            mock = new ViberBotCalloutMock();
        } else {
            throw new AssertException('The provided bot callout mock is not supported: ' + type);
        }
        Test.setMock(HttpCalloutMock.class, mock);
        return mock;
    }

    private static BotJsonPayload createTelegramPayload() {
        return new BotJsonPayload()
            .set('update_id', 12312311L)
            .set(
                'message',
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
                    .set('date', 1641024000)
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
                    .set('text', '/start hello   world!')
            );
    }

    private static BotJsonPayload createViberPayload() {
        return new BotJsonPayload()
            .set('event', 'message')
            .set('timestamp', DateTime.newInstance(2022, 1, 1).getTime())
            .set('message_token', 4912661846655238145L)
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
                    .set('text', '/start hello   world!')
                    .set('media', 'https://example.com')
                    .set('location', new BotJsonPayload().set('lat', 50.76891).set('lon', 6.11499))
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

        public override IBotUpdateEvent createBotUpdateEvent(BotModel bot, String updatePayload) {
            return super.createBotUpdateEvent(bot, updatePayload);
        }
    }
}
