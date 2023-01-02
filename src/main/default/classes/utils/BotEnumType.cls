public abstract class BotEnumType implements Comparable {
    private static transient Map<String, BotEnumType> chachedEnumValues = new Map<String, BotEnumType>();
    private transient Type type;
    private String value;

    protected BotEnumType(String value, Type type) {
        this.value = value;
        this.type = type;
        chachedEnumValues.put(
            value != null ? String.valueOf(type) + '.' + value.toLowerCase().replaceAll(' ', '') : null,
            this
        );
    }

    public static BotEnumType valueOf(String value, Type enumType) {
        String lookupKey = value != null
            ? String.valueOf(enumType) + '.' + value.toLowerCase().replaceAll(' ', '')
            : null;
        if (!chachedEnumValues.containsKey(lookupKey)) {
            throw new NoSuchElementException('No such value "' + value + '" in enum ' + String.valueOf(enumType));
        }
        return chachedEnumValues.get(lookupKey);
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
}
