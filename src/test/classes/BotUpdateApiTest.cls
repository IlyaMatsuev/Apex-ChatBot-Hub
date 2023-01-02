@IsTest(IsParallel = true)
private class BotUpdateApiTest {
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
    private static void post_telegramWebhookWithValidParams_shouldReturnOK() {
        Bot__c bot = [SELECT Id, TokenHash__c FROM Bot__c LIMIT 1];
        prepareRestContext('/' + BOT_TYPE + '/' + bot.Id, bot.TokenHash__c);

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        System.assertEquals('OK', response.responseBody.toString());
        System.assertEquals(200, response.statusCode);
    }

    @IsTest
    private static void post_telegramWebhookWithInvalidUrl_shouldReturnERROR() {
        Bot__c bot = [SELECT Id, TokenHash__c FROM Bot__c LIMIT 1];
        prepareRestContext('/' + bot.Id, bot.TokenHash__c);

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        System.assertEquals('ERROR', response.responseBody.toString());
        System.assertEquals(400, response.statusCode);
    }

    @IsTest
    private static void post_telegramWebhookWithInvalidSecret_shouldReturnERROR() {
        Bot__c bot = [SELECT Id, TokenHash__c FROM Bot__c LIMIT 1];
        prepareRestContext('/' + BOT_TYPE + '/' + bot.Id, 'dummy_hash');

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        System.assertEquals('ERROR', response.responseBody.toString());
        System.assertEquals(400, response.statusCode);
    }

    private static void prepareRestContext(String url, String secret) {
        RestRequest request = new RestRequest();
        request.httpMethod = 'POST';
        request.requestURI = 'services/apexrest/bots' + url;
        // We expect to receive the correct body from Messengers APIs therefore don't care about the content here
        request.requestBody = Blob.valueOf('{}');
        request.addHeader('Content-Type', 'application/json');
        request.addHeader('X-Telegram-Bot-Api-Secret-Token', secret);

        RestResponse response = new RestResponse();
        response.statusCode = 200;

        RestContext.request = request;
        RestContext.response = response;
    }

    public class TestBotHandler implements IBotHandler {
        public void handle(BotContext context) {}
    }
}
