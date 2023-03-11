public class BotSettingsProvider {
    private static final Map<BotType, BotSetting__mdt> settings = new Map<BotType, BotSetting__mdt>();

    private BotSettingsProvider() {}

    public static BotSetting__mdt get(BotType type) {
        if (!settings.containsKey(type)) {
            List<BotSetting__mdt> settingsList = [
                SELECT
                    DeveloperName,
                    ApiUrl__c,
                    BotService__c,
                    BotWebhookService__c,
                    BotCalloutService__c,
                    BotUpdateResolver__c,
                    BotUpdateEventEntity__c,
                    EventTypesToIgnore__c
                FROM BotSetting__mdt
                WHERE DeveloperName = :type.name()
                LIMIT 1
            ];
            if (settingsList.isEmpty()) {
                throw new IllegalArgumentException('No setting exists for the ' + type + ' bot type');
            }
            settings.put(type, settingsList.get(0));
        }
        return settings.get(type);
    }

    @TestVisible
    private static void mock() {
        settings.put(
            BotType.Telegram,
            new BotSetting__mdt(
                DeveloperName = BotType.Telegram.name(),
                ApiUrl__c = 'https://tg.bot-api.org/bot',
                BotService__c = 'TelegramBotService',
                BotUpdateEventEntity__c = 'TelegramBotUpdateEventEntity',
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
                BotUpdateEventEntity__c = 'ViberBotUpdateEventEntity',
                BotUpdateResolver__c = 'ViberBotUpdateResolver',
                BotWebhookService__c = 'ViberBotWebhookService',
                EventTypesToIgnore__c = 'webhook',
                BotCalloutService__c = 'ViberBotCalloutService'
            )
        );
    }
}