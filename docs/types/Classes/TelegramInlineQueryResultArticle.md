# TelegramInlineQueryResultArticle

Describes the article result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultarticle

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultArticle

## Constructors

### `TelegramInlineQueryResultArticle(String id)`

Creates a new instance of the article inline query result with the provided result id

#### Parameters

| Param | Description                                        |
| ----- | -------------------------------------------------- |
| `id`  | The unique identifier for the result, `1-64 bytes` |

---

## Methods

### `withTitle(String title)`

Sets the title for the inline result

#### Parameters

| Param   | Description             |
| ------- | ----------------------- |
| `title` | The title of the result |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

### `withUrl(String url)`

Sets the URL for the inline result

#### Parameters

| Param | Description           |
| ----- | --------------------- |
| `url` | The URL of the result |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

### `withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

### `withUrl(String url, Boolean hidden)`

Sets the URL for the inline result

#### Parameters

| Param    | Description                                                 |
| -------- | ----------------------------------------------------------- |
| `url`    | The URL of the result                                       |
| `hidden` | `True` if you don't want the URL to be shown in the message |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

### `withDescription(String description)`

Sets the short description for the inline result

#### Parameters

| Param         | Description                   |
| ------------- | ----------------------------- |
| `description` | The description of the result |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

### `withThumbnail(String url)`

Sets the thumbnail for the inline result

#### Parameters

| Param | Description       |
| ----- | ----------------- |
| `url` | The thumbnail URL |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

### `withThumbnail(String url, Integer width, Integer height)`

Sets the thumbnail for the inline result

#### Parameters

| Param    | Description          |
| -------- | -------------------- |
| `url`    | The thumbnail URL    |
| `width`  | The thumbnail width  |
| `height` | The thumbnail height |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

### `withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Return

**Type**

TelegramInlineQueryResultArticle

**Description**

The current instance of the [TelegramInlineQueryResultArticle](/types/Classes/TelegramInlineQueryResultArticle.md) class

---
