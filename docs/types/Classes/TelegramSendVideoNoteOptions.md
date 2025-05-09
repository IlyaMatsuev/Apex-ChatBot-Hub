# TelegramSendVideoNoteOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendVideoNote` method.
Source: https://core.telegram.org/bots/api#sendvideonote

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendVideoNoteOptions

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendVideoNoteOptions withDuration(Integer duration)`

Sets the duration of the video

#### Parameters

| Param      | Description                          |
| ---------- | ------------------------------------ |
| `duration` | The duration of the video in seconds |

#### Returns

| Type                           | Description                                                                                                      |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoNoteOptions` | The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class |

### `global TelegramSendVideoNoteOptions withSize(Integer length)`

Sets the size of the video note, e.g. diameter of the video circle

#### Parameters

| Param    | Description               |
| -------- | ------------------------- |
| `length` | The diameter of the video |

#### Returns

| Type                           | Description                                                                                                      |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoNoteOptions` | The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class |

### `global TelegramSendVideoNoteOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                           | Description                                                                                                      |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoNoteOptions` | The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class |

### `global TelegramSendVideoNoteOptions withThumbnail(String thumbnailUrl)`

Sets the thumbnail for the video

#### Parameters

| Param          | Description               |
| -------------- | ------------------------- |
| `thumbnailUrl` | The URL to the JPEG image |

#### Returns

| Type                           | Description                                                                                                      |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoNoteOptions` | The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class |

### `global TelegramSendVideoNoteOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                           | Description                                                                                                      |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoNoteOptions` | The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class |

### `global TelegramSendVideoNoteOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                           | Description                                                                                                      |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoNoteOptions` | The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class |

### `global TelegramSendVideoNoteOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                           | Description                                                                                                      |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramSendVideoNoteOptions` | The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class |

---
