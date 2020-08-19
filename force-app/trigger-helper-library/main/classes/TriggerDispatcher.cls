/**
 * Created by Ilya Matsuev on 7/1/2020.
 */

global with sharing class TriggerDispatcher {

    global static TriggerDispatcher dispatcher {
        get {
            if (dispatcher == null) {
                dispatcher = new TriggerDispatcher();
            }
            return dispatcher;
        }
        private set;
    }
    global ITriggerService defaultService { get; private set; }
    global ITriggerErrorHandler defaultErrorHandler { get; private set; }

    private TriggerContext context { get; set; }
    private final List<TriggerHandlerWrapper> handlersMap { get; set; }
    private final List<TriggerHandlerWrapper> asyncHandlersMap { get; set; }

    private TriggerDispatcher() {
        this.handlersMap = new List<TriggerHandlerWrapper>();
        this.asyncHandlersMap = new List<TriggerHandlerWrapper>();
    }


    global void run() {
        if (!Trigger.isExecuting && !Test.isRunningTest()) {
            throw new TriggerDispatcherException(Label.NotATriggerContext);
        }
        if (context == null) {
            context = TriggerContextBuilder.getContext();
        }
        TriggerRunner.runSyncHandlers(context, handlersMap.clone());
        TriggerRunner.runAsyncHandlers(context, asyncHandlersMap.clone());
        handlersMap.clear();
        asyncHandlersMap.clear();
    }

    global TriggerDispatcher bind(TriggerOperation event, ITriggerHandler handler) {
        handlersMap.add(new TriggerHandlerWrapper(event, handler));
        return this;
    }

    global TriggerDispatcher bind(TriggerOperation event, ITriggerHandler handler, Map<TriggerBindOption, Object> options) {
        handlersMap.add(new TriggerHandlerWrapper(event, handler, options));
        return this;
    }

    global TriggerDispatcher bindAsync(TriggerOperation event, AsyncHandlerType asyncHandlerType, ITriggerHandler handler) {
        asyncHandlersMap.add(new TriggerHandlerWrapper(event, asyncHandlerType, handler));
        return this;
    }

    global TriggerDispatcher bindAsync(TriggerOperation event, AsyncHandlerType asyncHandlerType, ITriggerHandler handler, Map<TriggerBindOption, Object> options) {
        asyncHandlersMap.add(new TriggerHandlerWrapper(event, asyncHandlerType, handler, options));
        return this;
    }

    global TriggerDispatcher setDefaultService(ITriggerService service) {
        if (service == null) {
            throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', 'service'));
        }
        defaultService = service;
        return this;
    }

    global TriggerDispatcher setDefaultErrorHandler(ITriggerErrorHandler errorHandler) {
        if (errorHandler == null) {
            throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', 'error handler'));
        }
        defaultErrorHandler = errorHandler;
        return this;
    }
}
