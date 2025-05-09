# TelegramInputMediaDocument

Describes the input document media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediadocument

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
[TelegramInputMedia](/types/Classes/TelegramInputMedia.md)
&gt;
TelegramInputMediaDocument

## Constructors

### `global TelegramInputMediaDocument(String media)`

Creates a new instance of input document media with the provided URL or file id

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `media` | The `Telegram` file id or the URL to the audio |

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramInputMediaDocument withThumbnail(String thumbnail)`

Sets the thumbnail for the file

#### Parameters

| Param       | Description               |
| ----------- | ------------------------- |
| `thumbnail` | The URL to the JPEG image |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaDocument` | The current instance of the [TelegramInputMediaDocument](/types/Classes/TelegramInputMediaDocument.md) class |

### `global TelegramInputMediaDocument withCaption(String caption)`

Sets the caption for the file

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `caption` | The text to attach to the file |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaDocument` | The current instance of the [TelegramInputMediaDocument](/types/Classes/TelegramInputMediaDocument.md) class |

### `global TelegramInputMediaDocument withParseMode(String mode)`

Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaDocument` | The current instance of the [TelegramInputMediaDocument](/types/Classes/TelegramInputMediaDocument.md) class |

### `global TelegramInputMediaDocument withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message caption. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaDocument` | The current instance of the [TelegramInputMediaDocument](/types/Classes/TelegramInputMediaDocument.md) class |

### `global TelegramInputMediaDocument withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaDocument` | The current instance of the [TelegramInputMediaDocument](/types/Classes/TelegramInputMediaDocument.md) class |

### `global TelegramInputMediaDocument withoutContentTypeDetection()`

Disables the automatic server-side content type detection

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaDocument` | The current instance of the [TelegramInputMediaDocument](/types/Classes/TelegramInputMediaDocument.md) class |

---
