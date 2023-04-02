# TelegramSendLocationOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendLocation` method. The source: https://core.telegram.org/bots/api#sendlocation

**Inheritance**

TelegramSendLocationOptions

## Methods

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

### `withHorizontalAccuracy(Decimal accuracy)`

Sets the radius of uncertainty for the location, measured in meters

#### Parameters

| Param      | Description                                                                              |
| ---------- | ---------------------------------------------------------------------------------------- |
| `accuracy` | The radius of uncertainty for the location in meters. Accepts values in range: `0..1500` |

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

### `withLivePeriod(Integer period)`

Sets the period in seconds for which the location will be updated

#### Parameters

| Param    | Description                                                                                        |
| -------- | -------------------------------------------------------------------------------------------------- |
| `period` | The period in seconds for which the location will be updated. Accepts values in range: `60..86400` |

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

### `withProximityAlertRadius(Integer alertRadius)`

Sets the maximum distance in meters for proximity alerts about approaching another chat member

#### Parameters

| Param    | Description                                                                                                                     |
| -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `period` | The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000` |

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

### `withHeading(Integer heading)`

Sets the direction in degrees in which the user is moving

#### Parameters

| Param     | Description                                                                             |
| --------- | --------------------------------------------------------------------------------------- |
| `heading` | The direction in degrees in which the user is moving. Accepts values in range: `1..360` |

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendLocationOptions

**Description**

The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class

---
