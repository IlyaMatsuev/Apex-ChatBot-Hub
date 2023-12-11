# TelegramInlineQueryResultVideo

Describes the video result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultvideo

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultVideo

## Constructors

### `TelegramInlineQueryResultVideo(String id, String videoUrlOrFileId)`

Creates a new instance of the video inline query result with the provided result id and video URL/file id

#### Parameters

| Param              | Description                                        |
| ------------------ | -------------------------------------------------- |
| `id`               | The unique identifier for the result, `1-64 bytes` |
| `videoUrlOrFileId` | The valid video URL or `Telegram` file id          |

---

## Properties

### `captionEntities` → `List<TelegramMessageEntity>`

The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withMimeType(String mimeType)`

Sets the MIME type of the content of the video URL, `text/html` or `video/mp4`

#### Parameters

| Param      | Description                                                               |
| ---------- | ------------------------------------------------------------------------- |
| `mimeType` | The MIME type of the content of the video URL, `text/html` or `video/mp4` |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withThumbnail(String url)`

Sets the video thumbnail

#### Parameters

| Param | Description       |
| ----- | ----------------- |
| `url` | The thumbnail URL |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withSizes(Integer width, Integer height)`

Sets width and height for the video

#### Parameters

| Param    | Description      |
| -------- | ---------------- |
| `width`  | The video width  |
| `height` | The video height |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withDuration(Integer duration)`

Sets the video duration

#### Parameters

| Param      | Description        |
| ---------- | ------------------ |
| `duration` | The video duration |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withDescription(String description)`

Sets the short description for the inline result

#### Parameters

| Param         | Description                   |
| ------------- | ----------------------------- |
| `description` | The description of the result |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withCaption(String caption)`

Sets the caption for the video to be sent

#### Parameters

| Param     | Description                            |
| --------- | -------------------------------------- |
| `caption` | The video caption, `0-1024 characters` |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withTitle(String title)`

Sets the title for the inline result

#### Parameters

| Param   | Description             |
| ------- | ----------------------- |
| `title` | The title of the result |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withParseMode(String mode)`

Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the caption text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the caption text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

### `withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the video

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Return

**Type**

TelegramInlineQueryResultVideo

**Description**

The current instance of the [TelegramInlineQueryResultVideo](/types/Classes/TelegramInlineQueryResultVideo.md) class

---
