/**
 * @description Describes the context methods that are common for all bot types
 */
global interface IBotContext {
    /**
     * @description Returns the bot model related to the received update
     * @return The instance of the <<BotModel>> class
     */
    BotModel getBot();

    /**
     * @description Provides methods for replying on the received update. E.g. send a message back
     * @return The instance of the <<IBotSenderService>> interface
     */
    IBotSenderService reply();

    /**
     * @description Returns a received update event
     * @return The instance of the <<IBotUpdateEvent>> interface
     */
    IBotUpdateEvent getUpdateEvent();

    /**
     * @description Returns an instance of the <<IBotService>> for the current bot type
     * @return The instance of the <<IBotService>> interface
     */
    IBotService getService();

    /**
     * @description Creates a bot service instance not related to the current context
     * @param bot The <<BotModel>> instance related to the bot you need to create service for
     * @return The instance of the <<IBotService>> interface
     */
    IBotService getService(BotModel bot);

    /**
     * @description Upserts a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param record SObject record to be upserted
     */
    void save(SObject record);

    /**
     * @description Upserts multiple records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     */
    void save(List<SObject> records);

    /**
     * @description Upserts multiple records asynchronously by the provided external id field. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     * @param externalIdField Field name of the external id for the provided objects
     */
    void save(List<SObject> records, String externalIdField);
}
