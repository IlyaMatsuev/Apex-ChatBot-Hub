/**
 * Created by Ilya Matsuev on 7/12/2020.
 */

public with sharing class TriggerJobPrefixOptionValidator implements ITriggerOptionsValidator {
    public Boolean validate(Object jobPrefixObject) {
        if (!(jobPrefixObject instanceof String)) {
            throw new TriggerDispatcherException(
                Label.InstanceNotOfRequiredType.replace('%%%', 'job prefix').replace('###', 'String')
            );
        } else if (String.isBlank((String) jobPrefixObject)) {
            throw new TriggerDispatcherException(Label.InstanceCannotBeNull.replace('%%%', 'job prefix'));
        }
        return true;
    }
}
