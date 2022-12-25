global class BotContext {
    global final Bot__c bot;
    global final BotUpdateModel received;
    global final Reply reply;

    private final BotServiceFactory factory;

    public BotContext(Bot__c bot, BotUpdateModel received, BotServiceFactory factory) {
        this.bot = bot;
        this.received = received;
        this.factory = factory;
        this.reply = new Reply(received, factory.createBotService(bot));
    }

    /**
     * Create BotService not related to the current context
     * @param bot SObject record of the bot you need to create service for
     */
    global BotService getService(Bot__c bot) {
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

    global class Reply {
        private final BotService service;
        private final BotUpdateModel received;

        private Reply(BotUpdateModel received, BotService service) {
            this.received = received;
            this.service = service;
        }

        global void send(String message) {
            service.send(String.valueOf(received.chat.id), message);
        }
    }
}
