@IsTest
public class BotWebhookServiceMock extends BotWebhookService {
    public static Integer setWebhookCallCount = 0;
    public static Integer unsetWebhookCallCount = 0;

    @TestVisible
    private BotWebhookServiceMock() {}

    public override void setWebhook() {
        setWebhookCallCount++;
    }

    public override void unsetWebhook() {
        unsetWebhookCallCount++;
    }
}
