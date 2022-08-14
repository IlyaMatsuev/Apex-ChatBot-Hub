public class BotContext {
    public final Bot__c bot;
    public final BotUpdateModel updateModel;
    public final BotService service;

    public BotContext(Bot__c bot, BotUpdateModel updateModel, BotService service) {
        this.bot = bot;
        this.updateModel = updateModel;
        this.service = service;
    }
}
