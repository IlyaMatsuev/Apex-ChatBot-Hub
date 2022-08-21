@IsTest
public class BotServiceMock extends BotService {
    public static final Map<String, String> outboundMessages = new Map<String, String>();

    public BotServiceMock(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, String message) {
        outboundMessages.put(chatId, message);
        return chatId;
    }
}
