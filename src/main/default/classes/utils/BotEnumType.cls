/**
 * @description Custom enum type that provides more flexibility comparing to the native Apex enums
 */
global abstract class BotEnumType implements Comparable {
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

    /**
     * @description Returns the string representation of the enum. Works the same way as the native Apex enums
     * @return The string value the enum was initialized with
     */
    global String name() {
        return value;
    }

    /**
     * @description Returns the string representation of the enum. Works the same way as the native Apex enums
     * @return The String value the enum was initialized with
     */
    global override String toString() {
        return value;
    }

    /**
     * @description Checks if the passed object equals to the enum value
     * @param other Any object this enum instance is compared with
     * @return `true` if the passed object equals to the current instance by a reference or a String value
     */
    global virtual Boolean equals(Object other) {
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

    /**
     * @description Compares the passed object with the current instance as strings
     * @param compareTo Any object this enum instance is compared with
     * @return The same result as the native `String.compareTo()` method, checking enum string values
     */
    global Integer compareTo(Object compareTo) {
        return String.valueOf(this.value).compareTo(String.valueOf(compareTo));
    }

    /**
     * @description Generates a hashcode based on the string value this enum is initialized with
     * @return The enum's string value hashcode or `0` if the value is `null`
     */
    global Integer hashCode() {
        return this.value != null ? this.value.hashCode() : 0;
    }

    private void cacheEnumValue() {
        if (!cachedEnumValues.containsKey(type)) {
            cachedEnumValues.put(type, new Map<String, BotEnumType>());
        }
        cachedEnumValues.get(type).put(value, this);
    }
}
