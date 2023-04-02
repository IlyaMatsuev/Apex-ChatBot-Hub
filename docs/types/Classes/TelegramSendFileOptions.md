# TelegramSendFileOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendDocument` method. The source: https://core.telegram.org/bots/api#senddocument

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendFileOptions

## Constructors

### `TelegramSendFileOptions()`

Creates an instance of the file message options

---

## Properties

### `entities` → `List<MessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withCaption(String caption)`

Sets the text caption for the file

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `caption` | The text to attach to the file |

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withThumbnail(String thumbnailUrl)`

Sets the thumbnail for the file

#### Parameters

| Param          | Description               |
| -------------- | ------------------------- |
| `thumbnailUrl` | The URL to the JPEG image |

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withoutContentTypeDetection()`

Disables automatic server-side content type detection

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withMessageEntity(MessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                                     |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramSendMessageOptions.MessageEntity](TelegramSendMessageOptions.MessageEntity), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withMessageEntities(MessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                                             |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramSendMessageOptions.MessageEntity](TelegramSendMessageOptions.MessageEntity) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendFileOptions

**Description**

The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class

---
