# ViberMessage

Describes the message payload received as an update from a `Viber` bot

**Inheritance**

ViberMessage

**Implemented types**

[IBotMessage](/types/Classes/IBotMessage.md)

## Properties

### `global type` → `String`

The message type. Possible values are `text`, `picture`, `video`, `file`, `sticker`, `contact`, `url` and `location`

### `global text` → `String`

The message text

### `global media` → `String`

The URL of the message media - can be `image`, `video`, `file` and `url`. Image/Video/File URLs will have a TTL of 1 hour

### `global location` → `ViberLocation`

The shared location details

### `global contact` → `Contact`

The shared contact details

### `global trackingData` → `String`

The tracking data sent with the last message to the user

### `global fileName` → `String`

The attached file name. Relevant for `file` type messages

### `global fileSize` → `Integer`

The attached file size in bytes. Relevant for `file` type messages

### `global duration` → `Integer`

The attached video duration in seconds. Relevant for `video` type messages

### `global stickerId` → `Integer`

The sticker id. Relevant for `sticker` type messages

---

## Methods

### `global String getId()`

Returns the `Viber` message id

#### Returns

| Type     | Description            |
| -------- | ---------------------- |
| `String` | The `Viber` message id |

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

## Classes

### Contact

Represents the details for a contact message

**Inheritance**

Contact

#### Properties

##### `global name` → `String`

The contact’s username

##### `global phoneNumber` → `String`

The contact’s phone number

##### `global avatar` → `String`

The avatar URL

---

---
