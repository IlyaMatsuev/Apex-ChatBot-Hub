/**
 * @description Factory for creating bot services
 */
global virtual class BotServiceFactory {
    /**
     * @description Creates an instance of the <<IBotService>> implementation for the passed `Bot__c` record. For example a bot with the type `Telegram` should be related to <<TelegramBotService>>
     * @param bot The `Bot__c` record to create service instance for
     * @return The instance of <<IBotService>>
     */
    global virtual IBotService createBotService(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        return (IBotService) BotUtils.createInstance(
            BotSettingsProvider.get(type).BotService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }

    public virtual BotWebhookService createWebhookService(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        return (BotWebhookService) BotUtils.createInstance(
            BotSettingsProvider.get(type).BotWebhookService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }

    public virtual BotCalloutService createCalloutService(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        return (BotCalloutService) BotUtils.createInstance(
            BotSettingsProvider.get(type).BotCalloutService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }
}
