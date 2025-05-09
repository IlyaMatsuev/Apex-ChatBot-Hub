# TelegramUpdateEvent

Describes the payload received as an update from a `Telegram` bot.

**Inheritance**

TelegramUpdateEvent

**Implemented types**

[IBotUpdateEvent](/types/Classes/IBotUpdateEvent.md)

## Methods

### `global TelegramUpdateEventType getType()`

Returns the type of the received `Telegram` update

#### Returns

| Type                      | Description                                                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------- |
| `TelegramUpdateEventType` | The instance of the [TelegramUpdateEventType](/types/Enums/TelegramUpdateEventType.md) enum |

### `global TelegramMessage getMessage()`

Returns the `Telegram` message payload received in the update. Can be `null` in case of another update type

#### Returns

| Type              | Description                                                                    |
| ----------------- | ------------------------------------------------------------------------------ |
| `TelegramMessage` | The instance of the [TelegramMessage](/types/Classes/TelegramMessage.md) class |

### `global TelegramChat getChat()`

Returns the `Telegram` chat payload received in the update. Can be `null` if the update is not chat-related

#### Returns

| Type           | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| `TelegramChat` | The instance of the [TelegramChat](/types/Classes/TelegramChat.md) class |

### `global BotJsonPayload getEventPayload()`

Returns the instance of an event JSON payload used for creating instances of event models like [TelegramMessageEvent](/types/Classes/TelegramMessageEvent.md), [TelegramInlineQueryEvent](/types/Classes/TelegramInlineQueryEvent.md), etc.

#### Returns

| Type             | Description                                                            |
| ---------------- | ---------------------------------------------------------------------- |
| `BotJsonPayload` | The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) |

### `global BotJsonPayload getPayload()`

Returns the source JSON payload of the update event

#### Returns

| Type             | Description                                                            |
| ---------------- | ---------------------------------------------------------------------- |
| `BotJsonPayload` | The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) |

---
