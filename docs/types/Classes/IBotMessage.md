# IBotMessage

Describes the message payload received as an update from a bot

## Methods

### `getId()`

Returns the message external id

#### Return

**Type**

String

**Description**

The message external id

### `getType()`

Returns the message type

#### Return

**Type**

BotMessageType

**Description**

The instance of the [BotMessageType](/types/Enums/BotMessageType.md) enum

### `getText()`

Returns the message text

#### Return

**Type**

String

**Description**

The message text

### `getMediaUrl()`

Returns the media URL if it was attached to the message

#### Return

**Type**

String

**Description**

The message media URL

### `getSendDate()`

Returns the message send date

#### Return

**Type**

DateTime

**Description**

The message send date

### `getParameters()`

Returns the additional message parameters

#### Return

**Type**

BotJsonPayload

**Description**

The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class

---
