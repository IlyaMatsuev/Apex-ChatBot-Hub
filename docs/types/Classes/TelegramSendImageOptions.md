# TelegramSendImageOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendPhoto` method.
Source: https://core.telegram.org/bots/api#sendphoto

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendImageOptions

## Constructors

### `global TelegramSendImageOptions()`

Creates an instance of the image message options

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendImageOptions withCaption(String caption)`

Sets the text caption for the image

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the image |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions withSpoiler()`

Marks the message that it has a spoiler

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

### `global TelegramSendImageOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                       | Description                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------- |
| `TelegramSendImageOptions` | The current instance of the [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) class |

---
