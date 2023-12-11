# TelegramSendVideoNoteOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendVideoNote` method.
Source: https://core.telegram.org/bots/api#sendvideonote

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendVideoNoteOptions

## Properties

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withDuration(Integer duration)`

Sets the duration of the video

#### Parameters

| Param      | Description                          |
| ---------- | ------------------------------------ |
| `duration` | The duration of the video in seconds |

#### Return

**Type**

TelegramSendVideoNoteOptions

**Description**

The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class

### `withSize(Integer length)`

Sets the size of the video note, e.g. diameter of the video circle

#### Parameters

| Param    | Description               |
| -------- | ------------------------- |
| `length` | The diameter of the video |

#### Return

**Type**

TelegramSendVideoNoteOptions

**Description**

The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendVideoNoteOptions

**Description**

The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class

### `withThumbnail(String thumbnailUrl)`

Sets the thumbnail for the video

#### Parameters

| Param          | Description               |
| -------------- | ------------------------- |
| `thumbnailUrl` | The URL to the JPEG image |

#### Return

**Type**

TelegramSendVideoNoteOptions

**Description**

The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendVideoNoteOptions

**Description**

The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendVideoNoteOptions

**Description**

The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendVideoNoteOptions

**Description**

The current instance of the [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) class

---
