public class BotSettingsProvider {
    @TestVisible
    private static final Map<BotType, BotSetting__mdt> settings = new Map<BotType, BotSetting__mdt>();

    private BotSettingsProvider() {}

    public static BotSetting__mdt getSettings(BotType type) {
        if (!settings.containsKey(type)) {
            List<BotSetting__mdt> settingsList = [
                SELECT DeveloperName, ApiUrl__c
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
}
