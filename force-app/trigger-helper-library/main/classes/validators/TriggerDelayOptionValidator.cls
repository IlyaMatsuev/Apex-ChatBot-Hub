/**
 * Created by Ilya on 7/8/2020.
 */

public with sharing class TriggerDelayOptionValidator implements ITriggerOptionsValidator {

    public Boolean validate(Object delayObject) {
        if (delayObject == null) {
            throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', 'delay'));
        } else if (!(delayObject instanceof Integer)) {
            throw new TriggerDispatcherException(Label.InstanceNotOfRequiredType.replace('%%%', 'delay').replace('###', 'Integer'));
        }
        return true;
    }
}
