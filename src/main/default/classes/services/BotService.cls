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
        private final String chatId;
        private final BotModel bot;

        public SaveSentMessageCallback(String chatId, BotModel bot) {
            this.chatId = chatId;
            this.bot = bot;
        }

        public void execute(ValueMap params) {
            ValueMap parameters = new ValueMap();
            if (params.has('parameters')) {
                parameters = params.getValueMap('parameters');
            }
            ChatMessage__c messageRecord = new ChatMessage__c(
                Type__c = params.getString('type'),
                Text__c = params.getString('text'),
                MediaUrl__c = params.getString('mediaUrl'),
                Parameters__c = parameters.toJson(true),
                Chat__r = new Chat__c(ExternalId__c = BotUtils.generateExternalId(chatId, bot.tokenHash)),
                Bot__c = bot.id,
                ExternalId__c = BotUtils.generateExternalId(params.getString('messageId'), chatId)
            );
            BotUtils.saveAsync(new List<SObject> { messageRecord }, 'ExternalId__c');
        }
    }
}
