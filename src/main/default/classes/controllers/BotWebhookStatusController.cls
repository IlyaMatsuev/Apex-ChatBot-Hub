public with sharing class BotWebhookStatusController extends BotController {
    static {
        BotController.instance = new BotWebhookStatusController();
    }

    @AuraEnabled
    public static WebhookStatusViewModel getWebhookStatus(String botId) {
        BotWebhookService.WebhookInfo webhookInfo;
        try {
            webhookInfo = BotController.instance.getWebhookService(botId).getWebhookInfo();
        } catch (Exception ex) {
            BotController.instance.handleBotException(botId, ex);
        }
        return new WebhookStatusViewModel(webhookInfo);
    }

    @AuraEnabled
    public static void resetWebhook(String botId) {
        try {
            BotController.instance.getWebhookService(botId).setWebhook();
        } catch (Exception ex) {
            BotController.instance.handleBotException(botId, ex);
        }
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
