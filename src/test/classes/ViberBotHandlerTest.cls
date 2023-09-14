@IsTest(isParallel = true)
private class ViberBotHandlerTest {
    private static final BotType BOT_TYPE = BotType.Viber;

    @TestSetup
    private static void init() {
        BotSettingsProvider.mock();
    }

    // TODO: Add tests for each ViberBotHandler method
}
