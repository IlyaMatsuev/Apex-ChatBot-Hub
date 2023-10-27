# BotType

Custom enum that contains all available bot types for the package. The same values are presented in the `Bot__c.Type__c` picklist

**Inheritance**

[BotEnumType](/types/Enums/BotEnumType.md)
&gt;
BotType

**Group** Enums

## Fields

### `Telegram` → `BotType`

`Telegram` bot type

### `Viber` → `BotType`

`Viber` bot type

---

## Methods

### `static valueOf(String value)`

Attempts to convert a string value to the [BotType](/types/Enums/BotType.md) enum

#### Parameters

| Param   | Description                      |
| ------- | -------------------------------- |
| `value` | The string value to be converted |

#### Return

**Type**

BotType

**Description**

The instance of the [BotType](/types/Enums/BotType.md) enum

#### Throws

| Exception                | Description                                         |
| ------------------------ | --------------------------------------------------- |
| `NoSuchElementException` | If the string value cannot be converted to the enum |

### `static values()`

Returns the list of all possible bot types

#### Return

**Type**

List&lt;BotType&gt;

**Description**

The list of [BotType](/types/Enums/BotType.md) enum instances

### `name()`

_Inherited_

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Return

**Type**

String

**Description**

The string value the enum was initialized with

### `override toString()`

_Inherited_

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Return

**Type**

String

**Description**

The String value the enum was initialized with

### `equals(Object other)`

_Inherited_

Checks if the passed object equals to the enum value

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `other` | Any object this enum instance is compared with |

#### Return

**Type**

Boolean

**Description**

`true` if the passed object equals to the current instance by a reference or a String value

### `hashCode()`

_Inherited_

Generates a hashcode based on the string value this enum is initialized with

#### Return

**Type**

Integer

**Description**

The enum's string value hashcode or `0` if the value is `null`

---
