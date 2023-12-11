public class BotPopulateTokenHashHandler implements Triggers.IHandler {
    public static final String HASH_ALGORITHM = 'SHA-256';

    public void handle(Triggers.Context context) {
        for (Bot__c bot : (List<Bot__c>) context.props.newList) {
            Bot__c oldBot = (Bot__c) context.props.oldMap?.get(bot.Id);
            if (isTokenChanged(bot, oldBot)) {
                bot.TokenHash__c = generateTokenHash(bot.Token__c);
            }
        }
    }

    private Boolean isTokenChanged(Bot__c bot, Bot__c oldBot) {
        return String.isBlank(bot.TokenHash__c) || oldBot == null || bot.Token__c != oldBot.Token__c;
    }

    private String generateTokenHash(String token) {
        return EncodingUtil.convertToHex(Crypto.generateDigest(HASH_ALGORITHM, Blob.valueOf(token)));
    }
}
