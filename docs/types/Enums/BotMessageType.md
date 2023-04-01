# BotMessageType

The enum with all available message types for sending and receiving messages

**Inheritance**

BotMessageType

**Group** Enums

## Fields

### `Contact` → `BotMessageType`

The message sharing contact details

### `Custom` → `BotMessageType`

The message with custom layout

### `File` → `BotMessageType`

The document message

### `Image` → `BotMessageType`

The image message

### `Location` → `BotMessageType`

The message sharing location details

### `Sticker` → `BotMessageType`

The chat sticker message

### `Text` → `BotMessageType`

The plain text message

### `Url` → `BotMessageType`

The chat URL message

### `Video` → `BotMessageType`

The video message

---

## Methods

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
