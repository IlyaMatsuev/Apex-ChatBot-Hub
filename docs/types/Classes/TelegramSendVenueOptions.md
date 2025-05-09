# TelegramSendVenueOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendVenue` method.
Source: https://core.telegram.org/bots/api#sendvenue

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendVenueOptions

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendVenueOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVenueOptions` | The current instance of the [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) class |

### `global TelegramSendVenueOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVenueOptions` | The current instance of the [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) class |

### `global TelegramSendVenueOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVenueOptions` | The current instance of the [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) class |

### `global TelegramSendVenueOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVenueOptions` | The current instance of the [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) class |

### `global TelegramSendVenueOptions asFoursquarePlace(String id, String type)`

Attaches a Foursquare place to the venue

#### Parameters

| Param  | Description                                                                    |
| ------ | ------------------------------------------------------------------------------ |
| `id`   | The Foursquare identifier of the venue                                         |
| `type` | The Foursquare type of the venue, if known. E.g. `arts_entertainment/aquarium` |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVenueOptions` | The current instance of the [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) class |

### `global TelegramSendVenueOptions asGooglePlace(String id, String type)`

Attaches a Google place to the venue

#### Parameters

| Param  | Description                         |
| ------ | ----------------------------------- |
| `id`   | The Google identifier of the venue  |
| `type` | The Google Places type of the venue |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVenueOptions` | The current instance of the [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) class |

---
