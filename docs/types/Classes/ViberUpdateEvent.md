# ViberUpdateEvent

Describes the payload received as an update from a `Viber` bot

**Inheritance**

ViberUpdateEvent

**Implemented types**

[IBotUpdateEvent](/types/Classes/IBotUpdateEvent.md)

## Methods

### `global ViberUpdateEventType getType()`

Returns the type of the received `Viber` update

#### Returns

| Type                   | Description                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------- |
| `ViberUpdateEventType` | The instance of the [ViberUpdateEventType](/types/Enums/ViberUpdateEventType.md) enum |

### `global ViberMessage getMessage()`

Returns the `Viber` message payload received in the update. Can be `null` in case of another update type

#### Returns

| Type           | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| `ViberMessage` | The instance of the [ViberMessage](/types/Classes/ViberMessage.md) class |

### `global ViberChat getChat()`

Returns the `Viber` chat payload received in the update. Can be null if the received update does not contain chat information

#### Returns

| Type        | Description                                                        |
| ----------- | ------------------------------------------------------------------ |
| `ViberChat` | The instance of the [ViberChat](/types/Classes/ViberChat.md) class |

### `global BotJsonPayload getPayload()`

Returns the source JSON payload of the update event

#### Returns

| Type             | Description                                                            |
| ---------------- | ---------------------------------------------------------------------- |
| `BotJsonPayload` | The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) |

---
