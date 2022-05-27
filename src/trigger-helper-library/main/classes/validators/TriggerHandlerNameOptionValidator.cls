/**
 * Created by Ilya Matsuev on 7/12/2020.
 */

public with sharing class TriggerHandlerNameOptionValidator implements ITriggerOptionsValidator {
    public Boolean validate(Object handlerNameObject) {
        if (!(handlerNameObject instanceof String)) {
            throw new TriggerDispatcherException(
                Label.InstanceNotOfRequiredType.replace('%%%', 'handler name').replace('###', 'String')
            );
        } else if (String.isBlank((String) handlerNameObject)) {
            throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', 'handler name'));
        }
        return true;
    }
}
