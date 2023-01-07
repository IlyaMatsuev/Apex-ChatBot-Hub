public class ViberBotUpdateResolver implements IBotUpdateResolver {
    public Bot__c resolve(String botId, Map<String, String> headers) {
        // Viber doesn't provide the ability to pass the secret header, so just lookup by Id
        List<Bot__c> bots = [
            SELECT Name, Type__c, Token__c, TokenHash__c, Handler__c
            FROM Bot__c
            WHERE Id = :botId AND Type__c = :BotType.Viber.name()
            LIMIT 1
        ];
        return bots.isEmpty() ? null : bots.get(0);
    }
}
