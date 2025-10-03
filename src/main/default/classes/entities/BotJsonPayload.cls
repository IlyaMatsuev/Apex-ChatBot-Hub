/**
 * @description Provides a convenient interface on top of the JSON payload via such methods as `getString()`, `getInteger()`, `toJson()`, etc.
 */
global virtual class BotJsonPayload {
    private final Map<String, Object> values;

    /**
     * @description Creates a new instance of JSON payload without any values
     */
    global BotJsonPayload() {
        this(new Map<String, Object>());
    }

    /**
     * @description Creates a new instance of JSON payload by the provided values from another instance
     * @param payload Another instance of <<BotJsonPayload>> to copy values from
     */
    global BotJsonPayload(BotJsonPayload payload) {
        this(payload?.getValues());
    }

    public BotJsonPayload(BotPayload payload) {
        this(payload?.getJsonPayload()?.getValues());
    }

    /**
     * @description Creates a new instance of JSON payload by the provided values from a `Map` instance
     * @param values The `Map` instance to copy values from
     */
    global BotJsonPayload(Map<String, Object> values) {
        this.values = new Map<String, Object>();
        if (values != null) {
            this.values.putAll(values);
        }
    }

    /**
     * @description Creates a new instance of JSON payload by the provided JSON string
     * @param jsonValues The JSON string to convert
     * @return The new instance of the <<BotJsonPayload>> class
     */
    global static BotJsonPayload fromJson(String jsonValues) {
        return fromJson(jsonValues, BotJsonPayload.class);
    }

    /**
     * @description Creates a new specific instance of JSON payload by the provided JSON string and instance type
     * @param jsonValues The JSON string to convert
     * @param payloadType The type to convert the instance to
     * @return The new instance of the <<BotJsonPayload>> class
     */
    global static BotJsonPayload fromJson(String jsonValues, Type payloadType) {
        BotJsonPayload values = (BotJsonPayload) payloadType.newInstance();
        try {
            if (String.isNotBlank(jsonValues)) {
                values.getValues().putAll((Map<String, Object>) JSON.deserializeUntyped(jsonValues));
            }
        } catch (JSONException ex) {
            // In case the input is not JSON
            values.getValues().put('raw', jsonValues);
        }
        values.init();
        return values;
    }

    /**
     * @description Creates a new specific instance of payload from another payload and instance type
     * @param payload The JSON payload to copy
     * @param payloadType The type to convert the instance to
     * @return The new instance of the <<BotJsonPayload>> class
     */
    global static BotJsonPayload fromPayload(BotJsonPayload payload, Type payloadType) {
        BotJsonPayload newPayload = (BotJsonPayload) payloadType.newInstance();
        newPayload.set(payload);
        newPayload.init();
        return newPayload;
    }

    /**
     * @description Serializes the instance to a JSON string
     * @return The JSON string
     */
    global String toJson() {
        return toJson(false);
    }

    /**
     * @description Serializes the instance to a (non-)prettified JSON string
     * @param pretty Determines if the output JSON should be prettified or not
     * @return The JSON string
     */
    global String toJson(Boolean pretty) {
        Map<String, Object> output = escapeExtraValuesProperty(values);
        return pretty ? JSON.serializePretty(output) : JSON.serialize(output);
    }

    /**
     * @description Returns all values from the JSON as a `Map` instance
     * @return The `Map<String, Object>` instance
     */
    global Map<String, Object> getValues() {
        return values;
    }

    /**
     * @description Checks if the current JSON payload has a value by the provided key
     * @param key The key of the value
     * @return `true` if the provided key exists in the JSON. Otherwise `false`
     */
    global Boolean has(String key) {
        return values.containsKey(key);
    }

    /**
     * @description Checks if the current JSON payload has a non-null value by the provided key
     * @param key The key of the value
     * @return `true` if the provided key exists in the JSON and it is not `null`. Otherwise `false`
     */
    global Boolean hasValue(String key) {
        return values.get(key) != null;
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `String`
     * @param key The JSON value key
     * @return The `String` value from the JSON
     */
    global String getString(String key) {
        return getString(key, null);
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `String`. Returns default if the JSON value is `null` or does not exist
     * @param key The JSON value key
     * @param defaultValue The default value to return if the JSON value is `null` or does not exist
     * @return The `String` value from the JSON or default value
     */
    global String getString(String key, String defaultValue) {
        return hasValue(key) ? String.valueOf(get(key)) : defaultValue;
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `List<String>`
     * @param key The JSON value key
     * @return The `List<String>` value from the JSON
     */
    global List<String> getStringList(String key) {
        if (!hasValue(key) || !(values.get(key) instanceof List<Object>)) {
            return null;
        }
        List<String> strList = new List<String>();
        for (Object el : (List<Object>) get(key)) {
            strList.add(String.valueOf(el));
        }
        return strList;
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `Integer`
     * @param key The JSON value key
     * @return The `Integer` value from the JSON
     */
    global Integer getInteger(String key) {
        return (Integer) get(key);
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `List<Integer>`
     * @param key The JSON value key
     * @return The `List<Integer>` value from the JSON
     */
    global List<Integer> getIntegerList(String key) {
        if (!hasValue(key) || !(values.get(key) instanceof List<Object>)) {
            return null;
        }
        List<Integer> intList = new List<Integer>();
        for (Object el : (List<Object>) get(key)) {
            intList.add(Integer.valueOf(el));
        }
        return intList;
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `Long`
     * @param key The JSON value key
     * @return The `Long` value from the JSON
     */
    global Long getLong(String key) {
        return (Long) get(key);
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `Decimal`
     * @param key The JSON value key
     * @return The `Decimal` value from the JSON
     */
    global Decimal getDecimal(String key) {
        return (Decimal) get(key);
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `Boolean`
     * @param key The JSON value key
     * @return The `Boolean` value from the JSON
     */
    global Boolean getBoolean(String key) {
        return (Boolean) get(key);
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to `DateTime`. Will automatically convert the value to `DateTime` if the target value is timestamp
     * @param key The JSON value key
     * @return The `DateTime` value from the JSON
     */
    global DateTime getDateTime(String key) {
        Object value = get(key);
        if (value instanceof Integer) {
            value = Long.valueOf(String.valueOf(value) + '000');
        }
        if (value instanceof Long) {
            DateTime dateTimeValue = DateTime.newInstance((Long) value);
            values.put(key, dateTimeValue);
            return dateTimeValue;
        }
        if (value instanceof String) {
            DateTime dateTimeValue;
            try {
                dateTimeValue = DateTime.valueOf(((String) value).replace('T', ' '));
            } catch (Exception ex) {
                dateTimeValue = (DateTime) JSON.deserialize((String) value, DateTime.class);
            }
            values.put(key, dateTimeValue);
            return dateTimeValue;
        }
        return (DateTime) value;
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to an instance of <<BotJsonPayload>>
     * @param key The JSON value key
     * @return The <<BotJsonPayload>> instance
     */
    global BotJsonPayload getJsonPayload(String key) {
        return getJsonPayload(key, BotJsonPayload.class);
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to a specific instance of <<BotJsonPayload>>
     * @param key The JSON value key
     * @param payloadType The Apex type of the result instance
     * @return The <<BotJsonPayload>> instance
     */
    global BotJsonPayload getJsonPayload(String key, Type payloadType) {
        Object value = get(key);
        if (value == null) {
            return null;
        }
        if (value instanceof BotJsonPayload) {
            return (BotJsonPayload) value;
        }
        if (value instanceof BotPayload) {
            return ((BotPayload) value).getJsonPayload();
        }
        BotJsonPayload newPayload = fromPayload(new BotJsonPayload((Map<String, Object>) value), payloadType);
        values.put(key, newPayload);
        return newPayload;
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to a `List` of <<BotJsonPayload>>
     * @param key The JSON value key
     * @return The <<BotJsonPayload>> `List` instance
     */
    global List<BotJsonPayload> getJsonPayloadList(String key) {
        Object value = get(key);
        if (value == null || !(value instanceof List<Object>)) {
            return null;
        }
        List<BotJsonPayload> payloadList = new List<BotJsonPayload>();
        for (Object val : (List<Object>) value) {
            payloadList.add(new BotJsonPayload((Map<String, Object>) val));
        }
        return payloadList;
    }

    /**
     * @description Returns a value from the JSON by the provided key, converting it to a `List` of <<BotJsonPayload>>
     * @param key The JSON value key
     * @param listEntryType The type of an entry of the result payload list
     * @return The <<BotJsonPayload>> `List` instance
     */
    global List<BotJsonPayload> getJsonPayloadList(String key, Type listEntryType) {
        Object value = get(key);
        if (value == null || !(value instanceof List<Object>)) {
            return null;
        }
        List<BotJsonPayload> payloadList = (List<BotJsonPayload>) JSON.deserialize(
            '[]',
            Type.forName('List<' + listEntryType.getName() + '>')
        );
        for (Object val : (List<Object>) value) {
            BotJsonPayload payload = new BotJsonPayload();
            if (val instanceof BotJsonPayload) {
                payload.set((BotJsonPayload) val);
            } else {
                payload.set(new BotJsonPayload((Map<String, Object>) val));
            }
            BotJsonPayload newPayload = fromPayload(payload, listEntryType);
            payloadList.add(newPayload);
        }
        return payloadList;
    }

    /**
     * @description Returns a value from the JSON by the provided key
     * @param key The JSON value key
     * @return The value from the JSON
     */
    global Object get(String key) {
        return values.get(key);
    }

    /**
     * @description Sets a new value to the JSON payload
     * @param key The key of the new value
     * @param value The value
     * @return The current instance of the <<BotJsonPayload>> class
     */
    global BotJsonPayload set(String key, Object value) {
        return set(key, value, false);
    }

    /**
     * @description Sets all values from another instance of <<BotJsonPayload>>
     * @param payload Another payload to copy values from
     * @return The current instance of the <<BotJsonPayload>> class
     */
    global BotJsonPayload set(BotJsonPayload payload) {
        values.putAll(payload.getValues());
        return this;
    }

    /**
     * @description Sets a new value to the JSON payload, if the provided value not `null`
     * @param key The key of the new value
     * @param value The value
     * @param skipNull Determines if the setting value should be skipped in case of `null`
     * @return The current instance of the <<BotJsonPayload>> class
     */
    global BotJsonPayload set(String key, Object value, Boolean skipNull) {
        if (!skipNull || value != null) {
            values.put(key, value);
        }
        return this;
    }

    public override String toString() {
        return toJson();
    }

    /**
     * @description Override to set initial values for a new <<BotJsonPayload>> instance when created using `fromPayload()` or `fromJson()` methods
     */
    protected virtual void init() {}

    private Map<String, Object> escapeExtraValuesProperty(Map<String, Object> values) {
        Map<String, Object> output = new Map<String, Object>();
        for (String key : values.keySet()) {
            Object val = escapeExtraValueProperty(values.get(key));
            output.put(key, val);
        }
        return output;
    }

    private Object escapeExtraValueProperty(Object value) {
        if (value instanceof BotPayload) {
            return escapeExtraValueProperty(((BotPayload) value).getJsonPayload());
        } else if (value instanceof BotJsonPayload) {
            return escapeExtraValuesProperty(((BotJsonPayload) value).values);
        } else if (value instanceof Map<String, Object>) {
            return escapeExtraValuesProperty((Map<String, Object>) value);
        } else if (value instanceof List<Object>) {
            List<Object> values = new List<Object>();
            for (Object el : (List<Object>) value) {
                values.add(escapeExtraValueProperty(el));
            }
            return values;
        }
        return value;
    }
}
