public class BotSettingsProvider {
    private static final Integer SETTING_QUERY_LIMIT = 50;

    private static final Map<BotType, BotSetting__mdt> settings = new Map<BotType, BotSetting__mdt>();

    private BotSettingsProvider() {}

    static {
        initSettings();
    }

    public static BotSetting__mdt get(BotType type) {
        if (!settings.containsKey(type)) {
            throw new IllegalArgumentException('No setting exists for the ' + type + ' bot type');
        }
        return settings.get(type);
    }

    public static List<BotSetting__mdt> getAll() {
        return settings.values();
    }

    private static void initSettings() {
        List<BotSetting__mdt> allSettings = [
            SELECT
                DeveloperName,
                ApiUrl__c,
                BotService__c,
                BotWebhookService__c,
                BotCalloutService__c,
                BotUpdateResolver__c,
                BotUpdateEvent__c,
                BotHandlerContext__c,
                BaseBotHandler__c
            FROM BotSetting__mdt
            LIMIT :SETTING_QUERY_LIMIT
        ];
        for (BotSetting__mdt setting : allSettings) {
            settings.put(BotType.valueOf(setting.DeveloperName), setting);
        }

        if (Test.isRunningTest()) {
            mock();
        }
    }

    private static void mock() {
        settings.put(
            BotType.Telegram,
            new BotSetting__mdt(
                DeveloperName = BotType.Telegram.name(),
                ApiUrl__c = 'https://tg.bot-api.org/bot',
                BotService__c = 'TelegramBotService',
                BotUpdateEvent__c = 'TelegramUpdateEvent',
                BotHandlerContext__c = 'TelegramBotContext',
                BaseBotHandler__c = 'TelegramBotHandler',
                BotUpdateResolver__c = 'TelegramBotUpdateResolver',
                BotWebhookService__c = 'TelegramBotWebhookService',
                BotCalloutService__c = 'BotCalloutService'
            )
        );
        settings.put(
            BotType.Viber,
            new BotSetting__mdt(
                DeveloperName = BotType.Viber.name(),
                ApiUrl__c = 'https://vb.bot-api.org/bot',
                BotService__c = 'ViberBotService',
                BotUpdateEvent__c = 'ViberUpdateEvent',
                BotHandlerContext__c = 'ViberBotContext',
                BaseBotHandler__c = 'ViberBotHandler',
                BotUpdateResolver__c = 'ViberBotUpdateResolver',
                BotWebhookService__c = 'ViberBotWebhookService',
                BotCalloutService__c = 'ViberBotCalloutService'
            )
        );
    }
}
