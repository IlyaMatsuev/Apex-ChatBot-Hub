/**
 * Created by Ilya Matsuev on 8/26/2020.
 */

global with sharing class VKBotService extends BotService {

    // token - 4782b317682177f76ea43460f01f9ad3186e713ed60b7ce4f9f7b7e3d6e7c585b54d22aab906dd90e4c14
    public static final String VK_API_VERSION = '5.122';

    private static final Map<String, String> VK_BOT_REQUEST_HEADERS = new Map<String, String>{
            CalloutHelper.CONTENT_TYPE_HEADER => CalloutHelper.URL_ENCODED_TYPE
    };

    public VKNewMessageResponseWrapper updateWrapper {get; private set;}

    global VKBotService(Bot_Registration__c registration) {
        super(registration);
    }

    public VKBotService(Bot_Registration__c registration, VKNewMessageResponseWrapper updateWrapper) {
        super(registration);
        this.updateWrapper = updateWrapper;
    }


    global Callout setWebHook(String url) {
        registration.Group_Id__c = getBotGroupId(getBotGroupId());
        Map<String, String> params = new Map<String, String> {
                'title' => registration.Name,
                'group_id' => registration.Group_Id__c,
                'url' => url,
                'secret_key' => registration.Hashed_Token__c.substring(0, 10)
        };
        Callout webHookSet = new Callout(
                getEndpoint('groups.addCallbackServer', params),
                CalloutHelper.METHOD_GET
        );
        if (webHookSet.isSuccess()) {
            VKWebHookSetResponseWrapper webHookSetResponseWrapper = (VKWebHookSetResponseWrapper) JSON.deserialize(
                    webHookSet.responseBody,
                    VKWebHookSetResponseWrapper.class
            );
            registration.WebHook_Server_Id__c = String.valueOf(webHookSetResponseWrapper.response.server_id);
            setCallbackSettings();
            TriggerContext.skipAllHandlers();
            update registration;
            TriggerContext.doNotSkipAllHandlers();
        }
        return webHookSet;
    }

    global Callout deleteWebHook() {
        Map<String, String> params = new Map<String, String> {
                'group_id' => registration.Group_Id__c,
                'server_id' => registration.WebHook_Server_Id__c
        };
        return new Callout(
                getEndpoint('groups.deleteCallbackServer', params),
                CalloutHelper.METHOD_GET
        );
    }

    global Callout getBotGroupId() {
        return new Callout(getEndpoint('groups.getById', new Map<String, String>()), CalloutHelper.METHOD_GET);
    }

    global Callout getCallbackConfirmationCode(Integer groupId) {
        Map<String, String> params = new Map<String, String> {
                'group_id' => String.valueOf(groupId)
        };
        return new Callout(
                getEndpoint('groups.getCallbackConfirmationCode', params),
                CalloutHelper.METHOD_GET
        );
    }

    global Callout setCallbackSettings() {
        Map<String, String> params = new Map<String, String> {
                'group_id' => registration.Group_Id__c,
                'server_id' => registration.WebHook_Server_Id__c,
                'message_new' => CalloutHelper.TRUE_FLAG
        };
        return new Callout(
                getEndpoint('groups.setCallbackSettings', params),
                CalloutHelper.METHOD_GET
        );
    }

    global Callout sendMessage(String text) {
        return sendMessage(new Map<String, String> {
                'user_id' => String.valueOf(updateWrapper.v_object.user_id),
                'message' => text
        });
    }

    global Callout sendMessage(String userId, String text) {
        return sendMessage(new Map<String, String> {
            'user_id' => userId,
            'message' => text
        });
    }


    protected override String getEndpoint(String method) {
        return this.botSettings.API_Url__c + CalloutHelper.SLASH + method;
    }

    protected override String getEndpoint(String method, Map<String, String> params) {
        params.putAll(getRequiredParams());
        return getEndpoint(method) + CalloutHelper.buildUrlParams(params);
    }


    private Callout sendMessage(Map<String, String> params) {
        params.put('random_id', String.valueOf(System.now().getTime().intValue()));
        params.putAll(getRequiredParams());
        return new Callout(
                getEndpoint('messages.send'),
                CalloutHelper.METHOD_POST,
                VK_BOT_REQUEST_HEADERS,
                CalloutHelper.buildUrlEncodedParams(params)
        );
    }

    private String getBotGroupId(Callout groupIdCallout) {
        VKGroupInfoResponseWrapper groupResponseWrapper = (VKGroupInfoResponseWrapper) JSON.deserialize(
                groupIdCallout.responseBody,
                VKGroupInfoResponseWrapper.class
        );
        return String.valueOf(groupResponseWrapper.response.get(0).id);
    }

    private Map<String, String> getRequiredParams() {
        return new Map<String, String> {
                'v' => VK_API_VERSION,
                'access_token' => registration.Token__c
        };
    }
}
