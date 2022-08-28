global virtual class BotServiceFactory {
    global virtual BotService createBotService(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        if (type == BotType.Telegram) {
            return new TelegramBotService(bot);
        }
        throw new IllegalArgumentException('No service instance for the provided type: ' + type);
    }

    public virtual WebhookBotService createWebhookService(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        if (type == BotType.Telegram) {
            return new TelegramWebhookBotService(bot);
        }
        throw new IllegalArgumentException('No webhook service instance for the provided type: ' + type);
    }
}
