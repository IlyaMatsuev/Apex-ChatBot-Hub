public virtual class BotJsonPayload {
    private final Map<String, Object> values;

    public BotJsonPayload() {
        this(new Map<String, Object>());
    }

    public BotJsonPayload(BotJsonPayload values) {
        this(values.getValues());
    }

    public BotJsonPayload(Map<String, Object> values) {
        this.values = new Map<String, Object>();
        this.values.putAll(values);
    }

    public static BotJsonPayload fromJson(String jsonValues) {
        return fromJson(jsonValues, BotJsonPayload.class);
    }

    public static BotJsonPayload fromJson(String jsonValues, Type payloadType) {
        BotJsonPayload values = (BotJsonPayload) payloadType.newInstance();
        try {
            values.getValues().putAll((Map<String, Object>) JSON.deserializeUntyped(jsonValues));
        } catch (JSONException ex) {
            // In case the input is not JSON
            values.getValues().put('raw', jsonValues);
        }
        return values;
    }

    public String toJson() {
        return toJson(false);
    }

    public String toJson(Boolean pretty) {
        Map<String, Object> output = escapeExtraValuesProperty(values);
        return pretty ? JSON.serializePretty(output) : JSON.serialize(output);
    }

    public override String toString() {
        return toJson();
    }

    public String getString(String key) {
        return String.valueOf(get(key));
    }

    public Integer getInteger(String key) {
        return (Integer) get(key);
    }

    public Boolean getBoolean(String key) {
        return (Boolean) get(key);
    }

    public Long getLong(String key) {
        return (Long) get(key);
    }

    public Decimal getDecimal(String key) {
        return (Decimal) get(key);
    }

    public DateTime getDateTime(String key) {
        Object value = get(key);
        if (value instanceof Integer) {
            value = Long.valueOf(String.valueOf(value) + '000');
        }
        if (value instanceof Long) {
            DateTime dateTimeValue = DateTime.newInstance((Long) value);
            values.put(key, dateTimeValue);
            return dateTimeValue;
        }
        return (DateTime) value;
    }

    public BotJsonPayload getJsonPayload(String key) {
        return getJsonPayload(key, BotJsonPayload.class);
    }

    public BotJsonPayload getJsonPayload(String key, Type payloadType) {
        Object value = get(key);
        if (value instanceof BotJsonPayload) {
            return (BotJsonPayload) value;
        }
        BotJsonPayload newPayload = (BotJsonPayload) payloadType.newInstance();
        newPayload.values.putAll((Map<String, Object>) value);
        values.put(key, newPayload);
        return newPayload;
    }

    public Object get(String key) {
        return values.get(key);
    }

    public Map<String, Object> getValues() {
        return values;
    }

    public BotJsonPayload set(String key, Object value) {
        return set(key, value, false);
    }

    public BotJsonPayload set(String key, Object value, Boolean skipNull) {
        if (!skipNull || value != null) {
            values.put(key, value);
        }
        return this;
    }

    public Boolean has(String key) {
        return values.containsKey(key);
    }

    public Boolean hasValue(String key) {
        return values.get(key) != null;
    }

    private Map<String, Object> escapeExtraValuesProperty(Map<String, Object> values) {
        Map<String, Object> output = new Map<String, Object>();
        for (String key : values.keySet()) {
            Object val = escapeExtraValueProperty(values.get(key));
            output.put(key, val);
        }
        return output;
    }

    private Object escapeExtraValueProperty(Object value) {
        if (value instanceof BotJsonPayload) {
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
