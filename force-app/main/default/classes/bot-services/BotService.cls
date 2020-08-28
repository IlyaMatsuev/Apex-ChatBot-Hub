/**
 * Created by Ilya Matsuev on 8/28/2020.
 */

public with sharing abstract class BotService {

    public Bot_Registration__c registration {get; protected set;}
    public Bot_Setting__mdt botSettings {
        get {
            return BotSettingsService.getBotSettings(registration.System__c);
        }
    }

    public BotService(Bot_Registration__c registration) {
        this.registration = registration.clone(true, false, false, false);
    }


    protected abstract String getEndpoint(String method);

    protected virtual String getEndpoint(String method, Map<String, String> params) {
        return getEndpoint(method) + CalloutHelper.buildUrlParams(params);
    }
}
