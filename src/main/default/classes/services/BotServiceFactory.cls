global virtual class BotServiceFactory {
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
