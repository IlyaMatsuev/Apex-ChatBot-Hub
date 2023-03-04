/**
 * @description Represents the context with all necessary variables and entities for properly handling the incoming updates for bot webhooks
 */
global class BotContext {
    /**
     * @description The `Bot__c` record associated with the current webhook update
     */
    global final Bot__c bot;

    /**
     * @description The model instance containing all incoming related to the incoming update (new message, edited message, etc.)
     */
    global final BotUpdateModel received;

    /**
     * @description The generic bot service instance with the methods common for all bots
     */
    global final IBotService service;

    /**
     * @description The type of the bot associated with the incoming update
     */
    global BotType type { get { return ((BotService) service).type; } }

    /**
     * @description The object with the most common methods for quick reply to the incoming updates
     */
    global IBotSenderService reply {
        get {
            if (reply == null) {
                reply = service.send(received.chat.id);
            }
            return reply;
        }
        private set;
    }

    private final BotServiceFactory factory;

    public BotContext(Bot__c bot, BotUpdateModel received, BotServiceFactory factory) {
        this.bot = bot;
        this.received = received;
        this.factory = factory;
        this.service = factory.createBotService(bot);
    }

    /**
     * Create BotService not related to the current context
     * @param bot SObject record of the bot you need to create service for
     */
    global IBotService getService(Bot__c bot) {
        if (this.bot.Id == bot?.Id) {
            return service;
        }
        return factory.createBotService(bot);
    }

    /**
     * Upsert a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param record SObject record to be upserted
     */
    global void save(SObject record) {
        save(new List<SObject> { record });
    }

    /**
     * Upsert records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     */
    global void save(List<SObject> records) {
        save(records, null);
    }

    /**
     * Upsert records asynchronously by the provided external id field.
     * This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     * @param externalIdField Field name of the external id for the provided objects
     */
    global void save(List<SObject> records, String externalIdField) {
        BotUtils.saveAsync(records, externalIdField);
    }
}
