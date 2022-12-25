public virtual class ValueMap {
    private final Map<String, Object> values;

    public ValueMap() {
        this(new Map<String, Object>());
    }

    public ValueMap(Map<String, Object> values) {
        this.values = values;
    }

    public static ValueMap fromJson(String jsonValues) {
        return fromJson(jsonValues, ValueMap.class);
    }

    public static ValueMap fromJson(String jsonValues, Type valueMapType) {
        ValueMap values = (ValueMap) valueMapType.newInstance();
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

    public DateTime getDateTime(String key) {
        Object value = get(key);
        if (value instanceof Long) {
            DateTime dateTimeValue = DateTime.newInstance((Long) value);
            values.put(key, dateTimeValue);
            return dateTimeValue;
        }
        return (DateTime) value;
    }

    public ValueMap getValueMap(String key) {
        return getValueMap(key, ValueMap.class);
    }

    public ValueMap getValueMap(String key, Type valueMapType) {
        Object value = get(key);
        if (value instanceof ValueMap) {
            return (ValueMap) value;
        }
        ValueMap newValueMap = (ValueMap) valueMapType.newInstance();
        newValueMap.values.putAll((Map<String, Object>) value);
        values.put(key, newValueMap);
        return newValueMap;
    }

    public Object get(String key) {
        return values.get(key);
    }

    public Map<String, Object> getValues() {
        return values;
    }

    public ValueMap set(String key, Object value) {
        values.put(key, value);
        return this;
    }

    public Boolean has(String key) {
        return values.containsKey(key);
    }

    private Map<String, Object> escapeExtraValuesProperty(Map<String, Object> values) {
        Map<String, Object> output = new Map<String, Object>();
        for (String key : values.keySet()) {
            Object value = values.get(key);
            if (value instanceof ValueMap) {
                output.put(key, escapeExtraValuesProperty(((ValueMap) value).values));
            } else if (value instanceof List<Object>) {
                output.put(key, new List<Object>());
                for (Object el : (List<Object>) value) {
                    if (el instanceof ValueMap) {
                        ((List<Object>) output.get(key)).add(escapeExtraValuesProperty(((ValueMap) el).values));
                    } else {
                        ((List<Object>) output.get(key)).add(el);
                    }
                }
            } else {
                output.put(key, value);
            }
        }
        return output;
    }
}
