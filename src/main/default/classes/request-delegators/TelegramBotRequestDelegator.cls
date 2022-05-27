/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

public with sharing class TelegramBotRequestDelegator extends BotRequestDelegator {
    private final Map<String, String> JSON_FIELDS_REPLACE_MAP = new Map<String, String>{
        'from' => 'v_from',
        'date' => 'v_date'
    };

    public override String delegate(RestRequest request, Bot_Registration__c registration) {
        String jsonMessage = new JSONReplacer(request.requestBody.toString()).replace(JSON_FIELDS_REPLACE_MAP);
        TelegramUpdateWrapper updateWrapper = (TelegramUpdateWrapper) JSON.deserialize(
            jsonMessage,
            TelegramUpdateWrapper.class
        );
        TelegramBotService service = new TelegramBotService(updateWrapper, registration);
        List<IBotMessageListener> listeners = getListeners(
            registration.Name,
            ITelegramBotMessageListener.class.getName()
        );
        for (IBotMessageListener listener : listeners) {
            ((ITelegramBotMessageListener) listener).onMessage(service);
        }
        return CalloutHelper.OK_RESPONSE;
    }
}
