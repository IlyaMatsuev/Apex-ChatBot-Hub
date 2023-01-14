public class BotUtils {
    private static final String BOT_PUBLIC_SITE_NAME = 'BotPublic';
    private static final Integer CHAT_EXTERNAL_ID_LENGTH = 40;

    private static Site botSite {
        get {
            if (botSite == null) {
                botSite = [SELECT Id FROM Site WHERE Name = :BOT_PUBLIC_SITE_NAME LIMIT 1];
            }
            return botSite;
        }
        private set;
    }

    private static SiteDetail botSiteDetails {
        get {
            if (botSiteDetails == null) {
                // It's not possible to query by Durable.Name directly
                botSiteDetails = [SELECT SecureUrl FROM SiteDetail WHERE DurableId = :botSite.Id];
            }
            return botSiteDetails;
        }
        private set;
    }

    private BotUtils() {}

    public static String getApiUrl() {
        String siteUrl = botSiteDetails.SecureUrl;
        if (!siteUrl.endsWith('/')) {
            siteUrl += '/';
        }
        return siteUrl + 'services/apexrest/bots/';
    }

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
        return JSON.deserialize(JSON.serialize(params), Type.forName(typeName));
    }
}
