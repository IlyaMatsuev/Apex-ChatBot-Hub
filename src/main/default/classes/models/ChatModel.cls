/**
 * @description The `Chat__c` sObject model
 */
global virtual class ChatModel {
    private final Chat__c entity;

    public ChatModel(Chat__c entity) {
        this.entity = entity;
    }

    /**
     * @description The `Chat__c` sObject `Id` field value
     */
    global transient Id id { get { return entity.Id; } }

    /**
     * @description The `Chat__c` sObject `Name` field value. The chat title
     */
    global transient String title { get { return entity.Name; } }

    /**
     * @description The `Chat__c` sObject `ExternalId__c` field value. The messanger's chat id
     */
    global transient String externalId { get { return entity.ExternalId__c; } }
}
