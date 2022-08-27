public class TelegramBotService extends BotService {
    public TelegramBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, String message) {
        Map<String, Object> messagePayload = new Map<String, Object>{ 'chat_id' => chatId, 'text' => message };
        HttpResponse response = call(TelegramBotMethod.SendMessage.name(), messagePayload);
        System.debug('response plain: ' + response.getBody());
        ValueMap responseBody = ValueMap.fromJson(response.getBody());
        TelegramBotMessage responseMessagePayload = (TelegramBotMessage) responseBody.getValueMap(
            'result',
            TelegramBotMessage.class
        );
        System.debug('message payload: ' + JSON.serializePretty(responseMessagePayload));
        return String.valueOf(responseMessagePayload.getId());
    }
}
