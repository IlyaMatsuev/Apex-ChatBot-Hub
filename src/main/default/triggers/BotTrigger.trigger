trigger BotTrigger on Bot__c(before insert, after insert, before update, after update, after delete, after undelete) {
    Triggers.IHandler populateTokenHashHandler = new PopulateBotTokenHashHandler();
    Triggers.IHandler webHookHandler = new BotWebHookHandler();

    // TODO: Add a new validation rule for Bot__c.WebHookUrl__c: REGEX(WebHookUrl__c, '^(/\\w+)+$')
    Triggers.dispatcher
        .bind(TriggerOperation.BEFORE_INSERT, populateTokenHashHandler)
        .bind(TriggerOperation.BEFORE_UPDATE, populateTokenHashHandler)
        .bindAsync(TriggerOperation.AFTER_INSERT, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_UPDATE, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_DELETE, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_UNDELETE, webHookHandler)
        .run(new BotErrorHandler());
}
