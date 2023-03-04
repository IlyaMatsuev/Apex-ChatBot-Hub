/**
 * @description The base class that contains features common for all bots
 */
global abstract class BotService implements IBotService {
    protected final Bot__c bot;

    /**
     * @description The type of the bot this service operates with
     */
    global BotType type {
        get {
            if (type == null) {
                type = BotType.valueOf(bot.Type__c);
            }
            return type;
        }
        private set;
    }

    protected BotCalloutService calloutService {
        get {
            if (calloutService == null) {
                calloutService = new BotServiceFactory().createCalloutService(bot);
            }
            return calloutService;
        }
        private set;
    }

    protected BotSetting__mdt settings { get { return BotSettingsProvider.get(type); } }

    protected BotService(Bot__c bot) {
        this.bot = bot;
    }

    public class SaveSentMessageCallback implements IBotCallback {
        private final String chatId;
        private final Bot__c bot;

        public SaveSentMessageCallback(String chatId, Bot__c bot) {
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
                Chat__r = new Chat__c(ExternalId__c = BotUtils.generateChatId(bot.TokenHash__c, chatId)),
                Bot__c = bot.Id,
                ExternalId__c = params.getString('messageId')
            );
            BotUtils.saveAsync(new List<SObject> { messageRecord }, 'ExternalId__c');
        }
    }
}
