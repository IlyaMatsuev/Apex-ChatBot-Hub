# TelegramSendVideoOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendVideo` and `sendAnimation` methods.
Source: https://core.telegram.org/bots/api#sendvideo

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendVideoOptions

## Constructors

### `global TelegramSendVideoOptions()`

Creates an instance of the video message options

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendVideoOptions withCaption(String caption)`

Sets the text caption for the video

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the video |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withSpoiler()`

Marks the message that it has a spoiler

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withDuration(Integer duration)`

Sets the duration of the video

#### Parameters

| Param      | Description                          |
| ---------- | ------------------------------------ |
| `duration` | The duration of the video in seconds |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withLayout(Integer width, Integer height)`

Sets the layout of the video by the provided width and height

#### Parameters

| Param    | Description             |
| -------- | ----------------------- |
| `width`  | The width of the video  |
| `height` | The height of the video |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withThumbnail(String thumbnailUrl)`

Sets the thumbnail for the video

#### Parameters

| Param          | Description               |
| -------------- | ------------------------- |
| `thumbnailUrl` | The URL to the JPEG image |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withStreamingSupport()`

Marks the video as suitable for streaming. Does not work for the `animation` message

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

### `global TelegramSendVideoOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoOptions` | The current instance of the [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) class |

---
