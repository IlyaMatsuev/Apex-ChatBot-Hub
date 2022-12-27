public interface IBotUpdateResolver {
    Bot__c resolve(String botId, Map<String, String> headers);
}
