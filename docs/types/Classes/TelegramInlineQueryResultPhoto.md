# TelegramInlineQueryResultPhoto

Describes the photo result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultphoto

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultPhoto

## Constructors

### `global TelegramInlineQueryResultPhoto(String id, String photoUrlOrFileId)`

Creates a new instance of the photo inline query result with the provided result id and photo URL/file id

#### Parameters

| Param              | Description                                        |
| ------------------ | -------------------------------------------------- |
| `id`               | The unique identifier for the result, `1-64 bytes` |
| `photoUrlOrFileId` | The valid photo URL or `Telegram` file id          |

---

## Properties

### `global captionEntities` → `List<TelegramMessageEntity>`

The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramInlineQueryResultPhoto withThumbnail(String url)`

Sets the photo thumbnail

#### Parameters

| Param | Description       |
| ----- | ----------------- |
| `url` | The thumbnail URL |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withSizes(Integer width, Integer height)`

Sets width and height for the photo

#### Parameters

| Param    | Description      |
| -------- | ---------------- |
| `width`  | The photo width  |
| `height` | The photo height |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withDescription(String description)`

Sets the short description for the inline result

#### Parameters

| Param         | Description                   |
| ------------- | ----------------------------- |
| `description` | The description of the result |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withCaption(String caption)`

Sets the caption for the photo to be sent

#### Parameters

| Param     | Description                            |
| --------- | -------------------------------------- |
| `caption` | The photo caption, `0-1024 characters` |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withTitle(String title)`

Sets the title for the inline result

#### Parameters

| Param   | Description             |
| ------- | ----------------------- |
| `title` | The title of the result |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withParseMode(String mode)`

Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the caption text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the caption text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

### `global TelegramInlineQueryResultPhoto withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the photo

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultPhoto` | The current instance of the [TelegramInlineQueryResultPhoto](/types/Classes/TelegramInlineQueryResultPhoto.md) class |

---
