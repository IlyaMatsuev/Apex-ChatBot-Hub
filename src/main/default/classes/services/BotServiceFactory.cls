/**
 * @description Factory for creating bot services
 */
global virtual class BotServiceFactory {
    /**
     * @description Creates an instance of the <<IBotService>> implementation for the passed <<BotModel>> instance. For example a bot with the type `Telegram` should be related to <<TelegramBotService>>
     * @param bot The <<BotModel>> instance to create service for
     * @return The instance of <<IBotService>>
     */
    global virtual IBotService createBotService(BotModel bot) {
        return (IBotService) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }

    public virtual BotWebhookService createWebhookService(BotModel bot) {
        return (BotWebhookService) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotWebhookService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }

    public virtual BotCalloutService createCalloutService(BotModel bot) {
        return (BotCalloutService) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotCalloutService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }
}
