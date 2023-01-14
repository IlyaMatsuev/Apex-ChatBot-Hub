/**
 * @description The concrete service for the `Telegram` messanger bots. Extends `BotService` but also contains features related to `Telegram` only
 */
global class TelegramBotService extends BotService {
    public TelegramBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, String message) {
        ValueMap messagePayload = new ValueMap().set('chat_id', chatId).set('text', message);
        HttpResponse response = call(TelegramBotMethod.SendMessage, messagePayload);
        ValueMap responseBody = ValueMap.fromJson(response.getBody());
        return ((TelegramBotMessageEntity) responseBody.getValueMap('result', TelegramBotMessageEntity.class)).getId();
    }

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setEndpoint(settings.ApiUrl__c + bot.Token__c + '/' + method);
        return request;
    }
}
