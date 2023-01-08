public interface IBotUpdateResolver {
    Bot__c resolve(BotUpdateApi.UriParams params, Map<String, String> headers);
}
