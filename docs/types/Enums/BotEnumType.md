# abstract BotEnumType

Custom enum type that provides more flexibility comparing to the native Apex enums

**Group** Enums

## Methods

### `global String name()`

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Returns

| Type     | Description                                    |
| -------- | ---------------------------------------------- |
| `String` | The string value the enum was initialized with |

### `global override String toString()`

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Returns

| Type     | Description                                    |
| -------- | ---------------------------------------------- |
| `String` | The String value the enum was initialized with |

### `global virtual Boolean equals(Object other)`

Checks if the passed object equals to the enum value

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `other` | Any object this enum instance is compared with |

#### Returns

| Type      | Description                                                                                 |
| --------- | ------------------------------------------------------------------------------------------- |
| `Boolean` | `true` if the passed object equals to the current instance by a reference or a String value |

### `global Integer hashCode()`

Generates a hashcode based on the string value this enum is initialized with

#### Returns

| Type      | Description                                                    |
| --------- | -------------------------------------------------------------- |
| `Integer` | The enum's string value hashcode or `0` if the value is `null` |

---
