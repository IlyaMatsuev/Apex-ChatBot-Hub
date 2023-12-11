# TelegramBotStickerSetService

Service class that provides access to all `Telegram` `sticker` methods

## Methods

### `get()`

Gets the information about the sticker set

#### Return

**Type**

TelegramStickerSet

**Description**

The instance of the [TelegramStickerSet](/types/Classes/TelegramStickerSet.md) class

### `create(String userId, String title, List<TelegramInputSticker> stickers, String stickerFormat)`

Creates a new sticker set owned by the user. The bot will be able to edit the sticker set

#### Parameters

| Param           | Description                                                            |
| --------------- | ---------------------------------------------------------------------- |
| `userId`        | The user identifier of the created sticker set owner                   |
| `title`         | The sticker set title, `1-64 characters`                               |
| `stickers`      | The list of `1-50` initial stickers to be added in the set             |
| `stickerFormat` | The format of sticker in the set, one of `static`, `animated`, `video` |

### `create(String userId, String title, List<TelegramInputSticker> stickers, String stickerFormat, TelegramStickerSetCreateOptions options)`

Creates a new sticker set owned by the user with optional parameters. The bot will be able to edit the sticker set

#### Parameters

| Param           | Description                                                            |
| --------------- | ---------------------------------------------------------------------- |
| `userId`        | The user identifier of the created sticker set owner                   |
| `title`         | The sticker set title, `1-64 characters`                               |
| `stickers`      | The list of `1-50` initial stickers to be added in the set             |
| `stickerFormat` | The format of sticker in the set, one of `static`, `animated`, `video` |
| `options`       | Optional parameters for creating a sticker set                         |

### `setTitle(String title)`

Changes the sticker set title

#### Parameters

| Param   | Description                                  |
| ------- | -------------------------------------------- |
| `title` | The new sticker set title, `1-64 characters` |

### `setThumbnail(String userId, String thumbnailUrl)`

Changes the sticker set thumbnail

#### Parameters

| Param          | Description                                  |
| -------------- | -------------------------------------------- |
| `userId`       | The user identifier of the sticker set owner |
| `thumbnailUrl` | The new sticker set thumbnail URL            |

### `addSticker(String userId, TelegramInputSticker sticker)`

Adds a new sticker to the set created by the bot. The format of the sticker must match the format of sticker in the set

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `userId`  | The user identifier of the sticker set owner    |
| `sticker` | The input of the sticker to be added in the set |

### `removeSticker(String stickerId)`

Removes the sticker from the set

#### Parameters

| Param       | Description                        |
| ----------- | ---------------------------------- |
| `stickerId` | The file identifier of the sticker |

### `setStickerPosition(String stickerId, Integer position)`

Moves the sticker in the set to a specific position

#### Parameters

| Param       | Description                                     |
| ----------- | ----------------------------------------------- |
| `stickerId` | The file identifier of the sticker              |
| `position`  | The new sticker position in the set, zero based |

### `deleteSet()`

Deletes the sticker set

---
