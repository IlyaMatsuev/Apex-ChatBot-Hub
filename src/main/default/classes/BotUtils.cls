public class BotUtils {
    private static final String URL_REGEX = '^(((https?:(?:\\/\\/)?)(?:[-;:&=\\+\\$,\\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\\+\\$,\\w]+@)[A-Za-z0-9.-]+)((?:\\/[\\+~%\\/.\\w-_]*)?\\??(?:[-\\+=&;%@.\\w_#]*)#?(?:[.\\!\\/\\w]*))?)$';
    private static final Integer EXTERNAL_ID_LENGTH = 40;

    private BotUtils() {}

    public static void saveAsync(List<SObject> records, String externalIdField) {
        if (!records.isEmpty()) {
            Eventbus.publish(
                new BotUpsertDataEvent__e(Data__c = JSON.serialize(records), ExternalIdField__c = externalIdField)
            );
        }
    }

    public static Boolean isUrl(String text) {
        return Pattern.matches(URL_REGEX, text);
    }

    public static String generateExternalId(String sourceExternalId, String salt) {
        if (sourceExternalId.contains(':')) {
            return sourceExternalId;
        }
        String sourceSaltValue = salt.substringBefore(':');
        String concatenatedExternalId = sourceExternalId + ':' + sourceSaltValue;
        if (concatenatedExternalId.length() <= EXTERNAL_ID_LENGTH) {
            return concatenatedExternalId;
        }
        return (sourceExternalId + ':').rightPad(EXTERNAL_ID_LENGTH, sourceSaltValue);
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
