@IsTest(IsParallel=true)
private class BotContextTest {
    private static final BotType BOT_TYPE = BotType.Telegram;

    @TestSetup
    private static void init() {
        Test.setMock(HttpCalloutMock.class, new BotWebhookCalloutMock(BOT_TYPE, TelegramBotMethod.SetWebhook.name()));
        BotSettingsProvider.settings.put(
            BOT_TYPE,
            new BotSetting__mdt(DeveloperName = BOT_TYPE.name(), ApiUrl__c = 'https://bot-api.org/bot')
        );
        insert new Bot__c(
            Type__c = BOT_TYPE.name(),
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
    }

    @IsTest
    private static void getService_shouldCreateService() {
        Bot__c bot = [SELECT Type__c, Handler__c FROM Bot__c LIMIT 1];
        System.assert(createBotContext().getService(bot) != null);
    }

    @IsTest
    private static void save_noExternalId_shouldPublishUpsertEvent() {
        BotContext context = createBotContext();

        Test.startTest();
        context.save(new ChatUser__c(Name = 'Test', Username__c = 'test.name', ExternalId__c = '1234'));
        Test.stopTest();

        System.assertEquals(1, [SELECT Id FROM ChatUser__c].size());
    }

    @IsTest
    private static void send_replyWithMessage_shouldSendMessage() {
        BotContext context = createBotContext();

        context.reply.send('test message');

        System.assertEquals(1, BotServiceMock.outboundMessages.size());
        System.assertEquals(
            'test message',
            BotServiceMock.outboundMessages.get(String.valueOf(context.received.chat.id))
        );
    }

    @IsTest
    private static void received_telegramUpdateModelWithMessage_containsAllFields() {
        BotContext context = createBotContext();

        Map<String, Object> expectedPayload = new Map<String, Object>{
            'chat' => new Map<String, Object>{
                'firstName' => null,
                'id' => 876541222L,
                'lastName' => 'matsuev',
                'title' => null,
                'username' => 'ilya.matsuev'
            },
            'id' => 12312311L,
            'message' => new Map<String, Object>{
                'id' => 223123123L,
                'sentAt' => DateTime.newInstance(2022, 1, 1),
                'text' => 'Hello world!'
            },
            'user' => new Map<String, Object>{
                'firstName' => null,
                'id' => 876541222L,
                'lastName' => 'matsuev',
                'username' => 'ilya.matsuev'
            }
        };

        System.assertEquals(JSON.serialize(expectedPayload), JSON.serialize(context.received));
    }

    private static BotContext createBotContext() {
        Bot__c bot = [SELECT Type__c, Handler__c FROM Bot__c LIMIT 1];
        return new BotContext(
            bot,
            BotUpdateModel.fromPayload(createTelegramUpdateJson(), BOT_TYPE),
            new BotServiceFactoryMock()
        );
    }

    private static String createTelegramUpdateJson() {
        Map<String, Object> payload = new Map<String, Object>{
            'update_id' => 12312311L,
            'message' => new Map<String, Object>{
                'message_id' => 223123123L,
                'from' => new Map<String, Object>{
                    'id' => 876541222L,
                    'is_bot' => false,
                    'first_name' => null,
                    'last_name' => 'matsuev',
                    'username' => 'ilya.matsuev'
                },
                'date' => DateTime.newInstance(2022, 1, 1).getTime(),
                'chat' => new Map<String, Object>{
                    'id' => 876541222L,
                    'type' => 'private',
                    'title' => null,
                    'first_name' => null,
                    'last_name' => 'matsuev',
                    'username' => 'ilya.matsuev',
                    'description' => null
                },
                'text' => 'Hello world!'
            }
        };
        return JSON.serialize(payload);
    }

    private class BotServiceFactoryMock extends BotServiceFactory {
        public override BotService createBotService(Bot__c bot) {
            return new BotServiceMock(bot);
        }

        public override WebhookBotService createWebhookService(Bot__c bot) {
            return null;
        }
    }
}
