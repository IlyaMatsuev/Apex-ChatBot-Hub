@IsTest(IsParallel = true)
private class BotUpdateEventTriggerTest {
    private static final String BOT_TYPE = BotType.Telegram.name();

    @TestSetup
    private static void init() {
        Test.setMock(
            HttpCalloutMock.class,
            new BotWebhookCalloutMock(BotType.valueOf(BOT_TYPE), TelegramBotMethod.SetWebhook)
        );
        BotSettingsProvider.settings.put(
            BotType.valueOf(BOT_TYPE),
            new BotSetting__mdt(DeveloperName = BOT_TYPE, ApiUrl__c = 'https://bot-api.org/bot')
        );
        insert new Bot__c(
            Type__c = BOT_TYPE,
            Token__c = '74712731t723gjhbbfkwnkqwguqg17g2717283',
            Handler__c = 'BotHandlerMock'
        );
    }

    @IsTest
    private static void handle_telegramBotMessage_shouldHandleMessageAndInsertChatDetails() {
        Bot__c bot = [SELECT Type__c, Handler__c, TokenHash__c FROM Bot__c LIMIT 1];
        Test.startTest();
        Eventbus.publish(
            new BotUpdateEvent__e(Bot__c = JSON.serialize(bot), Payload__c = JSON.serialize(prepareTelegramPayload()))
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
        System.assertEquals('matsuev', chats.get(0).Name);
        System.assertEquals(bot.Id, chats.get(0).Bot__c);
        System.assertEquals('876541222:' + bot.TokenHash__c.substring(0, 20), chats.get(0).ExternalId__c);
        // User
        System.assertEquals(1, users.size());
        System.assertEquals('matsuev', users.get(0).Name);
        System.assertEquals(null, users.get(0).FirstName__c);
        System.assertEquals('matsuev', users.get(0).LastName__c);
        System.assertEquals('ilya.matsuev', users.get(0).Username__c);
        System.assertEquals('876541222', users.get(0).ExternalId__c);
        // Message
        System.assertEquals(1, messages.size());
        System.assertEquals('Hello world!', messages.get(0).Text__c);
        System.assertEquals(users.get(0).Id, messages.get(0).User__c);
        System.assertEquals(chats.get(0).Id, messages.get(0).Chat__c);
        System.assertEquals(null, messages.get(0).Bot__c);
        System.assertEquals('223123123', messages.get(0).ExternalId__c);
        System.assertEquals(Date.today(), messages.get(0).SendDate__c.date());

        List<BotContext> contexts = BotHandlerMock.executedContexts;
        System.assertEquals(1, contexts.size());
    }

    @IsTest
    private static void handle_updateWithUnexpectedException_shouldThrowExceptionAndLogError() {
        Bot__c bot = [SELECT Type__c, Handler__c, TokenHash__c FROM Bot__c LIMIT 1];
        BotHandlerMock.throwError = true;
        Test.startTest();
        Eventbus.publish(
            new BotUpdateEvent__e(Bot__c = JSON.serialize(bot), Payload__c = JSON.serialize(prepareTelegramPayload()))
        );
        Test.getEventBus().deliver();
        Test.stopTest();

        List<BotError__c> errors = [SELECT Id FROM BotError__c];
        List<Chat__c> chats = [SELECT Name, Bot__c, ExternalId__c FROM Chat__c];
        List<ChatUser__c> users = [SELECT Name, FirstName__c, LastName__c, Username__c, ExternalId__c FROM ChatUser__c];
        List<ChatMessage__c> messages = [
            SELECT Name, Text__c, User__c, Bot__c, Chat__c, ExternalId__c, SendDate__c
            FROM ChatMessage__c
        ];

        System.assertEquals(1, errors.size());
        System.assertEquals(1, chats.size());
        System.assertEquals(1, users.size());
        System.assertEquals(1, messages.size());
    }

    private static Map<String, Object> prepareTelegramPayload() {
        return new Map<String, Object> {
            'update_id' => 12312311L,
            'message' => new Map<String, Object> {
                'message_id' => 223123123L,
                'from' => new Map<String, Object> {
                    'id' => 876541222L,
                    'is_bot' => false,
                    'first_name' => null,
                    'last_name' => 'matsuev',
                    'username' => 'ilya.matsuev'
                },
                'date' => DateTime.now().getTime(),
                'chat' => new Map<String, Object> {
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
    }
}
