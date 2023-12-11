# TelegramInlineQueryResultGif

Describes the gif result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultgif, https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultGif

## Constructors

### `TelegramInlineQueryResultGif(String id, String gifUrlOrFileId)`

Creates a new instance of the gif inline query result with the provided result id and gif URL/file id

#### Parameters

| Param            | Description                                        |
| ---------------- | -------------------------------------------------- |
| `id`             | The unique identifier for the result, `1-64 bytes` |
| `gifUrlOrFileId` | The valid gif URL or `Telegram` file id            |

### `TelegramInlineQueryResultGif(String id, String gifUrlOrFileId, Boolean isMpeg4Gif)`

Creates a new instance of the gif inline query result with the provided result id and gif URL/file id

#### Parameters

| Param            | Description                                        |
| ---------------- | -------------------------------------------------- |
| `id`             | The unique identifier for the result, `1-64 bytes` |
| `gifUrlOrFileId` | The valid gif URL or `Telegram` file id            |
| `isMpeg4Gif`     | Defines if the gif is of MPEG4 format              |

---

## Properties

### `captionEntities` → `List<TelegramMessageEntity>`

The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withThumbnail(String url, String mimeType)`

Sets the gif thumbnail

#### Parameters

| Param      | Description                                                                                                        |
| ---------- | ------------------------------------------------------------------------------------------------------------------ |
| `url`      | The thumbnail URL                                                                                                  |
| `mimeType` | The MIME type of the thumbnail, must be one of `image/jpeg`, `image/gif`, or `video/mp4`. Defaults to `image/jpeg` |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withSizes(Integer width, Integer height)`

Sets width and height for the gif

#### Parameters

| Param    | Description    |
| -------- | -------------- |
| `width`  | The gif width  |
| `height` | The gif height |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withDuration(Integer duration)`

Sets the gif duration

#### Parameters

| Param      | Description      |
| ---------- | ---------------- |
| `duration` | The gif duration |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withCaption(String caption)`

Sets the caption for the gif to be sent

#### Parameters

| Param     | Description                          |
| --------- | ------------------------------------ |
| `caption` | The gif caption, `0-1024 characters` |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withTitle(String title)`

Sets the title for the inline result

#### Parameters

| Param   | Description             |
| ------- | ----------------------- |
| `title` | The title of the result |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withParseMode(String mode)`

Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the caption text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the caption text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

### `withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the gif

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Return

**Type**

TelegramInlineQueryResultGif

**Description**

The current instance of the [TelegramInlineQueryResultGif](/types/Classes/TelegramInlineQueryResultGif.md) class

---
