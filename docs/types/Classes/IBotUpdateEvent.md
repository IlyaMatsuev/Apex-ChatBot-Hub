# IBotUpdateEvent

Describes the payload received as an update from a bot

## Methods

### `global BotUpdateEventType getType()`

Returns the type of the received update

#### Returns

| Type                 | Description                                                                       |
| -------------------- | --------------------------------------------------------------------------------- |
| `BotUpdateEventType` | The instance of the [BotUpdateEventType](/types/Enums/BotUpdateEventType.md) enum |

### `global IBotMessage getMessage()`

Returns the message payload received in the update. Can be null

#### Returns

| Type          | Description                                                                |
| ------------- | -------------------------------------------------------------------------- |
| `IBotMessage` | The instance of the [IBotMessage](/types/Classes/IBotMessage.md) interface |

### `global IBotChat getChat()`

Returns the sender payload received in the update

#### Returns

| Type       | Description                                                          |
| ---------- | -------------------------------------------------------------------- |
| `IBotChat` | The instance of the [IBotChat](/types/Classes/IBotChat.md) interface |

### `global BotJsonPayload getPayload()`

Returns the source JSON payload of the update event

#### Returns

| Type             | Description                                                            |
| ---------------- | ---------------------------------------------------------------------- |
| `BotJsonPayload` | The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) |

---
