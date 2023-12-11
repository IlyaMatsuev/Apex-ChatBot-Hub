# TelegramInputSticker

Describes the `Telegram` input sticker payload.
Source: https://core.telegram.org/bots/api#inputsticker

**Inheritance**

TelegramInputSticker

## Constructors

### `TelegramInputSticker(String fileIdOrUrl)`

Creates a new input sticker instance with the provided sticker URL or file id

#### Parameters

| Param         | Description                |
| ------------- | -------------------------- |
| `fileIdOrUrl` | The sticker file Id or URL |

---

## Methods

### `withEmojis(List<String> emojis)`

Associates the provided emojis with the sticker

#### Parameters

| Param    | Description                                           |
| -------- | ----------------------------------------------------- |
| `emojis` | The list of `1-20` emojis associated with the sticker |

#### Return

**Type**

TelegramInputSticker

**Description**

The current instance of the [TelegramInputSticker](/types/Classes/TelegramInputSticker.md) class

### `withKeywords(List<String> keywords)`

Associates the provided keywords with the sticker

#### Parameters

| Param      | Description                                             |
| ---------- | ------------------------------------------------------- |
| `keywords` | The list of `0-20` keywords associated with the sticker |

#### Return

**Type**

TelegramInputSticker

**Description**

The current instance of the [TelegramInputSticker](/types/Classes/TelegramInputSticker.md) class

---
