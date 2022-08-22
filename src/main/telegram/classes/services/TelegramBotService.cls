public class TelegramBotService extends BotService {
    public TelegramBotService(Bot__c bot) {
        super(bot);
    }

    protected override String sendMessage(String chatId, String message) {
        Map<String, Object> messagePayload = new Map<String, Object>{ 'chat_id' => chatId, 'text' => message };
        TelegramBotMessageWrapper messageResponse = (TelegramBotMessageWrapper) JSON.deserialize(
            call(TelegramBotMethod.SendMessage.name(), messagePayload).getBody(),
            TelegramBotMessageWrapper.class
        );
        return String.valueOf(messageResponse.message_id);
    }
}
