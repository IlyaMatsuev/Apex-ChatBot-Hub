/**
 * @description Factory for creating bot services
 */
global virtual class BotServiceFactory {
    private static final Set<String> BOT_SERVICE_REQUIRED_FIELDS = new Set<String> {
        String.valueOf(Bot__c.Id),
        String.valueOf(Bot__c.Name),
        String.valueOf(Bot__c.Type__c),
        String.valueOf(Bot__c.Handler__c),
        String.valueOf(Bot__c.Token__c),
        String.valueOf(Bot__c.TokenHash__c)
    };

    private static final Set<String> BOT_WEBHOOK_SERVICE_REQUIRED_FIELDS = new Set<String> {
        String.valueOf(Bot__c.Id),
        String.valueOf(Bot__c.Name),
        String.valueOf(Bot__c.Type__c),
        String.valueOf(Bot__c.WebhookEvents__c),
        String.valueOf(Bot__c.Token__c),
        String.valueOf(Bot__c.TokenHash__c)
    };

    private static final Set<String> BOT_CALLOUT_SERVICE_REQUIRED_FIELDS = new Set<String> {
        String.valueOf(Bot__c.Id),
        String.valueOf(Bot__c.Name),
        String.valueOf(Bot__c.Type__c),
        String.valueOf(Bot__c.Token__c)
    };

    /**
     * @description Creates an instance of the <<IBotService>> implementation for the passed <<BotModel>> instance. For example a bot with the type `Telegram` should be related to <<TelegramBotService>>
     * @param bot The <<BotModel>> instance to create service for
     * @throws BotMissingRequiredFieldsException If the bot model is missing some fields that is required for bot service creation
     * @return The instance of <<IBotService>>
     */
    global virtual IBotService createBotService(BotModel bot) {
        verifyAllRequiredFields(bot, BOT_SERVICE_REQUIRED_FIELDS);
        return (IBotService) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }

    public virtual BotWebhookService createWebhookService(BotModel bot) {
        verifyAllRequiredFields(bot, BOT_WEBHOOK_SERVICE_REQUIRED_FIELDS);
        return (BotWebhookService) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotWebhookService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }

    public virtual BotCalloutService createCalloutService(BotModel bot) {
        verifyAllRequiredFields(bot, BOT_CALLOUT_SERVICE_REQUIRED_FIELDS);
        return (BotCalloutService) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotCalloutService__c,
            new Map<String, Object> { 'bot' => bot }
        );
    }

    public virtual IBotContext createBotContext(BotModel bot, String updatePayload) {
        verifyAllRequiredFields(bot, BOT_SERVICE_REQUIRED_FIELDS);
        return (IBotContext) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotHandlerContext__c,
            new Map<String, Object> { 'bot' => bot, 'updatePayload' => updatePayload, 'factory' => this }
        );
    }

    public virtual IBotUpdateEvent createBotUpdateEvent(BotModel bot, String updatePayload) {
        verifyAllRequiredFields(bot, new Set<String> { String.valueOf(Bot__c.Type__c) });
        return (IBotUpdateEvent) BotUtils.createInstance(
            BotSettingsProvider.get(bot.type).BotUpdateEvent__c,
            new Map<String, Object> { 'initialPayload' => updatePayload }
        );
    }

    private void verifyAllRequiredFields(BotModel bot, Set<String> requiredFields) {
        Set<String> missingRequiredFields = new Set<String>();
        Map<String, Object> botQueriedFields = bot.getSObject().getPopulatedFieldsAsMap();
        for (String requiredField : requiredFields) {
            if (!botQueriedFields.containsKey(requiredField)) {
                missingRequiredFields.add(requiredField);
            }
        }
        if (!missingRequiredFields.isEmpty()) {
            throw new BotMissingRequiredFieldsException(
                'Not all required fields are selected for the bot model: ',
                missingRequiredFields
            );
        }
    }

    /**
     * @description Exception that is thrown when there are missing required fields in the provided bot model
     */
    global class BotMissingRequiredFieldsException extends BotCustomException {
        public BotMissingRequiredFieldsException(String message, Set<String> missingFields) {
            super(
                message + String.join(new List<String>(missingFields), ', '),
                new BotJsonPayload().set('fields', missingFields)
            );
        }
    }
}
