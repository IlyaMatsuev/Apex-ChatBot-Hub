# TelegramInlineQueryResultSticker

Describes the article result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultarticle

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultSticker

## Constructors

### `global TelegramInlineQueryResultSticker(String id, String stickerId)`

Creates a new instance of the sticker inline query result with the provided result and sticker ids

#### Parameters

| Param       | Description                                        |
| ----------- | -------------------------------------------------- |
| `id`        | The unique identifier for the result, `1-64 bytes` |
| `stickerId` | The valid file identifier of the sticker           |

---

## Methods

### `global TelegramInlineQueryResultSticker withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInlineQueryResultSticker` | The current instance of the [TelegramInlineQueryResultSticker](/types/Classes/TelegramInlineQueryResultSticker.md) class |

### `global TelegramInlineQueryResultSticker withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the sticker

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInlineQueryResultSticker` | The current instance of the [TelegramInlineQueryResultSticker](/types/Classes/TelegramInlineQueryResultSticker.md) class |

---
