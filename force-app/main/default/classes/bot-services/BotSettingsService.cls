/**
 * Created by Ilya Matsuev on 8/26/2020.
 */

public with sharing class BotSettingsService {

    public static Bot_Setting__mdt getBotSettings(String systemName) {
        List<Bot_Setting__mdt> settingsList = [
                SELECT DeveloperName, API_Url__c
                FROM Bot_Setting__mdt
                WHERE DeveloperName = :systemName
        ];
        Bot_Setting__mdt settings = null;
        if (!settingsList.isEmpty()) {
            settings = settingsList.get(0);
        }
        return settings;
    }
}
