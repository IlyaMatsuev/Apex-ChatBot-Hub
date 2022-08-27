public class BotUpsertDataHandler implements Triggers.IHandler {
    private static final Map<SObjectType, Map<String, SObjectField>> SOBJECT_FIELDS_BY_TYPE = new Map<SObjectType, Map<String, SObjectField>>();

    public void handle(Triggers.Context context) {
        Map<String, List<SObject>> dataByExternalId = sortDataByExternalIdFields(
            (List<BotUpsertDataEvent__e>) context.props.newList
        );

        // There is no other way to correctly upsert records by external id. This is NECESSARY to have DML inside the loop
        for (String externalIdFieldFullName : dataByExternalId.keySet()) {
            List<SObject> data = dataByExternalId.get(externalIdFieldFullName);
            System.debug('data: ' + JSON.serializePretty(data));
            if (String.isBlank(externalIdFieldFullName)) {
                System.debug('no external id');
                Database.upsert(data);
            } else {
                SObjectField externalIdField = SOBJECT_FIELDS_BY_TYPE.get(data.get(0).getSObjectType())
                    .get(externalIdFieldFullName.substringAfter('.'));
                Database.upsert(data, externalIdField);
            }
        }
    }

    private Map<String, List<SObject>> sortDataByExternalIdFields(List<BotUpsertDataEvent__e> events) {
        Map<String, List<SObject>> dataByExternalId = new Map<String, List<SObject>>();
        for (BotUpsertDataEvent__e event : events) {
            List<SObject> records = (List<SObject>) JSON.deserialize(event.Data__c, List<SObject>.class);

            if (String.isBlank(event.ExternalIdField__c)) {
                addRecordsWithoutExternalId(dataByExternalId, records);
            } else {
                addRecordsWithExternalId(dataByExternalId, records, event.ExternalIdField__c);
            }
        }
        return dataByExternalId;
    }

    private void addRecordsWithoutExternalId(Map<String, List<SObject>> dataByExternalId, List<SObject> records) {
        if (!dataByExternalId.containsKey('')) {
            dataByExternalId.put('', new List<SObject>());
        }
        dataByExternalId.get('').addAll(records);
    }

    private void addRecordsWithExternalId(
        Map<String, List<SObject>> dataByExternalId,
        List<SObject> records,
        String externalIdFieldName
    ) {
        for (SObject record : records) {
            SObjectType recordType = record.getSObjectType();
            if (!SOBJECT_FIELDS_BY_TYPE.containsKey(recordType)) {
                SOBJECT_FIELDS_BY_TYPE.put(recordType, recordType.getDescribe().fields.getMap());
            }
            SObjectField externalIdField = SOBJECT_FIELDS_BY_TYPE.get(recordType).get(externalIdFieldName);
            String externalIdFieldFullName = String.valueOf(recordType) + '.' + String.valueOf(externalIdField);

            if (!dataByExternalId.containsKey(externalIdFieldFullName)) {
                dataByExternalId.put(externalIdFieldFullName, new List<SObject>());
            }
            dataByExternalId.get(externalIdFieldFullName).add(record);
        }
    }
}
