public class ViberBotService extends BotService {
    public ViberBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, String message) {
        ValueMap messagePayload = new ValueMap()
            .set('receiver', chatId)
            .set('type', 'text')
            .set('text', message)
            .set('sender', new ValueMap().set('name', bot.Name));

        HttpResponse response = call(ViberBotMethod.SendMessage, messagePayload);
        return ValueMap.fromJson(response.getBody()).getString('message_token');
    }
}
