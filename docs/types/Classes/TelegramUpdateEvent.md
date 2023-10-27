# TelegramUpdateEvent

Describes the payload received as an update from a `Telegram` bot.

**Inheritance**

TelegramUpdateEvent

**Implemented types**

[IBotUpdateEvent](/types/Classes/IBotUpdateEvent.md)

## Methods

### `getType()`

Returns the type of the received `Telegram` update

#### Return

**Type**

TelegramUpdateEventType

**Description**

The instance of the [TelegramUpdateEventType](/types/Enums/TelegramUpdateEventType.md) enum

### `getMessage()`

Returns the `Telegram` message payload received in the update. Can be `null` in case of another update type

#### Return

**Type**

TelegramMessage

**Description**

The instance of the [TelegramMessage](/types/Classes/TelegramMessage.md) class

### `getChat()`

Returns the `Telegram` chat payload received in the update. Can be `null` if the update is not chat-related

#### Return

**Type**

TelegramChat

**Description**

The instance of the [TelegramChat](/types/Classes/TelegramChat.md) class

### `getPayload()`

Returns the source JSON payload of the update event

#### Return

**Type**

BotJsonPayload

**Description**

The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md)

---
