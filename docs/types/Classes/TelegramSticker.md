# TelegramSticker

Describes the sticker payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#sticker

**Inheritance**

TelegramSticker

## Properties

### `customEmojiId` → `String`

For custom emoji stickers, unique identifier of the custom emoji

### `emoji` → `String`

The emoji associated with the sticker

### `fileId` → `String`

The identifier for this file, which can be used to download or reuse the file

### `fileSize` → `Integer`

The file size in bytes

### `fileUniqueId` → `String`

The unique identifier for this file, which is supposed to be the same over time and for different bots

### `height` → `Integer`

The sticker height

### `isAnimated` → `Boolean`

`True` if the sticker is animated

### `isVideo` → `Boolean`

`True` if the sticker is a video sticker

### `maskPosition` → `TelegramMaskPosition`

For mask stickers, the position where the mask should be placed

### `needsRepainting` → `Boolean`

`True` if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places

### `premiumAnimation` → `TelegramFile`

For premium regular stickers, premium animation for the sticker

### `setName` → `String`

The name of the sticker set to which the sticker belongs

### `thumbnail` → `TelegramPhotoSize`

The sticker thumbnail in the .WEBP or .JPG format

### `type` → `String`

The type of the sticker, one of `regular`, `mask`, `custom_emoji`

### `width` → `Integer`

The sticker width

---
