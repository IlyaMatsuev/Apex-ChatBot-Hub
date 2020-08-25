/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

public abstract with sharing class BotRequestDelegator {

    public abstract void delegate(RestRequest request);

    public static BotRequestDelegator getDelegator(String botSystemName) {
        Type delegatorType = Type.forName(botSystemName + BotRequestDelegator.class.getName());
        if (delegatorType == null) {
            throw new BotRegistrationException(Label.NoBotRequestDelegatorsError.replace('%%%', botSystemName));
        }
        return (BotRequestDelegator) delegatorType.newInstance();
    }
}
