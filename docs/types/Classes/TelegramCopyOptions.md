# TelegramCopyOptions

Represents the optional parameters for the `Telegram` `copy` method.
Source: https://core.telegram.org/bots/api#copymessage

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramCopyOptions

## Constructors

### `global TelegramCopyOptions()`

Creates an instance of the copy message options

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramCopyOptions withCaption(String caption)`

Sets the new caption for the media

#### Parameters

| Param     | Description                   |
| --------- | ----------------------------- |
| `caption` | The new caption for the media |

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

### `global TelegramCopyOptions withParseMode(String mode)`

Sets the caption text parse mode. Needed when the caption text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

### `global TelegramCopyOptions withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the caption text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

### `global TelegramCopyOptions withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the caption text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

### `global TelegramCopyOptions asReplyToMessage(String messageId)`

Copies the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

### `global TelegramCopyOptions withThreadId(String threadId)`

Sets the unique identifier for the target message thread (topic) of the forum; for forum supergroups only

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

### `global TelegramCopyOptions withoutNotification()`

Copies the message silently. The receiver will get a notification with no sound

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

### `global TelegramCopyOptions withProtectedContent()`

Protects the contents of the copied message from forwarding and saving

#### Returns

| Type                  | Description                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `TelegramCopyOptions` | The current instance of the [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) class |

---
