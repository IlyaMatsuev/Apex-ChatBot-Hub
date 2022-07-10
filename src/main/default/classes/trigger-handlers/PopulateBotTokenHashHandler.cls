public class PopulateBotTokenHashHandler implements Triggers.IHandler {
    public static final String HASH_ALGORITHM = 'SHA-256';

    public void handle(Triggers.Context context) {
        for (Bot__c bot : (List<Bot__c>) context.newList) {
            bot.TokenHash__c = EncodingUtil.convertToHex(
                Crypto.generateDigest(HASH_ALGORITHM, Blob.valueOf(bot.Token__c))
            );
        }
    }
}
