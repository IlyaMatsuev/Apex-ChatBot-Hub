/**
 * Created by Ilya Matsuev on 8/16/2020.
 */

public abstract with sharing class WebHookResolver {

    public abstract Callout setWebHook(Bot_Registration__c registration, Bot_Setting__mdt settings);
    public abstract Callout resetWebHook(Bot_Registration__c registration, Bot_Setting__mdt settings);

    public static WebHookResolver getResolver(String botSystemName) {
        Type resolverType = Type.forName(botSystemName + WebHookResolver.class.getName());
        if (resolverType == null) {
            throw new BotRegistrationException(Label.NoWebHookResolversError.replace('%%%', botSystemName));
        }
        return (WebHookResolver) resolverType.newInstance();
    }
}
