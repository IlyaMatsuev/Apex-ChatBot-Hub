/**
 * Created by Ilya Matsuev on 7/8/2020.
 */

public with sharing class TriggerServiceOptionValidator implements ITriggerOptionsValidator {
    public Boolean validate(Object serviceObject) {
        if (serviceObject == null) {
            throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', 'service'));
        } else if (!(serviceObject instanceof ITriggerService)) {
            throw new TriggerDispatcherException(
                Label.InstanceNotOfRequiredInterface.replace('%%%', 'service').replace('###', 'ITriggerService')
            );
        }
        return true;
    }
}
