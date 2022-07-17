public class TelegramBotService extends BotService {
    public TelegramBotService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        String webhookUrl = BotUpdateApi.getBaseUrl() + bot.Type__c + '/' + bot.Id;
        call(
            TelegramBotMethod.SetWebhook.name(),
            new Map<String, Object>{ 'url' => webhookUrl, 'secret_token' => bot.TokenHash__c }
        );
    }

    public override void unsetWebhook() {
        call(TelegramBotMethod.DeleteWebhook.name(), new Map<String, Object>{ 'drop_pending_updates' => true });
    }
}
