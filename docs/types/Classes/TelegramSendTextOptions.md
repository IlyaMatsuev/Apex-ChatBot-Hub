# TelegramSendTextOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendMessage` method. The source: https://core.telegram.org/bots/api#sendmessage

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendTextOptions

## Properties

### `entities` → `List<MessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

### `withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

### `withMessageEntity(MessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                                     |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramSendMessageOptions.MessageEntity](TelegramSendMessageOptions.MessageEntity), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

### `withMessageEntities(MessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                                             |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramSendMessageOptions.MessageEntity](TelegramSendMessageOptions.MessageEntity) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

### `withoutLinksPreview()`

Disables link previews for links in this message

#### Return

**Type**

TelegramSendTextOptions

**Description**

The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class

---
