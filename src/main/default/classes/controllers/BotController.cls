public with sharing abstract class BotController {
    @TestVisible
    public static BotController instance { get; protected set; }

    @TestVisible
    protected BotServiceFactory serviceFactory {
        get {
            if (serviceFactory == null) {
                serviceFactory = new BotServiceFactory();
            }
            return serviceFactory;
        }
        private set;
    }

    protected BotWebhookService getWebhookService(String botId) {
        return serviceFactory.createWebhookService(getBot(botId));
    }

    protected BotModel getBot(String botId) {
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

    protected void handleBotException(String botId, Exception error) {
        BotErrorLogger.log(botId instanceof Id ? (Id) botId : null, error);
        throw new AuraHandledException('Something went wrong. Check the Bot Errors tab.');
    }
}
