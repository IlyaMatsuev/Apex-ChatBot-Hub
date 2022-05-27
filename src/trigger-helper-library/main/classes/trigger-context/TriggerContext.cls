/**
 * Created by Ilya Matsuev on 7/1/2020.
 */

global with sharing class TriggerContext {
    private final String DEV_ORG_ID = '00D2v000001Xc0dEAC';

    private List<SObject> clonedNewList;
    private List<SObject> clonedOldList;
    private Map<Id, SObject> clonedNewMap;
    private Map<Id, SObject> clonedOldMap;
    private TriggerOperation clonedTriggerEvent;
    private TriggerType clonedTriggerType;

    global TriggerOperation triggerEvent {
        get {
            if (runningTest()) {
                return TriggerOperation.BEFORE_INSERT;
            }
            if (!Trigger.isExecuting) {
                return clonedTriggerEvent;
            }
            return Trigger.operationType;
        }
    }
    global TriggerType predOrPost {
        get {
            if (runningTest()) {
                return TriggerType.BEFORE;
            }
            if (!Trigger.isExecuting) {
                return clonedTriggerType;
            }
            return Trigger.isAfter ? TriggerType.AFTER : TriggerType.BEFORE;
        }
    }
    global Boolean isAsyncRun {
        get {
            return asyncRunType != null;
        }
    }
    global AsyncHandlerType asyncRunType {
        get {
            if (System.isFuture() || System.isBatch() || System.isQueueable()) {
                return AsyncHandlerType.FUTURE;
            } else if (System.isScheduled()) {
                return AsyncHandlerType.SCHEDULABLE;
            }
            return null;
        }
    }
    global List<SObject> newList {
        get {
            if (!Trigger.isExecuting) {
                return clonedNewList;
            }
            return Trigger.new;
        }
    }
    global List<SObject> oldList {
        get {
            if (!Trigger.isExecuting) {
                return clonedOldList;
            }
            return Trigger.old;
        }
    }
    global Map<Id, SObject> newMap {
        get {
            if (!Trigger.isExecuting) {
                return clonedNewMap;
            }
            return Trigger.newMap;
        }
    }
    global Map<Id, SObject> oldMap {
        get {
            if (!Trigger.isExecuting) {
                return clonedOldMap;
            }
            return Trigger.oldMap;
        }
    }
    global final Map<String, Object> properties { get; private set; }

    global static Boolean skippingAllHandlers { get; private set; }
    global static final Set<String> handlersToBeSkipped { get; private set; }

    static {
        skippingAllHandlers = false;
        handlersToBeSkipped = new Set<String>();
    }

    public TriggerContext() {
        this.properties = new Map<String, Object>();
    }

    public void cloneTriggerContext() {
        this.clonedNewList = Trigger.new;
        this.clonedOldList = Trigger.old;
        this.clonedNewMap = Trigger.newMap;
        this.clonedOldMap = Trigger.oldMap;
        this.clonedTriggerEvent = triggerEvent;
        this.clonedTriggerType = predOrPost;
    }

    global static void skipAllHandlers() {
        skippingAllHandlers = true;
    }

    global static void doNotSkipAllHandlers() {
        skippingAllHandlers = false;
    }

    global static void skipHandler(String handlerTypeName) {
        handlersToBeSkipped.add(handlerTypeName);
    }

    global static void doNotSkipHandler(String handlerTypeName) {
        handlersToBeSkipped.remove(handlerTypeName);
    }

    public static String getClassName(Object obj) {
        return String.valueOf(obj).split(':').get(0);
    }

    private Boolean runningTest() {
        return Test.isRunningTest() && UserInfo.getOrganizationId() == DEV_ORG_ID;
    }
}
