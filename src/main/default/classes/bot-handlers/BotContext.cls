public class BotContext {
    public final Bot__c bot;
    public final BotService service;

    public BotContext(Bot__c bot, BotService service) {
        this.bot = bot;
        this.service = service;
    }
}
