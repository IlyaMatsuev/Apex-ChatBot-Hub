/**
 * Created by Ilya Matsuev on 7/4/2020.
 */

public with sharing class FutureTriggerHandlerContainer implements Queueable, IAsyncHandlerContainer, Database.AllowsCallouts {
    private TriggerContext context;
    private ITriggerHandler handler;
    private Map<TriggerBindOption, Object> options;

    public FutureTriggerHandlerContainer() {
    }

    public FutureTriggerHandlerContainer(
        TriggerContext context,
        ITriggerHandler handler,
        Map<TriggerBindOption, Object> options
    ) {
        this.context = context;
        this.handler = handler;
        this.options = options;
    }

    public void execute(TriggerContext context, ITriggerHandler handler, Map<TriggerBindOption, Object> options) {
        Integer delayMinutes = (Integer) options.get(TriggerBindOption.DELAY);
        if (delayMinutes != null) {
            throw new TriggerDispatcherException(Label.NotAllowedDelayForFutureRun);
        }
        System.enqueueJob(new FutureTriggerHandlerContainer(context, handler, options));
    }

    public void execute(QueueableContext queueableContext) {
        ITriggerService service = (ITriggerService) options.get(TriggerBindOption.SERVICE);
        ITriggerErrorHandler errorHandler = (ITriggerErrorHandler) options.get(TriggerBindOption.ERROR_HANDLER);
        try {
            handler.handle(context, service);
        } catch (TriggerDispatcherException error) {
            throw error;
        } catch (Exception error) {
            if (errorHandler == null) {
                throw error;
            } else {
                errorHandler.handle(context, error);
            }
        }
    }
}
