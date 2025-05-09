# TelegramSendFileOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendDocument` method.
Source: https://core.telegram.org/bots/api#senddocument

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendFileOptions

## Constructors

### `global TelegramSendFileOptions()`

Creates an instance of the file message options

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendFileOptions withCaption(String caption)`

Sets the text caption for the file

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `caption` | The text to attach to the file |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withThumbnail(String thumbnailUrl)`

Sets the thumbnail for the file

#### Parameters

| Param          | Description               |
| -------------- | ------------------------- |
| `thumbnailUrl` | The URL to the JPEG image |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withoutContentTypeDetection()`

Disables automatic server-side content type detection

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withParseMode(String mode)`

Sets the message text parse mode. Needed when the message text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

### `global TelegramSendFileOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendFileOptions` | The current instance of the [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) class |

---
