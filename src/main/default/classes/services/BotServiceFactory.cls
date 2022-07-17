public virtual class BotServiceFactory {
    public BotService create(Bot__c bot) {
        BotType type = BotType.valueOf(bot.Type__c);
        if (type == BotType.Telegram) {
            return new TelegramBotService(bot);
        }
        throw new IllegalArgumentException('No service instance for the provided type: ' + type);
    }
}
