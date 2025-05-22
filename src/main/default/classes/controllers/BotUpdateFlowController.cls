public without sharing class BotUpdateFlowController {
    @InvocableMethod(label = 'Handle Bot Update')
    public static void handleBotUpdate(List<BotUpdateInput> params) {
        try {
            BotUpdateInput input = params.get(0);
            BotUpdateEventHandler eventHandler = new BotUpdateEventHandler();
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
    }
}
