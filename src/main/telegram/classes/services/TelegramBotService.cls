public class TelegramBotService extends BotService {
    public TelegramBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, String message) {
        ValueMap messagePayload = new ValueMap().set('chat_id', chatId).set('text', message);
        HttpResponse response = call(TelegramBotMethod.SendMessage.name(), messagePayload);
        ValueMap responseBody = ValueMap.fromJson(response.getBody());
        TelegramBotMessage responseMessagePayload = (TelegramBotMessage) responseBody.getValueMap(
            'result',
            TelegramBotMessage.class
        );
        return String.valueOf(responseMessagePayload.getId());
    }
}
