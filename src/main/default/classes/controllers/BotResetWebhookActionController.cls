public with sharing class BotResetWebhookActionController extends BotController {
    static {
        BotController.instance = new BotResetWebhookActionController();
    }

    @AuraEnabled(cacheable = true)
    public static void resetWebhook(String botId) {
        try {
            BotController.instance.getWebhookService(botId).setWebhook();
        } catch (Exception ex) {
            BotController.instance.handleBotException(botId, ex);
        }
    }
}
