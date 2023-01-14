/**
 * @description Factory for creating bot services
 */
global virtual class BotServiceFactory {
    /**
     * @description Creates an instance of the `BotService` for the passed `Bot__c` record. For example a bot with the type `Telegram` should be related to `TelegramBotService`
     * @param bot The `Bot__c` record to create service instance for
     * @return The instance of `BotService`
     */
    global virtual BotService createBotService(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        return (BotService) createService(BotSettingsProvider.get(type).BotService__c, bot);
    }

    public virtual WebhookBotService createWebhookService(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        return (WebhookBotService) createService(BotSettingsProvider.get(type).WebhookBotService__c, bot);
    }

    private Object createService(String typeName, Bot__c bot) {
        return BotUtils.createInstance(typeName, new Map<String, Object> { 'bot' => bot });
    }
}
