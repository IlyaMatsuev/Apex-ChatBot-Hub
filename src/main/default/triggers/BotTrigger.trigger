trigger BotTrigger on Bot__c(before insert, after insert, before update, after update, after delete, after undelete) {
    Triggers.IHandler webHookHandler = new BotWebhookHandler();
    Triggers.IHandler populateTokenHashHandler = new BotPopulateTokenHashHandler();
    Triggers.dispatcher
        .bind(TriggerOperation.BEFORE_INSERT, new BotValidateHandlerTypeHandler())
        .bind(TriggerOperation.BEFORE_INSERT, populateTokenHashHandler)
        .bind(TriggerOperation.BEFORE_UPDATE, populateTokenHashHandler)
        .bindAsync(TriggerOperation.AFTER_INSERT, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_UPDATE, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_DELETE, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_UNDELETE, webHookHandler)
        .run(new BotErrorHandler());
}
