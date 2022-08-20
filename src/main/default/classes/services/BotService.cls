global abstract class BotService {
    protected final Bot__c bot;
    protected final BotUpdateModel updateModel;
    protected final BotSetting__mdt settings;

    protected BotService(Bot__c bot) {
        this(bot, null);
    }

    protected BotService(Bot__c bot, BotUpdateModel updateModel) {
        this.bot = bot;
        this.updateModel = updateModel;
        this.settings = getSettings();
    }

    /**
     * Send message back to the person that sent the message
     * @param message Message to send
     */
    global virtual void sendMessage(String message) {
        // TODO: Need to insert the new message but it can be done only after the handler execution
        // 1. An option would be to publish a platform event with the PublishImmidiately setting and upsert the records in event handler
        // 2. Another option is to create something like getSentMessages() method and then insert them with other records in BotUpdateHandler
        throw new BotServiceException('Not implemented: sendMessage()');
    }

    /**
     * Upsert a record. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param record SObject record to be upserted
     */
    global void save(SObject record) {
        save(new List<SObject>{ record });
    }

    /**
     * Upsert records. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     */
    global virtual void save(List<SObject> records) {
        save(records, null);
    }

    /**
     * Upsert records by the provided external id field.
     * This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution
     * @param records List of records to be upserted
     * @param externalId Field name of the external id for the provided objects
     */
    global virtual void save(List<SObject> records, String externalId) {
        Eventbus.publish(new BotUpsertDataEvent__e(Data__c = JSON.serialize(records), ExternalIdField__c = externalId));
    }

    protected HttpResponse call(String botMethod, Map<String, Object> body) {
        return call(botMethod, body, true);
    }

    protected HttpResponse call(String botMethod, Map<String, Object> body, Boolean throwOnFail) {
        HttpResponse response = new Http().send(prepareRequest(botMethod, body));
        if (throwOnFail && response.getStatusCode() != HttpConstants.STATUS_CODE_SUCCESS) {
            throw new CalloutException(
                'A call failed for the bot "' +
                bot.Name +
                '" and method "' +
                botMethod +
                '";\n' +
                response.getBody()
            );
        }
        return response;
    }

    protected virtual HttpRequest prepareRequest(String botMethod, Map<String, Object> body) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(settings.ApiUrl__c + bot.Token__c + '/' + botMethod);
        request.setMethod(HttpConstants.METHOD_POST);
        request.setHeader(HttpConstants.HEADER_NAME_CONTENT_TYPE, HttpConstants.HEADER_VALUE_CONTENT_TYPE_JSON);
        request.setBody(JSON.serialize(body));
        return request;
    }

    private BotSetting__mdt getSettings() {
        String serviceName = String.valueOf(this).split(':').get(0);
        String settingsName = serviceName.substringBefore(BotService.class.getName());
        List<BotSetting__mdt> settings = [
            SELECT DeveloperName, ApiUrl__c
            FROM BotSetting__mdt
            WHERE DeveloperName = :settingsName
            LIMIT 1
        ];
        if (settings.isEmpty()) {
            throw new SObjectException('No setting exists for the ' + serviceName + ' BotService class');
        }
        return settings.get(0);
    }

    public class BotServiceException extends Exception {
    }
}
