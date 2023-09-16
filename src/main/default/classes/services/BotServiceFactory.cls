/**
 * @description Factory for creating bot services
 */
global virtual class BotServiceFactory {
    /**
     * @description Creates an instance of the <<IBotService>> implementation for the passed <<BotModel>> instance. For example a bot with the type `Telegram` should be related to <<TelegramBotService>>
     * @param bot The <<BotModel>> instance to create service for
     * @return The instance of <<IBotService>>
     */
    // TODO: Always require all bot fields to be selected
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

    public virtual IBotContext createBotContext(BotModel bot, String updatePayload) {
        return (IBotContext) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotHandlerContext__c,
            new Map<String, Object> { 'bot' => bot, 'updatePayload' => updatePayload, 'factory' => this }
        );
    }

    public virtual IBotUpdateEvent createBotUpdateEvent(BotModel bot, String updatePayload) {
        return (IBotUpdateEvent) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotUpdateEvent__c,
            new Map<String, Object> { 'initialPayload' => updatePayload }
        );
    }
}
