trigger BotUpdateEventTrigger on BotUpdateEvent__e(after insert) {
    Triggers.dispatcher.bindAsync(TriggerOperation.AFTER_INSERT, new BotUpdateHandler()).run(new BotErrorLogger());
}
