# TelegramInlineQueryResultDocument

Describes the document result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultdocument

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultDocument

## Constructors

### `global TelegramInlineQueryResultDocument(String id, String documentUrlOrFileId)`

Creates a new instance of the document inline query result with the provided result id and document URL/file id

#### Parameters

| Param                 | Description                                        |
| --------------------- | -------------------------------------------------- |
| `id`                  | The unique identifier for the result, `1-64 bytes` |
| `documentUrlOrFileId` | The valid document URL or `Telegram` file id       |

---

## Properties

### `global captionEntities` → `List<TelegramMessageEntity>`

The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramInlineQueryResultDocument withCaption(String caption)`

Sets the caption for the document to be sent

#### Parameters

| Param     | Description                               |
| --------- | ----------------------------------------- |
| `caption` | The document caption, `0-1024 characters` |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withTitle(String title)`

Sets the title for the inline result

#### Parameters

| Param   | Description             |
| ------- | ----------------------- |
| `title` | The title of the result |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withDescription(String description)`

Sets the short description for the inline result

#### Parameters

| Param         | Description                   |
| ------------- | ----------------------------- |
| `description` | The description of the result |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withMimeType(String mimeType)`

Sets the MIME type of the content of the file, either `application/pdf` or `application/zip`

#### Parameters

| Param      | Description                                                                             |
| ---------- | --------------------------------------------------------------------------------------- |
| `mimeType` | The MIME type of the content of the file, either `application/pdf` or `application/zip` |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withThumbnail(String url, Integer width, Integer height)`

Sets the thumbnail for the inline result

#### Parameters

| Param    | Description          |
| -------- | -------------------- |
| `url`    | The thumbnail URL    |
| `width`  | The thumbnail width  |
| `height` | The thumbnail height |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withParseMode(String mode)`

Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the caption text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the caption text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

### `global TelegramInlineQueryResultDocument withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the document

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Returns

| Type                                | Description                                                                                                                |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultDocument` | The current instance of the [TelegramInlineQueryResultDocument](/types/Classes/TelegramInlineQueryResultDocument.md) class |

---
