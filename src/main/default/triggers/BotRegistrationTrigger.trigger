/**
 * Created by Ilya Matsuev on 7/25/2020.
 */

trigger BotRegistrationTrigger on Bot_Registration__c(
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete
) {
    ITriggerHandler registrationHandler = new BotRegistrationHandler();
    ITriggerHandler validationHandler = new BotRegistrationValidationHandler();
    ITriggerHandler tokenHandler = new BotRegistrationTokenHandler();

    TriggerDispatcher.dispatcher
        .bind(TriggerOperation.BEFORE_INSERT, validationHandler)
        .bind(TriggerOperation.BEFORE_INSERT, tokenHandler)
        .bind(TriggerOperation.BEFORE_UPDATE, tokenHandler)
        .bindAsync(TriggerOperation.AFTER_INSERT, AsyncHandlerType.FUTURE, registrationHandler)
        .bindAsync(TriggerOperation.AFTER_UPDATE, AsyncHandlerType.FUTURE, registrationHandler)
        .bindAsync(TriggerOperation.AFTER_DELETE, AsyncHandlerType.FUTURE, registrationHandler)
        .bindAsync(TriggerOperation.AFTER_UNDELETE, AsyncHandlerType.FUTURE, registrationHandler)
        .setDefaultErrorHandler(new BotRegistrationErrorHandler())
        .run();
}
