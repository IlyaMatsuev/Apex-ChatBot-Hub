trigger BotTrigger on Bot__c(before insert, after insert, before update, after update, after delete, after undelete) {
    Triggers.IHandler webHookHandler = new BotWebHookHandler();
    Triggers.dispatcher
        .bind(TriggerOperation.BEFORE_INSERT, new BotPopulateTokenHashHandler())
        .bindAsync(TriggerOperation.AFTER_INSERT, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_DELETE, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_UNDELETE, webHookHandler)
        .run(new BotErrorHandler());
}
