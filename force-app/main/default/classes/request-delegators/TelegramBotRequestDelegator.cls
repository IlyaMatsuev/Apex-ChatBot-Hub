/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

public with sharing class TelegramBotRequestDelegator extends BotRequestDelegator {

    private final Map<String, String> JSON_FIELDS_REPLACE_MAP = new Map<String, String> {
            'from' => 'v_from',
            'date' => 'v_date'
    };


    public override void delegate(RestRequest request, Bot_Registration__c registration) {
        String jsonMessage = new JSONReplacer(request.requestBody.toString()).replace(JSON_FIELDS_REPLACE_MAP);
        TelegramUpdateWrapper updateWrapper = (TelegramUpdateWrapper) JSON.deserialize(jsonMessage, TelegramUpdateWrapper.class);
        List<ITelegramBotMessageListener> listeners = castListeners(getListeners(registration.Name, ITelegramBotMessageListener.class.getName()));
        // TODO: implement abstract logic for the service classes
        TelegramBotService service = new TelegramBotService(updateWrapper, registration);
        for (ITelegramBotMessageListener listener: listeners) {
            // TODO: try to run in separate transactions
            listener.onMessage(service);
        }
    }


    private List<ITelegramBotMessageListener> castListeners(List<IBotMessageListener> abstractListeners) {
        List<ITelegramBotMessageListener> listeners = new List<ITelegramBotMessageListener>();
        for (IBotMessageListener abstractListener: abstractListeners) {
            listeners.add((ITelegramBotMessageListener) abstractListener);
        }
        return listeners;
    }
}
