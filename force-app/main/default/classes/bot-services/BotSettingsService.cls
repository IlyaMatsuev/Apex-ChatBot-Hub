/**
 * Created by Ilya Matsuev on 8/26/2020.
 */

public with sharing class BotSettingsService {

    private static final Map<String, Bot_Setting__mdt> settingsBySystemNames = new Map<String, Bot_Setting__mdt>();


    public static Bot_Setting__mdt getBotSettings(String systemName) {
        Bot_Setting__mdt settings = null;
        if (settingsBySystemNames.containsKey(systemName)) {
            settings = settingsBySystemNames.get(systemName);
        } else {
            List<Bot_Setting__mdt> settingsList = [
                    SELECT DeveloperName, API_Url__c
                    FROM Bot_Setting__mdt
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
