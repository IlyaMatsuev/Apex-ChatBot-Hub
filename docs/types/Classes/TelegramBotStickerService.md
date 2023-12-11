# TelegramBotStickerService

Service class that provides access to all `Telegram` `sticker` methods

## Methods

### `get(List<String> ids)`

Gets information about custom emoji stickers by their identifiers

#### Parameters

| Param | Description                                                     |
| ----- | --------------------------------------------------------------- |
| `ids` | The list of custom emoji identifiers. At most `200` identifiers |

#### Return

**Type**

List&lt;TelegramSticker&gt;

**Description**

The list of [TelegramSticker](/types/Classes/TelegramSticker.md) class instances

### `upload(String userId, String fileUrl, String stickerFormat)`

Uploads a file with a sticker for later use in a sticker set

#### Parameters

| Param           | Description                                                             |
| --------------- | ----------------------------------------------------------------------- |
| `userId`        | The user identifier of sticker owner                                    |
| `fileUrl`       | A file with the sticker in `.WEBP`, `.PNG`, `.TGS`, or `.WEBM` format   |
| `stickerFormat` | The format of the sticker, must be one of `static`, `animated`, `video` |

#### Return

**Type**

TelegramFile

**Description**

The instance of the [TelegramFile](/types/Classes/TelegramFile.md) class

### `setEmojiList(String stickerId, List<String> emojis)`

Changes the list of emojis assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set

#### Parameters

| Param       | Description                                           |
| ----------- | ----------------------------------------------------- |
| `stickerId` | The sticker file identifier                           |
| `emojis`    | The list of `1-20` emojis associated with the sticker |

### `setKeywords(String stickerId, List<String> keywords)`

Changes the list of search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set

#### Parameters

| Param       | Description                                                                                        |
| ----------- | -------------------------------------------------------------------------------------------------- |
| `stickerId` | The sticker file identifier                                                                        |
| `keywords`  | The list of `0-20` keywords associated with the sticker with total length of up to `64 characters` |

### `set(String name)`

Creates an instance of the `Telegram` sticker set service

#### Parameters

| Param  | Description          |
| ------ | -------------------- |
| `name` | The sticker set name |

#### Return

**Type**

TelegramBotStickerSetService

**Description**

The instance of the [TelegramBotStickerSetService](/types/Classes/TelegramBotStickerSetService.md) class

---
