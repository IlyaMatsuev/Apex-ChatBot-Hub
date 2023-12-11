/**
 * @description The base class that contains features common for all bots
 */
global abstract class BotService implements IBotService {
    protected final BotModel bot;

    protected BotCalloutService calloutService {
        get {
            if (calloutService == null) {
                calloutService = new BotServiceFactory().createCalloutService(bot);
            }
            return calloutService;
        }
        private set;
    }

    public class SaveSentMessageCallback implements IBotCallback {
        private final List<String> chatIds;
        private final BotModel bot;

        public SaveSentMessageCallback(List<String> chatIds, BotModel bot) {
            this.chatIds = chatIds;
            this.bot = bot;
        }

        public void execute(BotJsonPayload params) {
            List<ChatMessage__c> messages = new List<ChatMessage__c>();
            for (String chatId : chatIds) {
                BotJsonPayload parameters = new BotJsonPayload();
                if (params.has('parameters')) {
                    parameters = params.getJsonPayload('parameters');
                }
                if (params.has('keyboard')) {
                    parameters.set('keyboard', params.getJsonPayload('keyboard'));
                }
                messages.add(
                    new ChatMessage__c(
                        Type__c = params.getString('type'),
                        Text__c = params.getString('text'),
                        MediaUrl__c = params.getString('mediaUrl'),
                        Parameters__c = parameters.toJson(true),
                        Chat__r = new Chat__c(ExternalId__c = BotUtils.generateExternalId(chatId, bot.tokenHash)),
                        Bot__c = bot.id,
                        ExternalId__c = BotUtils.generateExternalId(params.getString('messageId'), chatId)
                    )
                );
            }
            BotUtils.saveAsync(messages, 'ExternalId__c');
        }
    }
}
