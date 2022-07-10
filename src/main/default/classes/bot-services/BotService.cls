public abstract class BotService {
    public Bot__c registration { get; protected set; }
    public BotSetting__mdt botSettings {
        get {
            return BotSettingsService.getBotSettings(registration.Type__c);
        }
    }

    public BotService(Bot__c registration) {
        this.registration = registration.clone(true, false, false, false);
    }

    protected abstract String getEndpoint(String method);

    protected virtual String getEndpoint(String method, Map<String, String> params) {
        return getEndpoint(method) + CalloutHelper.buildUrlParams(params);
    }
}
