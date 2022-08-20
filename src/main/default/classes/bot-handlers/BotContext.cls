global class BotContext {
    global final Bot__c bot;
    global final BotUpdateModel updateModel;
    global final BotService service;

    global BotContext(Bot__c bot, BotUpdateModel updateModel, BotService service) {
        this.bot = bot;
        this.updateModel = updateModel;
        this.service = service;
    }
}
