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

### `Delivered` → `ViberUpdateEventType`

The `Viber` message event. Received when a message sent by the bot is delivered

### `Failed` → `ViberUpdateEventType`

The `Viber` fail event. Received when a sent message is failed because of some client's validations

### `Message` → `ViberUpdateEventType`

The `Viber` message event. Received when a user sends a message to the bot

### `Seen` → `ViberUpdateEventType`

The `Viber` message event. Received when a message sent by the bot is seen by the user

### `Subscribed` → `ViberUpdateEventType`

The `Viber` subscribe event. Received when a new user allows messages from the bot

### `Unsubscribed` → `ViberUpdateEventType`

The `Viber` unsubscribe event. Received when a new user forbids messages from the bot

### `WebhookCallback` → `ViberUpdateEventType`

The `Viber` webhook callback event. Received when the webhook is set

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
