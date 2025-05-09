# TelegramSendTextOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendMessage` method.
Source: https://core.telegram.org/bots/api#sendmessage

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendTextOptions

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendTextOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

### `global TelegramSendTextOptions withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

### `global TelegramSendTextOptions withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

### `global TelegramSendTextOptions withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

### `global TelegramSendTextOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

### `global TelegramSendTextOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

### `global TelegramSendTextOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

### `global TelegramSendTextOptions withoutLinksPreview()`

Disables link previews for links in this message

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendTextOptions` | The current instance of the [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) class |

---
