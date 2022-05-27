/**
 * Created by Ilya Matsuev on 7/11/2020.
 */

@IsTest
public with sharing class AsyncTriggerRunTest {
    @IsTest
    public static void positiveOnlyHandlerFutureRun() {
        Test.startTest();
        TriggerDispatcher.dispatcher
            .bindAsync(TriggerOperation.BEFORE_INSERT, AsyncHandlerType.FUTURE, new AccountTriggerTestHandler())
            .run();
        Test.stopTest();

        List<Account> newAccounts = [SELECT Name, Description FROM Account];
        System.assertEquals(1, newAccounts.size());

        Account newAccount = newAccounts.get(0);
        System.assertEquals('test', newAccount.Name);
        System.assertEquals(TriggerOperation.BEFORE_INSERT.name(), newAccount.Description);
    }

    @IsTest
    public static void positiveHandlerAndServiceFutureRun() {
        Test.startTest();
        Map<TriggerBindOption, Object> options = new Map<TriggerBindOption, Object>{
            TriggerBindOption.SERVICE => new AccountTriggerTestService()
        };
        TriggerDispatcher.dispatcher
            .bindAsync(
                TriggerOperation.BEFORE_INSERT,
                AsyncHandlerType.FUTURE,
                new AccountTriggerTestHandler(),
                options
            )
            .setDefaultService(new AccountTriggerTestService())
            .run();
        Test.stopTest();

        List<Account> newAccounts = [SELECT Name, Description FROM Account];
        System.assertEquals(1, newAccounts.size());

        Account newAccount = newAccounts.get(0);
        System.assertEquals('test', newAccount.Name);
        System.assertEquals(TriggerOperation.BEFORE_INSERT.name(), newAccount.Description);
    }

    @IsTest
    public static void positiveHandlerServiceAndErrorHandlerFutureRun() {
        Test.startTest();
        Map<TriggerBindOption, Object> options = new Map<TriggerBindOption, Object>{
            TriggerBindOption.SERVICE => new AccountTriggerTestService(),
            TriggerBindOption.ERROR_HANDLER => new AccountTriggerTestErrorHandler()
        };
        TriggerDispatcher.dispatcher
            .bindAsync(
                TriggerOperation.BEFORE_INSERT,
                AsyncHandlerType.FUTURE,
                new AccountTriggerTestHandler(true),
                options
            )
            .setDefaultService(new AccountTriggerTestService())
            .setDefaultErrorHandler(new AccountTriggerTestErrorHandler())
            .run();
        Test.stopTest();

        List<Account> newAccounts = [SELECT Name, Description FROM Account];
        System.assertEquals(1, newAccounts.size());

        Account newAccount = newAccounts.get(0);
        System.assertEquals('Error handling test', newAccount.Name);
        System.assertEquals(TriggerOperation.BEFORE_INSERT.name(), newAccount.Description);
    }

    @IsTest
    public static void positiveOnlyHandlerScheduleRun() {
        Integer countJobsBefore = [SELECT COUNT() FROM CronTrigger];
        Test.startTest();
        Map<TriggerBindOption, Object> options = new Map<TriggerBindOption, Object>{ TriggerBindOption.DELAY => 1 };
        TriggerDispatcher.dispatcher
            .bindAsync(
                TriggerOperation.BEFORE_INSERT,
                AsyncHandlerType.SCHEDULABLE,
                new AccountTriggerTestHandler(),
                options
            )
            .run();

        // Needed to test how the scheduled batch will run
        ScheduleTriggerHandlerContainer schedulableContainer = new ScheduleTriggerHandlerContainer(
            TriggerContextBuilder.getContext(),
            new AccountTriggerTestHandler(),
            options
        );
        schedulableContainer.execute(null, null);

        Test.stopTest();

        Integer countJobsAfter = [SELECT COUNT() FROM CronTrigger];
        System.assertEquals(1, countJobsAfter - countJobsBefore);

        List<Account> newAccounts = [SELECT Name, Description FROM Account];
        System.assertEquals(1, newAccounts.size());

        Account newAccount = newAccounts.get(0);
        System.assertEquals('test', newAccount.Name);
        System.assertEquals(TriggerOperation.BEFORE_INSERT.name(), newAccount.Description);
    }

    @IsTest
    public static void positiveHandlerAndServiceScheduleRun() {
        Integer countJobsBefore = [SELECT COUNT() FROM CronTrigger];
        Test.startTest();
        Map<TriggerBindOption, Object> options = new Map<TriggerBindOption, Object>{
            TriggerBindOption.SERVICE => new AccountTriggerTestService(),
            TriggerBindOption.DELAY => 1
        };
        TriggerDispatcher.dispatcher
            .bindAsync(
                TriggerOperation.BEFORE_INSERT,
                AsyncHandlerType.SCHEDULABLE,
                new AccountTriggerTestHandler(),
                options
            )
            .setDefaultService(new AccountTriggerTestService())
            .run();

        // Needed to test how the scheduled batch will run
        ScheduleTriggerHandlerContainer schedulableContainer = new ScheduleTriggerHandlerContainer(
            TriggerContextBuilder.getContext(),
            new AccountTriggerTestHandler(),
            options
        );
        schedulableContainer.execute(null, null);

        Test.stopTest();

        Integer countJobsAfter = [SELECT COUNT() FROM CronTrigger];
        System.assertEquals(1, countJobsAfter - countJobsBefore);

        List<Account> newAccounts = [SELECT Name, Description FROM Account];
        System.assertEquals(1, newAccounts.size());

        Account newAccount = newAccounts.get(0);
        System.assertEquals('test', newAccount.Name);
        System.assertEquals(TriggerOperation.BEFORE_INSERT.name(), newAccount.Description);
    }

    @IsTest
    public static void positiveHandlerServiceAndErrorHandlerScheduleRun() {
        Integer countJobsBefore = [SELECT COUNT() FROM CronTrigger];
        Test.startTest();
        Map<TriggerBindOption, Object> options = new Map<TriggerBindOption, Object>{
            TriggerBindOption.SERVICE => new AccountTriggerTestService(),
            TriggerBindOption.ERROR_HANDLER => new AccountTriggerTestErrorHandler(),
            TriggerBindOption.DELAY => 1
        };
        TriggerDispatcher.dispatcher
            .bindAsync(
                TriggerOperation.BEFORE_INSERT,
                AsyncHandlerType.SCHEDULABLE,
                new AccountTriggerTestHandler(true),
                options
            )
            .setDefaultService(new AccountTriggerTestService())
            .setDefaultErrorHandler(new AccountTriggerTestErrorHandler())
            .run();

        // Needed to test how the scheduled batch will run
        ScheduleTriggerHandlerContainer schedulableContainer = new ScheduleTriggerHandlerContainer(
            TriggerContextBuilder.getContext(),
            new AccountTriggerTestHandler(true),
            options
        );
        schedulableContainer.execute(null, null);

        Test.stopTest();

        Integer countJobsAfter = [SELECT COUNT() FROM CronTrigger];
        System.assertEquals(1, countJobsAfter - countJobsBefore);

        List<Account> newAccounts = [SELECT Name, Description FROM Account];
        System.assertEquals(1, newAccounts.size());

        Account newAccount = newAccounts.get(0);
        System.assertEquals('Error handling test', newAccount.Name);
        System.assertEquals(TriggerOperation.BEFORE_INSERT.name(), newAccount.Description);
    }

    private class AccountTriggerTestHandler implements ITriggerHandler {
        private Boolean throwException = false;

        public AccountTriggerTestHandler() {
        }

        public AccountTriggerTestHandler(Boolean throwException) {
            this.throwException = throwException;
        }

        public void handle(TriggerContext context, ITriggerService service) {
            TriggerOperation triggerEvent = context.triggerEvent;
            TriggerType triggerType = context.predOrPost;
            AsyncHandlerType asyncHandlerType = context.asyncRunType;
            Boolean isAsync = context.isAsyncRun;
            List<SObject> newList = context.newList;
            List<SObject> oldList = context.oldList;
            Map<Id, SObject> newMap = context.newMap;
            Map<Id, SObject> oldMap = context.oldMap;

            context.properties.put('event', triggerEvent);
            context.properties.put('type', triggerType);
            context.properties.put('async type', asyncHandlerType);
            context.properties.put('is async', isAsync);

            Account testAccount = new Account(Name = 'test', Description = triggerEvent.name());

            if (service != null) {
                service.insertRelatedRecords();
                service.updateRelatedRecords();
                service.deleteRelatedRecords();
            }

            if (throwException) {
                throw new CalloutException('Error handling test');
            }
            System.debug('Before inserting account');
            insert testAccount;
        }
    }

    private class AccountTriggerTestService implements ITriggerService {
        public void insertRelatedRecords() {
        }

        public void updateRelatedRecords() {
        }

        public void deleteRelatedRecords() {
        }
    }

    private class AccountTriggerTestErrorHandler implements ITriggerErrorHandler {
        public void handle(TriggerContext context, Exception error) {
            TriggerContext.skipAllHandlers();
            insert new Account(Name = error.getMessage(), Description = context.properties.get('event').toString());
        }
    }
}
