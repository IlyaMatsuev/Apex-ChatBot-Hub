@IsTest(isParallel = true)
private class BotContextTest {
    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    @IsTest
    private static void getService_forDifferentBot_shouldCreateNewService() {
        IBotContext context = createBotContext(BotType.Telegram, createTelegramPayload());

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

        Assert.isInstanceOfType(context.getService(), TelegramBotService.class);
        Assert.isInstanceOfType(newService, ViberBotService.class);
    }

    @IsTest
    private static void save_noExternalId_shouldPublishUpsertEvent() {
        IBotContext context = createBotContext(BotType.Telegram, createTelegramPayload());

        Test.startTest();
        context.save(new ChatUser__c(Name = 'Test', Username__c = 'test.name', ExternalId__c = '1234'));
        Test.stopTest();

        Assert.areEqual(1, [SELECT Id FROM ChatUser__c].size());
    }

    @IsTest
    private static void reply_shouldReturnSender() {
        IBotContext context = createBotContext(BotType.Telegram, createTelegramPayload());
        Assert.isInstanceOfType(context.reply(), TelegramBotSenderService.class);
    }

    /**
     * Telegram tests
     */
    @IsTest
    private static void received_telegramUpdateModelWithMessage_containsAllFields() {
        IBotUpdateEvent receivedUpdate = createBotUpdateEvent(BotType.Telegram, createTelegramPayload());

        Assert.isInstanceOfType(receivedUpdate, TelegramBotUpdateEvent.class);

        TelegramBotUpdateEvent receivedTgUpdate = (TelegramBotUpdateEvent) receivedUpdate;

        Assert.areEqual(TelegramBotUpdateEventType.Message, receivedTgUpdate.getType());

        TelegramBotMessage messageUpdate = receivedTgUpdate.getMessage();

        Assert.areEqual('223123123', messageUpdate.getId());
        Assert.areEqual('/start hello   world!', messageUpdate.getText());
        Assert.areEqual(DateTime.newInstanceGmt(2022, 1, 1, 8, 0, 0), messageUpdate.getSendDate());

        TelegramBotChat chatUpdate = receivedTgUpdate.getChat();

        Assert.areEqual('876541222', chatUpdate.getId());
        Assert.areEqual('matsuev', chatUpdate.getTitle());

        TelegramBotUser userUpdate = chatUpdate.getSender();

        Assert.areEqual('876541222', userUpdate.getId());
        Assert.isNull(userUpdate.getFirstName());
        Assert.areEqual('matsuev', userUpdate.getLastName());
        Assert.areEqual('ilyamatsuev', userUpdate.getUsername());
    }

    /**
     * Viber tests
     */
    @IsTest
    private static void received_viberUpdateModelWithMessage_containsAllFields() {
        IBotUpdateEvent receivedUpdate = createBotUpdateEvent(BotType.Viber, createViberPayload());

        Assert.isInstanceOfType(receivedUpdate, ViberBotUpdateEvent.class);

        ViberBotUpdateEvent receivedVbUpdate = (ViberBotUpdateEvent) receivedUpdate;

        Assert.areEqual(ViberBotUpdateEventType.Message, receivedVbUpdate.getType());

        ViberBotMessage messageUpdate = receivedVbUpdate.getMessage();

        Assert.areEqual('4912661846655238145', messageUpdate.getId());
        Assert.areEqual('/start hello   world!', messageUpdate.getText());
        Assert.areEqual(DateTime.newInstance(2022, 1, 1), messageUpdate.getSendDate());

        ViberBotChat chatUpdate = receivedVbUpdate.getChat();

        Assert.areEqual('01234567890A=', chatUpdate.getId());
        Assert.areEqual('John McClane', chatUpdate.getTitle());

        ViberBotUser userUpdate = chatUpdate.getSender();

        Assert.areEqual('01234567890A=', userUpdate.getId());
        Assert.areEqual('John', userUpdate.getFirstName());
        Assert.areEqual('McClane', userUpdate.getLastName());
        Assert.areEqual('01234567890A=', userUpdate.getUsername());
    }

    private static IBotContext createBotContext(BotType botType, BotJsonPayload payload) {
        setCalloutMock(botType);
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
        return new BotServiceFactoryMock().createBotContext(new BotModel(bot), payload.toJson());
    }

    private static IBotUpdateEvent createBotUpdateEvent(BotType botType, BotJsonPayload payload) {
        setCalloutMock(botType);
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
        return new BotServiceFactoryMock().createBotUpdateEvent(new BotModel(bot), payload.toJson());
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
