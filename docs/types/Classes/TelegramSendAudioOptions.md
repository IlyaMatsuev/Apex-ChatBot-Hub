# TelegramSendAudioOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendAudio` and `sendVoice` methods.
Source: https://core.telegram.org/bots/api#sendaudio, https://core.telegram.org/bots/api#sendvoice

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendAudioOptions

## Constructors

### `global TelegramSendAudioOptions()`

Creates an instance of the audio message options

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendAudioOptions withCaption(String caption)`

Sets the text caption for the audio

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the audio |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withTrackName(String performer, String title)`

Sets the title and performer names for the audio. Does not work for the `voice` message

#### Parameters

| Param       | Description                |
| ----------- | -------------------------- |
| `performer` | The performer of the track |
| `title`     | The title of the track     |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withDuration(Integer duration)`

Sets the duration of the audio

#### Parameters

| Param      | Description                          |
| ---------- | ------------------------------------ |
| `duration` | The duration of the audio in seconds |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withThumbnail(String thumbnailUrl)`

Sets the thumbnail for the audio

#### Parameters

| Param          | Description               |
| -------------- | ------------------------- |
| `thumbnailUrl` | The URL to the JPEG image |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

### `global TelegramSendAudioOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendAudioOptions` | The current instance of the [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) class |

---
