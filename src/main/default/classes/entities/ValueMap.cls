public virtual class ValueMap {
    private final Map<String, Object> values;

    public ValueMap() {
        this(new Map<String, Object>());
    }

    public ValueMap(ValueMap values) {
        this(values.getValues());
    }

    public ValueMap(Map<String, Object> values) {
        this.values = new Map<String, Object>();
        this.values.putAll(values);
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
        return set(key, value, false);
    }

    public ValueMap set(String key, Object value, Boolean skipNull) {
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
        if (value instanceof ValueMap) {
            return escapeExtraValuesProperty(((ValueMap) value).values);
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
