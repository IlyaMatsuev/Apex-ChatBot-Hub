/**
 * Created by Ilya Matsuev on 8/24/2020.
 */

public with sharing class TelegramBotRequestDelegator extends BotRequestDelegator {

    private final Map<String, String> JSON_FIELDS_REPLACE_MAP = new Map<String, String> {
            'from' => 'from_user',
            'date' => 'message_date'
    };


    public override void delegate(RestRequest request) {
        String jsonMessage = new JSONReplacer(request.requestBody.toString()).replace(JSON_FIELDS_REPLACE_MAP);
        TelegramUpdateWrapper updateWrapper = (TelegramUpdateWrapper) JSON.deserialize(jsonMessage, TelegramUpdateWrapper.class);
        
    }
}
