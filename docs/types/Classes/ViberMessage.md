# ViberMessage

Describes the message payload received as an update from a `Viber` bot

**Inheritance**

ViberMessage

**Implemented types**

[IBotMessage](/types/Classes/IBotMessage.md)

## Properties

### `contact` → `Contact`

The shared contact details

### `duration` → `Integer`

The attached video duration in seconds. Relevant for `video` type messages

### `fileName` → `String`

The attached file name. Relevant for `file` type messages

### `fileSize` → `Integer`

The attached file size in bytes. Relevant for `file` type messages

### `location` → `ViberLocation`

The shared location details

### `media` → `String`

The URL of the message media - can be `image`, `video`, `file` and `url`. Image/Video/File URLs will have a TTL of 1 hour

### `stickerId` → `Integer`

The sticker id. Relevant for `sticker` type messages

### `text` → `String`

The message text

### `trackingData` → `String`

The tracking data sent with the last message to the user

### `type` → `String`

The message type. Possible values are `text`, `picture`, `video`, `file`, `sticker`, `contact`, `url` and `location`

---

## Methods

### `getId()`

Returns the `Viber` message id

#### Return

**Type**

String

**Description**

The `Viber` message id

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

## Classes

### Contact

Represents the details for a contact message

**Inheritance**

Contact

#### Properties

##### `avatar` → `String`

The avatar URL

##### `name` → `String`

The contact’s username

##### `phoneNumber` → `String`

The contact’s phone number

---

---
