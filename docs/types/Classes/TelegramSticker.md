# TelegramSticker

Describes the sticker payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#sticker

**Inheritance**

TelegramSticker

## Properties

### `global fileId` → `String`

The identifier for this file, which can be used to download or reuse the file

### `global fileUniqueId` → `String`

The unique identifier for this file, which is supposed to be the same over time and for different bots

### `global type` → `String`

The type of the sticker, one of `regular`, `mask`, `custom_emoji`

### `global width` → `Integer`

The sticker width

### `global height` → `Integer`

The sticker height

### `global isAnimated` → `Boolean`

`True` if the sticker is animated

### `global isVideo` → `Boolean`

`True` if the sticker is a video sticker

### `global thumbnail` → `TelegramPhotoSize`

The sticker thumbnail in the .WEBP or .JPG format

### `global emoji` → `String`

The emoji associated with the sticker

### `global setName` → `String`

The name of the sticker set to which the sticker belongs

### `global premiumAnimation` → `TelegramFile`

For premium regular stickers, premium animation for the sticker

### `global maskPosition` → `TelegramMaskPosition`

For mask stickers, the position where the mask should be placed

### `global customEmojiId` → `String`

For custom emoji stickers, unique identifier of the custom emoji

### `global needsRepainting` → `Boolean`

`True` if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places

### `global fileSize` → `Integer`

The file size in bytes

---
