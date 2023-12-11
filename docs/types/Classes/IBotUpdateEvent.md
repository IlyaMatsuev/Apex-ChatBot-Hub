# IBotUpdateEvent

Describes the payload received as an update from a bot

## Methods

### `getType()`

Returns the type of the received update

#### Return

**Type**

BotUpdateEventType

**Description**

The instance of the [BotUpdateEventType](/types/Enums/BotUpdateEventType.md) enum

### `getMessage()`

Returns the message payload received in the update. Can be null

#### Return

**Type**

IBotMessage

**Description**

The instance of the [IBotMessage](/types/Classes/IBotMessage.md) interface

### `getChat()`

Returns the sender payload received in the update

#### Return

**Type**

IBotChat

**Description**

The instance of the [IBotChat](/types/Classes/IBotChat.md) interface

### `getPayload()`

Returns the source JSON payload of the update event

#### Return

**Type**

BotJsonPayload

**Description**

The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md)

---
