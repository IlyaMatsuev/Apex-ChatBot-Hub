# IBotMessage

Describes the message payload received as an update from a bot

## Methods

### `global String getId()`

Returns the message external id

#### Returns

| Type     | Description             |
| -------- | ----------------------- |
| `String` | The message external id |

### `global BotMessageType getType()`

Returns the message type

#### Returns

| Type             | Description                                                               |
| ---------------- | ------------------------------------------------------------------------- |
| `BotMessageType` | The instance of the [BotMessageType](/types/Enums/BotMessageType.md) enum |

### `global String getText()`

Returns the message text

#### Returns

| Type     | Description      |
| -------- | ---------------- |
| `String` | The message text |

### `global String getMediaUrl()`

Returns the media URL if it was attached to the message

#### Returns

| Type     | Description           |
| -------- | --------------------- |
| `String` | The message media URL |

### `global DateTime getSendDate()`

Returns the message send date

#### Returns

| Type       | Description           |
| ---------- | --------------------- |
| `DateTime` | The message send date |

### `global BotJsonPayload getParameters()`

Returns the additional message parameters

#### Returns

| Type             | Description                                                                  |
| ---------------- | ---------------------------------------------------------------------------- |
| `BotJsonPayload` | The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

---
