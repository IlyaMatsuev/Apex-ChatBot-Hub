trigger BotUpdateEventTrigger on BotUpdateEvent__e(after insert) {
    Triggers.dispatcher.bind(TriggerOperation.AFTER_INSERT, new BotUpdateEventHandler()).run(new BotErrorLogger());
}
