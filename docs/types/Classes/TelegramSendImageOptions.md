# TelegramSendImageOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendPhoto` method.
Source: https://core.telegram.org/bots/api#sendphoto

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendImageOptions

## Constructors

### `TelegramSendImageOptions()`

Creates an instance of the image message options

---

## Properties

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withCaption(String caption)`

Sets the text caption for the image

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the image |

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `withSpoiler()`

Marks the message that it has a spoiler

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendImageOptions

**Description**

The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class

---
