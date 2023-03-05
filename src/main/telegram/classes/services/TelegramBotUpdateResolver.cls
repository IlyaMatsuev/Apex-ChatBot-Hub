public class TelegramBotUpdateResolver implements IBotUpdateResolver {
    private static final String SECRET_HEADER_NAME = 'X-Telegram-Bot-Api-Secret-Token';

    public BotModel resolve(BotUpdateApi.UriParams params, Map<String, String> headers) {
        String secret = headers.get(SECRET_HEADER_NAME);
        List<Bot__c> bots = [
            SELECT Name, Type__c, Token__c, TokenHash__c, Handler__c
            FROM Bot__c
            WHERE Id = :params.botId AND Type__c = :BotType.Telegram.name() AND TokenHash__c = :secret
            LIMIT 1
        ];
        return bots.isEmpty() ? null : new BotModel(bots.get(0));
    }
}
