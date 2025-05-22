public without sharing class BotUpdateFlowController {
    @TestVisible
    private static IBotUpdateEventHandler eventHandler = new BotUpdateEventHandler();

    @InvocableMethod(label = 'Handle Bot Update')
    public static void handleBotUpdate(List<BotUpdateInput> params) {
        try {
            BotUpdateInput input = params.get(0);
            eventHandler.handleSync(input.botJson, input.updatePayloadJson);
        } catch (Exception ex) {
            BotErrorLogger.log(ex);
        }
    }

    public class BotUpdateInput {
        @InvocableVariable(label = 'Bot JSON' required = true)
        public String botJson;
        @InvocableVariable(label = 'Bot Update Payload JSON' required = true)
        public String updatePayloadJson;

        public BotUpdateInput() {}
    }
}
