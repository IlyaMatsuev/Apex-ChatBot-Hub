public abstract class BotEnumType implements Comparable {
    private static final transient Map<Type, Map<String, BotEnumType>> cachedEnumValues = new Map<Type, Map<String, BotEnumType>>();
    private final transient Type type;
    private final String value;

    protected BotEnumType(String value, Type type) {
        this.value = value;
        this.type = type;
        cacheEnumValue();
    }

    public static BotEnumType valueOf(String value, Type enumType) {
        if (!cachedEnumValues.containsKey(enumType) || !cachedEnumValues.get(enumType).containsKey(value)) {
            throw new NoSuchElementException('No such value "' + value + '" in enum ' + String.valueOf(enumType));
        }
        return cachedEnumValues.get(enumType).get(value);
    }

    public String name() {
        return value;
    }

    public override String toString() {
        return value;
    }

    public virtual Boolean equals(Object other) {
        if (this === other) {
            return true;
        }
        if (other instanceof BotEnumType) {
            return this.value == ((BotEnumType) other).value;
        }
        if (other instanceof String) {
            return this.value == (String) other;
        }
        return this.value == other || this.value == String.valueOf(other);
    }

    public Integer compareTo(Object compareTo) {
        return String.valueOf(this.value).compareTo(String.valueOf(compareTo));
    }

    public Integer hashCode() {
        return this.value != null ? this.value.hashCode() : 0;
    }

    private void cacheEnumValue() {
        if (!cachedEnumValues.containsKey(type)) {
            cachedEnumValues.put(type, new Map<String, BotEnumType>());
        }
        cachedEnumValues.get(type).put(value, this);
    }
}
