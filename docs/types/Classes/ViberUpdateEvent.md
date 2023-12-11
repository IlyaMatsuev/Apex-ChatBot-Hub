# ViberUpdateEvent

Describes the payload received as an update from a `Viber` bot

**Inheritance**

ViberUpdateEvent

**Implemented types**

[IBotUpdateEvent](/types/Classes/IBotUpdateEvent.md)

## Methods

### `getType()`

Returns the type of the received `Viber` update

#### Return

**Type**

ViberUpdateEventType

**Description**

The instance of the [ViberUpdateEventType](/types/Enums/ViberUpdateEventType.md) enum

### `getMessage()`

Returns the `Viber` message payload received in the update. Can be `null` in case of another update type

#### Return

**Type**

ViberMessage

**Description**

The instance of the [ViberMessage](/types/Classes/ViberMessage.md) class

### `getChat()`

Returns the `Viber` chat payload received in the update. Can be null if the received update does not contain chat information

#### Return

**Type**

ViberChat

**Description**

The instance of the [ViberChat](/types/Classes/ViberChat.md) class

### `getPayload()`

Returns the source JSON payload of the update event

#### Return

**Type**

BotJsonPayload

**Description**

The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md)

---
