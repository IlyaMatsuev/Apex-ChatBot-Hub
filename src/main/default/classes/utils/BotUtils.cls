public class BotUtils {
    private static final Integer CHAT_EXTERNAL_ID_LENGTH = 40;

    private BotUtils() {}

    public static void saveAsync(List<SObject> records, String externalIdField) {
        if (!records.isEmpty()) {
            Eventbus.publish(
                new BotUpsertDataEvent__e(Data__c = JSON.serialize(records), ExternalIdField__c = externalIdField)
            );
        }
    }

    public static String generateChatId(String botTokenHash, String chatExternalId) {
        if (chatExternalId.contains(':')) {
            return chatExternalId;
        }
        return (chatExternalId + ':').rightPad(CHAT_EXTERNAL_ID_LENGTH, botTokenHash);
    }

    public static Object createInstance(String typeName) {
        return createInstance(typeName, new Map<String, Object>());
    }

    public static Object createInstance(String typeName, Map<String, Object> params) {
        Type type = Type.forName(typeName);
        if (params.isEmpty()) {
            return type.newInstance();
        }
        return JSON.deserialize(JSON.serialize(params), type);
    }
}
