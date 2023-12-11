@IsTest(isParallel = true)
private class BotUpdateApiTest {
    /**
     * Telegram tests
     */

    @IsTest
    private static void post_telegramWebhookWithValidParams_shouldReturnOK() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        Bot__c bot = prepareBot(BotType.Telegram);
        prepareRestContext('/' + BotType.Telegram + '/' + bot.Id);
        RestContext.request.addHeader('X-Telegram-Bot-Api-Secret-Token', bot.TokenHash__c);

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        Assert.areEqual('OK', response.responseBody.toString());
        Assert.areEqual(200, response.statusCode);
    }

    @IsTest
    private static void post_telegramWebhookWithInvalidUrl_shouldReturnERROR() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        Bot__c bot = prepareBot(BotType.Telegram);
        prepareRestContext('/' + bot.Id);
        RestContext.request.addHeader('X-Telegram-Bot-Api-Secret-Token', bot.TokenHash__c);

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        Assert.areEqual('ERROR', response.responseBody.toString());
        Assert.areEqual(400, response.statusCode);
    }

    @IsTest
    private static void post_telegramWebhookWithInvalidSecret_shouldReturnERROR() {
        Test.setMock(HttpCalloutMock.class, new TelegramBotCalloutMock());

        Bot__c bot = prepareBot(BotType.Telegram);
        prepareRestContext('/' + BotType.Telegram + '/' + bot.Id);
        RestContext.request.addHeader('X-Telegram-Bot-Api-Secret-Token', 'dummy_hash');

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        Assert.areEqual('ERROR', response.responseBody.toString());
        Assert.areEqual(400, response.statusCode);
    }

    /**
     * Viber tests
     */

    @IsTest
    private static void post_viberWebhookWithValidParams_shouldReturnOK() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        Bot__c bot = prepareBot(BotType.Viber);
        prepareRestContext('/' + BotType.Viber + '/' + bot.Id + '/' + bot.TokenHash__c);

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        Assert.areEqual('OK', response.responseBody.toString());
        Assert.areEqual(200, response.statusCode);
    }

    @IsTest
    private static void post_viberWebhookWithInvalidUrl_shouldReturnERROR() {
        Test.setMock(HttpCalloutMock.class, new ViberBotCalloutMock());

        Bot__c bot = prepareBot(BotType.Viber);
        prepareRestContext('/' + bot.Id);

        BotUpdateApi.post();

        RestResponse response = RestContext.response;
        Assert.areEqual('ERROR', response.responseBody.toString());
        Assert.areEqual(400, response.statusCode);
    }

    private static Bot__c prepareBot(BotType type) {
        insert new Bot__c(
            Name = type.name(),
            Type__c = type.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t72317g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return [SELECT Id, TokenHash__c FROM Bot__c WHERE Type__c = :type.name() LIMIT 1];
    }

    private static void prepareRestContext(String url) {
        RestRequest request = new RestRequest();
        request.httpMethod = 'POST';
        request.requestURI = '/bots' + url;
        // We expect to receive the correct body from Messengers APIs therefore don't care about the content here
        request.requestBody = Blob.valueOf('{}');
        request.addHeader('Content-Type', 'application/json');

        RestResponse response = new RestResponse();
        response.statusCode = 200;

        RestContext.request = request;
        RestContext.response = response;
    }
}
