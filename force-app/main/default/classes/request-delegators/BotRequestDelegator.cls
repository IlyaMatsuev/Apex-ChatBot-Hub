/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

public abstract with sharing class BotRequestDelegator {

    public static final Integer LISTENERS_LIMIT = 20;


    public abstract void delegate(RestRequest request, Bot_Registration__c registration);


    protected List<IBotMessageListener> getListeners(String registrationName, String listenerInterfaceName) {
        List<ApexClass> matches = (List<ApexClass>) [
                FIND :listenerInterfaceName
                IN ALL FIELDS
                RETURNING ApexClass(Name WHERE Name != :listenerInterfaceName LIMIT :LISTENERS_LIMIT)
        ].get(0);
        Set<String> listenersNames = new Set<String>();
        for (ApexClass matchClass: matches) {
            if (Type.forName(listenerInterfaceName).isAssignableFrom(Type.forName(matchClass.Name))) {
                listenersNames.add(matchClass.Name);
            }
        }
        List<IBotMessageListener> listeners = new List<IBotMessageListener>();
        for (String listenerName: listenersNames) {
            IBotMessageListener abstractListener = (IBotMessageListener) Type.forName(listenerName).newInstance();
            if (abstractListener != null && abstractListener.getRegistrationName() == registrationName) {
                listeners.add(abstractListener);
            }
        }
        return listeners;
    }


    public static BotRequestDelegator getDelegator(String botSystemName) {
        Type delegatorType = Type.forName(botSystemName + BotRequestDelegator.class.getName());
        if (delegatorType == null) {
            throw new BotRegistrationException(Label.NoBotRequestDelegatorsError.replace('%%%', botSystemName));
        }
        return (BotRequestDelegator) delegatorType.newInstance();
    }
}
