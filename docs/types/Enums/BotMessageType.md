# BotMessageType

The enum with all available message types for sending and receiving messages

**Inheritance**

[BotEnumType](/types/Enums/BotEnumType.md)
&gt;
BotMessageType

**Group** Enums

## Fields

### `global Text` → `BotMessageType`

The plain text message

### `global Image` → `BotMessageType`

The image message

### `global Video` → `BotMessageType`

The video message

### `global Animation` → `BotMessageType`

The animation message (a video without sound, e.g. `gif`)

### `global Audio` → `BotMessageType`

The audio message

### `global File` → `BotMessageType`

The document message

### `global GroupMedia` → `BotMessageType`

The message with multiple images/video/files

### `global Contact` → `BotMessageType`

The message sharing contact details

### `global Location` → `BotMessageType`

The message sharing location details

### `global Venue` → `BotMessageType`

The message sharing a venue details

### `global Sticker` → `BotMessageType`

The chat sticker message

### `global Url` → `BotMessageType`

The URL message

### `global Poll` → `BotMessageType`

The poll message

### `global Custom` → `BotMessageType`

The message with custom layout

### `global Other` → `BotMessageType`

Any other message types

---

## Methods

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
