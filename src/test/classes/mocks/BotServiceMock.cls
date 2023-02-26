@IsTest
public class BotServiceMock extends BotService {
    public static final Map<String, BotService.MessageParams> outboundMessages = new Map<String, BotService.MessageParams>();

    public BotServiceMock(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, BotService.MessageParams params) {
        return saveMessage(chatId, params);
    }

    protected override String sendImage(String chatId, BotService.MessageParams params) {
        return saveMessage(chatId, params);
    }

    protected override String sendVideo(String chatId, BotService.MessageParams params) {
        return saveMessage(chatId, params);
    }

    private String saveMessage(String chatId, BotService.MessageParams params) {
        outboundMessages.put(chatId, params);
        return chatId;
    }
}
