/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

public with sharing class BotRegistrationTokenHandler implements ITriggerHandler {

    public static final String HASH_ALGORITHM = 'SHA-256';


    public void handle(TriggerContext context, ITriggerService service) {
        List<Bot_Registration__c> registrations = context.newList;
        for (Bot_Registration__c registration: registrations) {
            registration.Hashed_Token__c = getHash(registration.Token__c);
        }
    }

    private String getHash(String text) {
        return EncodingUtil.convertToHex(Crypto.generateDigest(HASH_ALGORITHM, Blob.valueOf(text)));
    }
}
