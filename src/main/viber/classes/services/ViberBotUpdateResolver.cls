public class ViberBotUpdateResolver implements IBotUpdateResolver {
    public BotModel resolve(BotUpdateApi.UriParams params, Map<String, String> headers) {
        List<Bot__c> bots = [
            SELECT Name, Type__c, WebhookEvents__c, Token__c, TokenHash__c, Handler__c
            FROM Bot__c
            WHERE Id = :params.botId AND Type__c = :BotType.Viber.name() AND TokenHash__c = :params.token
            LIMIT 1
        ];
        return bots.isEmpty() ? null : new BotModel(bots.get(0));
    }
}
