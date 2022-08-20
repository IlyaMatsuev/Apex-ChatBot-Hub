public class TelegramWebhookBotService extends WebhookBotService {
    public TelegramWebhookBotService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        String webhookUrl = BotUtils.getApiUrl() + bot.Type__c + '/' + bot.Id;
        Map<String, Object> payload = new Map<String, Object>{
            'url' => webhookUrl,
            // TODO: Handle other updates
            'allowed_updates' => new List<String>{ 'message' },
            'secret_token' => bot.TokenHash__c
        };
        call(TelegramBotMethod.SetWebhook.name(), payload);
    }

    public override void unsetWebhook() {
        call(TelegramBotMethod.DeleteWebhook.name(), new Map<String, Object>{ 'drop_pending_updates' => true });
    }
}
