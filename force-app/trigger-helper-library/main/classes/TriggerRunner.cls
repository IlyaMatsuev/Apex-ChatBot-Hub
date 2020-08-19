/**
 * Created by Ilya Matsuev on 7/1/2020.
 */

public with sharing class TriggerRunner {

    private static final Map<AsyncHandlerType, IAsyncHandlerContainer> asyncHandlerContainersMap = new Map<AsyncHandlerType, IAsyncHandlerContainer> {
            AsyncHandlerType.FUTURE => new FutureTriggerHandlerContainer(),
            AsyncHandlerType.SCHEDULABLE => new ScheduleTriggerHandlerContainer()
    };

    private static final Set<TriggerBindOption> onlySyncOptions = new Set<TriggerBindOption> {};

    private static final Set<TriggerBindOption> onlyAsyncOptions = new Set<TriggerBindOption> {
            TriggerBindOption.DELAY,
            TriggerBindOption.JOB_PREFIX
    };


    public static void runSyncHandlers(TriggerContext context, List<TriggerHandlerWrapper> handlers) {
        TriggerDispatcher dispatcher = TriggerDispatcher.dispatcher;
        for (TriggerHandlerWrapper handlerWrapper: handlers) {
            if (TriggerContext.skippingAllHandlers) {
                break;
            }
            if (handlerWrapper.triggerEvent == context.triggerEvent && !handlerWrapper.alreadyExecuted) {
                try {
                    checkSyncAndAsyncOptionsInPlace(handlerWrapper.options.keySet(), true);
                    ITriggerHandler handler = handlerWrapper.handler;
                    ITriggerService service = handlerWrapper.service == null ? dispatcher.defaultService : handlerWrapper.service;
                    String handlerName = (String) handlerWrapper.options.get(TriggerBindOption.HANDLER_NAME);
                    if (String.isBlank(handlerName)) {
                        handlerName = TriggerContext.getClassName(handler);
                    }
                    if (!TriggerContext.handlersToBeSkipped.contains(handlerName)) {
                        handler.handle(context, service);
                    }
                } catch(TriggerDispatcherException error) {
                    throw error;
                } catch(Exception error) {
                    ITriggerErrorHandler errorHandler = handlerWrapper.errorHandler == null ? dispatcher.defaultErrorHandler : handlerWrapper.errorHandler;
                    if (errorHandler == null) {
                        throw error;
                    } else {
                        errorHandler.handle(context, error);
                    }
                } finally {
                    handlerWrapper.alreadyExecuted = true;
                }
            }
        }
    }

    public static void runAsyncHandlers(TriggerContext context, List<TriggerHandlerWrapper> asyncHandlers) {
        TriggerDispatcher dispatcher = TriggerDispatcher.dispatcher;
        for (TriggerHandlerWrapper handlerWrapper: asyncHandlers) {
            if (TriggerContext.skippingAllHandlers) {
                break;
            }
            if (handlerWrapper.triggerEvent == context.triggerEvent && !handlerWrapper.alreadyExecuted) {
                checkSyncAndAsyncOptionsInPlace(handlerWrapper.options.keySet(), false);
                ITriggerHandler handler = handlerWrapper.handler;
                ITriggerService service = handlerWrapper.service == null ? dispatcher.defaultService : handlerWrapper.service;
                ITriggerErrorHandler errorHandler = handlerWrapper.errorHandler == null ? dispatcher.defaultErrorHandler : handlerWrapper.errorHandler;
                handlerWrapper.options.put(TriggerBindOption.SERVICE, service);
                handlerWrapper.options.put(TriggerBindOption.ERROR_HANDLER, errorHandler);

                String handlerName = (String) handlerWrapper.options.get(TriggerBindOption.HANDLER_NAME);
                if (String.isBlank(handlerName)) {
                    handlerName = TriggerContext.getClassName(handler);
                }

                IAsyncHandlerContainer container = asyncHandlerContainersMap.get(handlerWrapper.asyncHandlerType);
                if (container != null && !TriggerContext.handlersToBeSkipped.contains(handlerName)) {
                    context.cloneTriggerContext();
                    container.execute(context.clone(), handler, handlerWrapper.options);
                }
                handlerWrapper.alreadyExecuted = true;
            }
        }
    }


    private static void checkSyncAndAsyncOptionsInPlace(Set<TriggerBindOption> options, Boolean sync) {
        Set<TriggerBindOption> unavailableOptions = sync ? onlyAsyncOptions : onlySyncOptions;
        for (TriggerBindOption option: unavailableOptions) {
            if (options.contains(option)) {
                String exceptionMessage = sync ? Label.BindingOnlyForAsyncHandlers : Label.BindingOnlyForSyncHandlers;
                throw new TriggerDispatcherException(exceptionMessage.replace('%%%', option.name()));
            }
        }
    }
}
