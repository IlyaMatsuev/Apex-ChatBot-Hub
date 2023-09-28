trigger BotTrigger on Bot__c(before insert, after insert, after update, after delete, after undelete) {
    Triggers.IHandler webHookHandler = new BotWebhookHandler();
    Triggers.dispatcher
        .bind(TriggerOperation.BEFORE_INSERT, new BotPopulateTokenHashHandler())
        .bind(TriggerOperation.BEFORE_INSERT, new BotValidateHandlerTypeHandler())
        .bindAsync(TriggerOperation.AFTER_INSERT, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_UPDATE, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_DELETE, webHookHandler)
        .bindAsync(TriggerOperation.AFTER_UNDELETE, webHookHandler)
        .run(new BotErrorHandler());
}
