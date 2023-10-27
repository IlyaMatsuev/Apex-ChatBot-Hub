# TelegramInputMediaPhoto

Describes the input photo media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediaphoto

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
[TelegramInputMedia](/types/Classes/TelegramInputMedia.md)
&gt;
TelegramInputMediaPhoto

## Constructors

### `TelegramInputMediaPhoto(String media)`

Creates a new instance of input photo media with the provided URL or file id

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `media` | The `Telegram` file id or the URL to the photo |

---

## Properties

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withCaption(String caption)`

Sets the caption for the image

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the image |

#### Return

**Type**

TelegramInputMediaPhoto

**Description**

The current instance of the [TelegramInputMediaPhoto](/types/Classes/TelegramInputMediaPhoto.md) class

### `withParseMode(String mode)`

Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramInputMediaPhoto

**Description**

The current instance of the [TelegramInputMediaPhoto](/types/Classes/TelegramInputMediaPhoto.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInputMediaPhoto

**Description**

The current instance of the [TelegramInputMediaPhoto](/types/Classes/TelegramInputMediaPhoto.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInputMediaPhoto

**Description**

The current instance of the [TelegramInputMediaPhoto](/types/Classes/TelegramInputMediaPhoto.md) class

### `withSpoiler()`

Marks the media that it has a spoiler

#### Return

**Type**

TelegramInputMediaPhoto

**Description**

The current instance of the [TelegramInputMediaPhoto](/types/Classes/TelegramInputMediaPhoto.md) class

---
