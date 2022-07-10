public class BotSettingsService {
    private static final Map<String, BotSetting__mdt> settingsBySystemNames = new Map<String, BotSetting__mdt>();

    public static BotSetting__mdt getBotSettings(String systemName) {
        BotSetting__mdt settings = null;
        if (settingsBySystemNames.containsKey(systemName)) {
            settings = settingsBySystemNames.get(systemName);
        } else {
            List<BotSetting__mdt> settingsList = [
                SELECT DeveloperName, ApiUrl__c
                FROM BotSetting__mdt
                WHERE DeveloperName = :systemName
            ];
            if (!settingsList.isEmpty()) {
                settings = settingsList.get(0);
                settingsBySystemNames.put(systemName, settings);
            }
        }
        return settings;
    }
}
