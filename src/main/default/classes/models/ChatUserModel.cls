/**
 * @description The `ChatUser__c` sObject model
 */
global virtual class ChatUserModel {
    private final ChatUser__c entity;

    public ChatUserModel(ChatUser__c entity) {
        this.entity = entity;
    }

    /**
     * @description The `ChatUser__c` sObject `Id` field value
     */
    global transient Id id { get { return entity.Id; } }

    /**
     * @description The `ChatUser__c` sObject `Username__c` field value
     */
    global transient String username { get { return entity.Username__c; } }

    /**
     * @description The `ChatUser__c` sObject `Name` field value
     */
    global transient String name { get { return entity.Name; } }

    /**
     * @description The `ChatUser__c` sObject `FirstName__c` field value
     */
    global transient String firstName { get { return entity.FirstName__c; } }

    /**
     * @description The `ChatUser__c` sObject `LastName__c` field value
     */
    global transient String lastName { get { return entity.LastName__c; } }

    /**
     * @description The `ChatUser__c` sObject `ExternalId__c` field value. The messanger's user id
     */
    global transient String externalId { get { return entity.ExternalId__c; } }
}
