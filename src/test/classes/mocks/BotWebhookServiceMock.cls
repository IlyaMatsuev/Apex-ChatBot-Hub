@IsTest
public class BotWebhookServiceMock extends BotWebhookService {
    public static String mockWebhookUrl = 'https://example.com/webhook';
    public static String mockExpectedWebhookUrl = 'https://example.com/webhook';
    public static Integer setWebhookCallCount = 0;
    public static Integer unsetWebhookCallCount = 0;

    @TestVisible
    private BotWebhookServiceMock() {}

    public override WebhookInfo getWebhookInfo() {
        return new WebhookInfo(mockWebhookUrl, mockExpectedWebhookUrl);
    }

    public override void setWebhook() {
        setWebhookCallCount++;
    }

    public override void unsetWebhook() {
        unsetWebhookCallCount++;
    }
}
