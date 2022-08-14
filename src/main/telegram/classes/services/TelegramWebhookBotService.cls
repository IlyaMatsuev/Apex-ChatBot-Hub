public class TelegramWebhookBotService extends WebhookBotService {
    public TelegramWebhookBotService(Bot__c bot) {
        super(bot);
    }

    public override void setWebhook() {
        String webhookUrl = BotPublicSiteUtils.getApiUrl() + bot.Type__c + '/' + bot.Id;
        call(
            TelegramBotMethod.SetWebhook.name(),
            new Map<String, Object>{ 'url' => webhookUrl, 'secret_token' => bot.TokenHash__c }
        );
    }

    public override void unsetWebhook() {
        call(TelegramBotMethod.DeleteWebhook.name(), new Map<String, Object>{ 'drop_pending_updates' => true });
    }
}
