/**
 * Created by Ilya Matsuev on 8/26/2020.
 */

public with sharing class VKBotRequestDelegator extends BotRequestDelegator {

    private final Map<String, String> JSON_FIELDS_REPLACE_MAP = new Map<String, String> {
            'object' => 'v_object',
            'date' => 'v_date'
    };

    private final String CONFIRMATION_MESSAGE_EVENT_TYPE = 'confirmation';
    private final String NEW_MESSAGE_EVENT_TYPE = 'message_new';


    public override String delegate(RestRequest request, Bot_Registration__c registration) {
        Map<String, Object> updateWrapper = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());
        VKBotService service = null;
        String response = CalloutHelper.OK_RESPONSE;
        String updateType = (String) updateWrapper.get('type');

        if (updateType == CONFIRMATION_MESSAGE_EVENT_TYPE) {
            service = new VKBotService(registration);
            response = getConfirmationCode(service, (Integer) updateWrapper.get('group_id'));
        } else if (updateType == NEW_MESSAGE_EVENT_TYPE) {
            String jsonMessage = new JSONReplacer(request.requestBody.toString()).replace(JSON_FIELDS_REPLACE_MAP);
            VKNewMessageResponseWrapper newMessageWrapper = (VKNewMessageResponseWrapper) JSON.deserialize(jsonMessage, VKNewMessageResponseWrapper.class);
            service = new VKBotService(registration, newMessageWrapper);
            List<IBotMessageListener> listeners = getListeners(registration.Name, IVKBotMessageListener.class.getName());
            for (IBotMessageListener listener: listeners) {
                ((IVKBotMessageListener) listener).onMessage(service);
            }
            return CalloutHelper.OK_RESPONSE;
        }
        return response;
    }


    private String getConfirmationCode(VKBotService botService, Integer groupId) {
        Callout receiveConfirmCode = botService.getCallbackConfirmationCode(groupId);
        VKWebHookConfirmResponseWrapper confirmResponseWrapper = (VKWebHookConfirmResponseWrapper) JSON.deserialize(
                receiveConfirmCode.responseBody,
                VKWebHookConfirmResponseWrapper.class
        );
        return confirmResponseWrapper.response.code;
    }
}
