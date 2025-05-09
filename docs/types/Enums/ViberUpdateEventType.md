# ViberUpdateEventType

Custom enum class that contains all available event types for `Viber` bots.
Source: https://developers.viber.com/docs/api/rest-bot-api/#setting-a-webhook

**Inheritance**

[BotEnumType](/types/Enums/BotEnumType.md)
&gt;
[BotUpdateEventType](/types/Enums/BotUpdateEventType.md)
&gt;
ViberUpdateEventType

**Group** Enums

## Fields

### `global WebhookCallback` → `ViberUpdateEventType`

The `Viber` webhook callback event. Received when the webhook is set

### `global Subscribed` → `ViberUpdateEventType`

The `Viber` subscribe event. Received when a new user allows messages from the bot

### `global Unsubscribed` → `ViberUpdateEventType`

The `Viber` unsubscribe event. Received when a new user forbids messages from the bot

### `global Message` → `ViberUpdateEventType`

The `Viber` message event. Received when a user sends a message to the bot

### `global Delivered` → `ViberUpdateEventType`

The `Viber` message event. Received when a message sent by the bot is delivered

### `global Seen` → `ViberUpdateEventType`

The `Viber` message event. Received when a message sent by the bot is seen by the user

### `global Failed` → `ViberUpdateEventType`

The `Viber` fail event. Received when a sent message is failed because of some client's validations

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
