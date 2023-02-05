/**
 * @description The concrete service for the `Viber` messanger bots. Extends `BotService` but also contains features related to `Viber` only
 */
global class ViberBotService extends BotService {
    public ViberBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, String message) {
        ValueMap messagePayload = new ValueMap()
            .set('receiver', chatId)
            .set('type', 'text')
            .set('text', message)
            .set('sender', new ValueMap().set('name', bot.Name));

        return call(ViberBotMethod.SendMessage, messagePayload).getString('message_token');
    }

    protected override HttpRequest prepareRequest(BotMethod method, ValueMap body) {
        HttpRequest request = super.prepareRequest(method, body);
        request.setHeader('X-Viber-Auth-Token', bot.Token__c);
        return request;
    }

    protected override Boolean isSuccessResponse(HttpResponse response, ValueMap payload) {
        return super.isSuccessResponse(response, payload) && payload.getInteger('status') == 0;
    }
}
