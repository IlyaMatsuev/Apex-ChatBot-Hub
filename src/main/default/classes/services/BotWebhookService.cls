public abstract class BotWebhookService {
    private static final String BOT_PUBLIC_SITE_NAME = 'BotPublic';

    protected final BotModel bot;

    protected String webhookUrl { get { return getApiUrl() + bot.type + '/' + bot.id; } }

    protected BotCalloutService calloutService {
        get {
            if (calloutService == null) {
                calloutService = new BotServiceFactory().createCalloutService(bot);
            }
            return calloutService;
        }
        private set;
    }

    private static final Site botSite {
        get {
            if (botSite == null) {
                botSite = [SELECT Id FROM Site WHERE Name = :BOT_PUBLIC_SITE_NAME LIMIT 1];
            }
            return botSite;
        }
        private set;
    }

    private static final SiteDetail botSiteDetails {
        get {
            if (botSiteDetails == null) {
                // It's not possible to query by Durable.Name directly
                botSiteDetails = [SELECT SecureUrl FROM SiteDetail WHERE DurableId = :botSite.Id];
            }
            return botSiteDetails;
        }
        private set;
    }

    public abstract WebhookInfo getWebhookInfo();
    public abstract void setWebhook();
    public abstract void unsetWebhook();

    private String getApiUrl() {
        return botSiteDetails.SecureUrl + 'services/apexrest/bots/';
    }

    public class WebhookInfo {
        public final String url;
        public final String expectedWebhookUrl;

        public WebhookInfo(String url, String expectedWebhookUrl) {
            this.url = url;
            this.expectedWebhookUrl = expectedWebhookUrl;
        }
    }
}
