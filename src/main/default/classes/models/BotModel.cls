/**
 * @description The `Bot__c` sObject model
 */
global class BotModel {
    private final Bot__c entity;

    /**
     * @description The `Bot__c` sObject `Id` field value
     */
    global transient Id id { get { return entity.Id; } }

    /**
     * @description The `Bot__c` sObject `Name` field value
     */
    global transient String name { get { return entity.Name; } }

    /**
     * @description The instance of the <<BotType>> enum based on `Bot__c.Type__c` field value
     */
    global transient BotType type { get { return BotType.valueOf(entity.Type__c); } }

    public transient String token { get { return entity.Token__c; } }

    public transient String tokenHash { get { return entity.TokenHash__c; } }

    public transient IBotHandler handler { get { return (IBotHandler) BotUtils.createInstance(entity.Handler__c); } }

    /**
     * @description Create an instance of the model by the provided `Bot__c` record
     * @param entity The source `Bot__c` sObject record
     */
    global BotModel(Bot__c entity) {
        this.entity = entity;
    }

    /**
     * @description Converts the `BotModel` instance to JSON string
     * @return JSON serialized current instance
     */
    global String toJson() {
        return JSON.serialize(this);
    }

    /**
     * @description Checks if the passed object equals to the current instance
     * @param other Any object this instance is compared with
     * @return `true` if the passed object equals to the current instance by a reference or Id value
     */
    global Boolean equals(Object other) {
        return other instanceof BotModel && (this === other || this.id == ((BotModel) other).id);
    }

    /**
     * @description Converts the JSON string back to the <<BotModel>> instance
     * @param jsonStr The JSON string with serialized <<BotModel>>
     * @return The new <<BotModel>> instance
     */
    global static BotModel fromJson(String jsonStr) {
        return (BotModel) JSON.deserialize(jsonStr, BotModel.class);
    }
}
