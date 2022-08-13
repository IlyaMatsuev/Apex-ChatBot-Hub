public class BotPublicSiteUtils {
    private static final String BOT_PUBLIC_SITE_NAME = 'BotPublic';

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

    private BotPublicSiteUtils() {
    }

    public static String getApiUrl() {
        return botSiteDetails.SecureUrl + 'services/apexrest/bots/';
    }
}
