public class TelegramBotService extends BotService {
    public TelegramBotService(Bot__c bot, BotUpdateModel updateModel) {
        super(bot, updateModel);
    }

    public override void sendMessage(String message) {
        if (updateModel?.chat?.id == null) {
            throw new BotServiceException('Not possible to send a message: no chat id provided');
        }
        Map<String, Object> messagePayload = new Map<String, Object>{
            'chat_id' => updateModel.chat.id,
            'text' => message
        };
        call(TelegramBotMethod.SendMessage.name(), messagePayload);
    }
}
