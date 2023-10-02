public with sharing class BotResetWebhookActionController {
    @TestVisible
    private static BotServiceFactory serviceFactory {
        get {
            if (serviceFactory == null) {
                serviceFactory = new BotServiceFactory();
            }
            return serviceFactory;
        }
        set;
    }

    @AuraEnabled(cacheable = true)
    public static void resetWebhook(String botId) {
        try {
            BotModel bot = getBot(botId);
            BotWebhookService webhookService = serviceFactory.createWebhookService(bot);
            webhookService.setWebhook();
        } catch (Exception ex) {
            BotErrorLogger.log(botId instanceof Id ? (Id) botId : null, ex);
            throw new AuraHandledException('Something went wrong. Check the Bot Errors tab.');
        }
    }

    private static BotModel getBot(String botId) {
        List<Bot__c> matching = [
            SELECT Name, Type__c, WebhookEvents__c, Token__c, TokenHash__c
            FROM Bot__c
            WHERE Id = :botId
            LIMIT 1
        ];
        if (matching.isEmpty()) {
            throw new QueryException('The bot record does not exist anymore. Try refreshing the page.');
        }
        return new BotModel(matching.get(0));
    }
}
