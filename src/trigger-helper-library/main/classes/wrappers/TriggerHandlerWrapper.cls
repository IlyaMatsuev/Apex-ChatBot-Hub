/**
 * Created by Ilya Matsuev on 7/3/2020.
 */

public with sharing class TriggerHandlerWrapper {
    public TriggerOperation triggerEvent { get; private set; }
    public AsyncHandlerType asyncHandlerType { get; private set; }
    public Boolean alreadyExecuted {
        get {
            if (alreadyExecuted == null) {
                alreadyExecuted = false;
            }
            return alreadyExecuted;
        }
        set;
    }

    public Map<TriggerBindOption, Object> options { get; private set; }

    public ITriggerHandler handler { get; private set; }
    public ITriggerService service {
        get {
            return (ITriggerService) options.get(TriggerBindOption.SERVICE);
        }
    }
    public ITriggerErrorHandler errorHandler {
        get {
            return (ITriggerErrorHandler) options.get(TriggerBindOption.ERROR_HANDLER);
        }
    }

    private final Map<TriggerBindOption, ITriggerOptionsValidator> triggerOptionsValidatorsMap = new Map<TriggerBindOption, ITriggerOptionsValidator>{
        TriggerBindOption.SERVICE => new TriggerServiceOptionValidator(),
        TriggerBindOption.ERROR_HANDLER => new TriggerErrorHandlerOptionValidator(),
        TriggerBindOption.DELAY => new TriggerDelayOptionValidator(),
        TriggerBindOption.JOB_PREFIX => new TriggerJobPrefixOptionValidator(),
        TriggerBindOption.HANDLER_NAME => new TriggerHandlerNameOptionValidator()
    };

    public TriggerHandlerWrapper(TriggerOperation triggerEvent, ITriggerHandler handler) {
        verifyArgumentsForNull(new Map<String, Object>{ 'event' => triggerEvent, 'handler' => handler });

        this.triggerEvent = triggerEvent;
        this.handler = handler;
        this.options = new Map<TriggerBindOption, Object>();
    }

    public TriggerHandlerWrapper(
        TriggerOperation triggerEvent,
        ITriggerHandler handler,
        Map<TriggerBindOption, Object> options
    ) {
        verifyArgumentsForNull(new Map<String, Object>{ 'event' => triggerEvent, 'handler' => handler });
        verifyBindOptionsValid(options);

        this.triggerEvent = triggerEvent;
        this.handler = handler;
        this.options = options;
    }

    public TriggerHandlerWrapper(
        TriggerOperation triggerEvent,
        AsyncHandlerType asyncHandlerType,
        ITriggerHandler handler
    ) {
        verifyArgumentsForNull(
            new Map<String, Object>{ 'event' => triggerEvent, 'async type' => asyncHandlerType, 'handler' => handler }
        );

        this.triggerEvent = triggerEvent;
        this.handler = handler;
        this.asyncHandlerType = asyncHandlerType;
        this.options = new Map<TriggerBindOption, Object>();
    }

    public TriggerHandlerWrapper(
        TriggerOperation triggerEvent,
        AsyncHandlerType asyncHandlerType,
        ITriggerHandler handler,
        Map<TriggerBindOption, Object> options
    ) {
        verifyArgumentsForNull(
            new Map<String, Object>{ 'event' => triggerEvent, 'async type' => asyncHandlerType, 'handler' => handler }
        );
        verifyBindOptionsValid(options);

        this.triggerEvent = triggerEvent;
        this.handler = handler;
        this.asyncHandlerType = asyncHandlerType;
        this.options = options;
    }

    private void verifyArgumentsForNull(Map<String, Object> arguments) {
        for (String argumentName : arguments.keySet()) {
            if (arguments.get(argumentName) == null) {
                throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', argumentName));
            }
        }
    }

    private void verifyBindOptionsValid(Map<TriggerBindOption, Object> options) {
        for (TriggerBindOption option : options.keySet()) {
            ITriggerOptionsValidator validator = triggerOptionsValidatorsMap.get(option);
            if (validator != null) {
                validator.validate(options.get(option));
            }
        }
    }
}
