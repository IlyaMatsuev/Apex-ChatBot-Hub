@IsTest(isParallel = true)
private class BotUpdateFlowControllerTest {
    @IsTest
    private static void handleBotUpdate_withParams_callsUpdateEventHandler() {
        BotUpdateFlowController.BotUpdateInput input = new BotUpdateFlowController.BotUpdateInput();
        input.botJson = new BotModel(new Bot__c(Name = 'Test')).toJson();
        input.updatePayloadJson = '{"update":"hello world"}';

        MockBotUpdateEventHandler eventHandler = new MockBotUpdateEventHandler();
        BotUpdateFlowController.eventHandler = eventHandler;

        BotUpdateFlowController.handleBotUpdate(new List<BotUpdateFlowController.BotUpdateInput> { input });

        Assert.isTrue(eventHandler.called);
    }

    @IsTest
    private static void handleBotUpdate_withoutParams_throwsError() {
        MockBotUpdateEventHandler eventHandler = new MockBotUpdateEventHandler();
        BotUpdateFlowController.eventHandler = eventHandler;

        BotUpdateFlowController.handleBotUpdate(null);

        Assert.isFalse(eventHandler.called);
    }

    private class MockBotUpdateEventHandler implements IBotUpdateEventHandler {
        public Boolean called = false;

        public void handleSync(String botJson, String botUpdatePayloadJson) {
            called = true;
        }
    }
}
