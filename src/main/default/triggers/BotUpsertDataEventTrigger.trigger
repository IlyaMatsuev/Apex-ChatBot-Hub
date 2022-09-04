trigger BotUpsertDataEventTrigger on BotUpsertDataEvent__e(after insert) {
    Triggers.dispatcher.bind(TriggerOperation.AFTER_INSERT, new BotUpsertDataHandler()).run(new BotErrorLogger());
}
