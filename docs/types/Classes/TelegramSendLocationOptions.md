# virtual TelegramSendLocationOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendLocation` method.
Source: https://core.telegram.org/bots/api#sendlocation

**Inheritance**

TelegramSendLocationOptions

## Methods

### `global TelegramSendLocationOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

### `global TelegramSendLocationOptions withHorizontalAccuracy(Decimal accuracy)`

Sets the radius of uncertainty for the location, measured in meters

#### Parameters

| Param      | Description                                                                              |
| ---------- | ---------------------------------------------------------------------------------------- |
| `accuracy` | The radius of uncertainty for the location in meters. Accepts values in range: `0..1500` |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

### `global TelegramSendLocationOptions withLivePeriod(Integer period)`

Sets the period in seconds for which the location will be updated

#### Parameters

| Param    | Description                                                                                        |
| -------- | -------------------------------------------------------------------------------------------------- |
| `period` | The period in seconds for which the location will be updated. Accepts values in range: `60..86400` |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

### `global TelegramSendLocationOptions withProximityAlertRadius(Integer alertRadius)`

Sets the maximum distance in meters for proximity alerts about approaching another chat member

#### Parameters

| Param         | Description                                                                                                                     |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `alertRadius` | The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000` |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

### `global TelegramSendLocationOptions withHeading(Integer heading)`

Sets the direction in degrees in which the user is moving

#### Parameters

| Param     | Description                                                                             |
| --------- | --------------------------------------------------------------------------------------- |
| `heading` | The direction in degrees in which the user is moving. Accepts values in range: `1..360` |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

### `global TelegramSendLocationOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

### `global TelegramSendLocationOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

### `global TelegramSendLocationOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramSendLocationOptions` | The current instance of the [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) class |

---
