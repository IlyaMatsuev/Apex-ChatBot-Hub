public with sharing class BotWebhookStatusController {
    @TestVisible
    private static BotServiceFactory serviceFactory {
        get {
            if (serviceFactory == null) {
                serviceFactory = new BotServiceFactory();
            }
            return serviceFactory;
        }
        private set;
    }

    @AuraEnabled
    public static WebhookStatusViewModel getWebhookStatus(String botId) {
        BotWebhookService.WebhookInfo webhookInfo;
        try {
            webhookInfo = getWebhookService(botId).getWebhookInfo();
        } catch (Exception ex) {
            handleBotException(botId, ex);
        }
        return new WebhookStatusViewModel(webhookInfo);
    }

    @AuraEnabled
    public static void resetWebhook(String botId) {
        try {
            getWebhookService(botId).setWebhook();
        } catch (Exception ex) {
            handleBotException(botId, ex);
        }
    }

    private static BotWebhookService getWebhookService(String botId) {
        return serviceFactory.createWebhookService(getBot(botId));
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

    private static void handleBotException(String botId, Exception error) {
        BotErrorLogger.log(botId instanceof Id ? (Id) botId : null, error);
        throw new AuraHandledException('Something went wrong. Check the Bot Errors tab.');
    }

    public class WebhookStatusViewModel {
        @AuraEnabled
        public final Boolean isNotSet;
        @AuraEnabled
        public final Boolean isCorrectUrl;

        private WebhookStatusViewModel(BotWebhookService.WebhookInfo webhookInfo) {
            this.isNotSet = String.isBlank(webhookInfo.url);
            this.isCorrectUrl = webhookInfo.url == webhookInfo.expectedWebhookUrl;
        }
    }
}
