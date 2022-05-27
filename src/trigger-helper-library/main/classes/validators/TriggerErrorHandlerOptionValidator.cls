/**
 * Created by Ilya Matsuev on 7/8/2020.
 */

public with sharing class TriggerErrorHandlerOptionValidator implements ITriggerOptionsValidator {
    public Boolean validate(Object errorHandlerObject) {
        if (errorHandlerObject == null) {
            throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', 'error handler'));
        } else if (!(errorHandlerObject instanceof ITriggerErrorHandler)) {
            throw new TriggerDispatcherException(
                Label.InstanceNotOfRequiredInterface.replace('%%%', 'error handler')
                    .replace('###', 'ITriggerErrorHandler')
            );
        }
        return true;
    }
}
