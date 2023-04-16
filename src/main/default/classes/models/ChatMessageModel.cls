/**
 * @description The `ChatMessage__c` sObject model
 */
global virtual class ChatMessageModel {
    private final ChatMessage__c entity;

    public ChatMessageModel(ChatMessage__c entity) {
        this.entity = entity;
    }

    /**
     * @description The `ChatMessage__c` sObject `Id` field value
     */
    global transient Id id { get { return entity.Id; } }

    /**
     * @description The `ChatMessage__c` sObject `Text__c` field value
     */
    global transient String text { get { return entity.Text__c; } }

    /**
     * @description The `ChatMessage__c` sObject `MediaUrl__c` field value
     */
    global transient String mediaUrl { get { return entity.MediaUrl__c; } }

    /**
     * @description The instance of the <<ValueMap>> class based on `ChatMessage__c.Parameters__c` field value
     */
    global transient ValueMap parameters { get { return ValueMap.fromJson(entity.Parameters__c); } }

    /**
     * @description The instance of the <<BotMessageType>> enum based on `ChatMessage__c.Type__c` field value
     */
    global transient BotMessageType type { get { return BotMessageType.valueOf(entity.Type__c); } }

    /**
     * @description The `ChatMessage__c` sObject `SendDate__c` field value
     */
    global transient DateTime sendDate { get { return entity.SendDate__c; } }

    /**
     * @description The `ChatMessage__c` sObject `ExternalId__c` field value. The messanger's message id
     */
    global transient String externalId { get { return entity.ExternalId__c; } }

    /**
     * @description The instance of the <<ChatModel>> class based on `ChatMessage__c.Chat__c` field relationship. The chat where the message was sent
     */
    global transient ChatModel chat {
        get {
            if (chat == null && entity.getPopulatedFieldsAsMap().containsKey('Chat__c')) {
                chat = new ChatModel((Chat__c) entity.getSObject(ChatMessage__c.Chat__c));
            }
            return chat;
        }
        private set;
    }

    /**
     * @description The instance of the <<ChatUserModel>> class based on `ChatMessage__c.ChatUser__c` field relationship. The sender of the message
     */
    global transient ChatUserModel sender {
        get {
            if (sender == null && entity.getPopulatedFieldsAsMap().containsKey('User__c')) {
                sender = new ChatUserModel((ChatUser__c) entity.getSObject(ChatMessage__c.User__c));
            }
            return sender;
        }
        private set;
    }
}
