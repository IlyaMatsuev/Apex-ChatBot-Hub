@IsTest(isParallel = true)
private class BotResetWebhookActionControllerTest {

    @IsTest
    private static void resetWebhook_withBotId_shouldSetWebhook() {
        BotResetWebhookActionController.serviceFactory = new BotServiceFactoryMock();
        Bot__c bot = createBot(BotType.Telegram);

        BotResetWebhookActionController.resetWebhook(bot.Id);

        Assert.areEqual(1, BotWebhookServiceMock.setWebhookCallCount);
        Assert.areEqual(0, BotWebhookServiceMock.unsetWebhookCallCount);
    }

    @IsTest
    private static void resetWebhook_withoutMatchingBot_shouldThrowException() {
        try {
            BotResetWebhookActionController.serviceFactory = new BotServiceFactoryMock();

            BotResetWebhookActionController.resetWebhook('some_random_id');
            Assert.fail('Exception should have been thrown');
        } catch (Exception ex) {
            Assert.isInstanceOfType(ex, AuraHandledException.class);
            Assert.areEqual(0, BotWebhookServiceMock.setWebhookCallCount);
            Assert.areEqual(0, BotWebhookServiceMock.unsetWebhookCallCount);
        }
    }

    private static Bot__c createBot(BotType type) {
        insert new Bot__c(
            Name = 'Test Bot',
            Type__c = type.name(),
            WebhookEvents__c = 'message',
            Token__c = '74712731t72317g2717283',
            Handler__c = 'BotHandlerMock'
        );
        return [SELECT Id, TokenHash__c FROM Bot__c WHERE Type__c = :type.name() LIMIT 1];
    }

    private class BotServiceFactoryMock extends BotServiceFactory {
        public override BotWebhookService createWebhookService(BotModel bot) {
            return new BotWebhookServiceMock();
        }
    }
}
