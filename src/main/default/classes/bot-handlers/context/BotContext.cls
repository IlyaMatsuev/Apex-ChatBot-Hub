/**
 * @description Represents the context with all necessary variables and entities for properly handling the incoming updates for bot
 */
global abstract class BotContext implements IBotContext {
    /**
     * @description The <<BotModel>> instance associated with the current update
     */
    global final BotModel bot;

    protected transient ValueMap updateEntity {
        get {
            if (updateEntity == null) {
                updateEntity = ValueMap.fromJson(updatePayload, getUpdateEntityType());
            }
            return updateEntity;
        }
        private set;
    }

    protected transient IBotService service {
        get {
            if (service == null) {
                service = getService(bot);
            }
            return service;
        }
        private set;
    }

    private final String updatePayload;
    private final BotServiceFactory factory;

    protected BotContext() {}

    /**
     * @description Creates a bot service instance not related to the current context
     * @param bot The <<BotModel>> instance related to the bot you need to create service for
     * @return The instance of the <<IBotService>> interface
     */
    global IBotService getService(BotModel bot) {
        return factory.createBotService(bot);
    }

    /**
     * @description Upserts a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param record SObject record to be upserted
     */
    global void save(SObject record) {
        save(new List<SObject> { record });
    }

    /**
     * @description Upserts multiple records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     */
    global void save(List<SObject> records) {
        save(records, null);
    }

    /**
     * @description Upserts multiple records asynchronously by the provided external id field. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     * @param externalIdField Field name of the external id for the provided objects
     */
    global void save(List<SObject> records, String externalIdField) {
        BotUtils.saveAsync(records, externalIdField);
    }

    // Using virtual with exception because not possible to have protected abstract in global class
    protected virtual Type getUpdateEntityType() {
        throw new TypeException('Not possible to initialize the update payload.');
    }
}
