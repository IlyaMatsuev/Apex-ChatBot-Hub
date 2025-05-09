# BotType

Custom enum that contains all available bot types for the package. The same values are presented in the `Bot__c.Type__c` picklist

**Inheritance**

[BotEnumType](/types/Enums/BotEnumType.md)
&gt;
BotType

**Group** Enums

## Fields

### `global Telegram` → `BotType`

`Telegram` bot type

### `global Viber` → `BotType`

`Viber` bot type

---

## Methods

### `global static BotType valueOf(String value)`

Attempts to convert a string value to the [BotType](/types/Enums/BotType.md) enum

#### Parameters

| Param   | Description                      |
| ------- | -------------------------------- |
| `value` | The string value to be converted |

#### Returns

| Type      | Description                                                 |
| --------- | ----------------------------------------------------------- |
| `BotType` | The instance of the [BotType](/types/Enums/BotType.md) enum |

#### Throws

| Exception                | Description                                         |
| ------------------------ | --------------------------------------------------- |
| `NoSuchElementException` | If the string value cannot be converted to the enum |

### `global static List<BotType> values()`

Returns the list of all possible bot types

#### Returns

| Type            | Description                                                   |
| --------------- | ------------------------------------------------------------- |
| `List<BotType>` | The list of [BotType](/types/Enums/BotType.md) enum instances |

### `global String name()`

_Inherited_

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Returns

| Type     | Description                                    |
| -------- | ---------------------------------------------- |
| `String` | The string value the enum was initialized with |

### `global override String toString()`

_Inherited_

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Returns

| Type     | Description                                    |
| -------- | ---------------------------------------------- |
| `String` | The String value the enum was initialized with |

### `global virtual Boolean equals(Object other)`

_Inherited_

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

_Inherited_

Generates a hashcode based on the string value this enum is initialized with

#### Returns

| Type      | Description                                                    |
| --------- | -------------------------------------------------------------- |
| `Integer` | The enum's string value hashcode or `0` if the value is `null` |

---
