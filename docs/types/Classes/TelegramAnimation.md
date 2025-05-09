# TelegramAnimation

Describes the animation payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#animation

**Inheritance**

TelegramAnimation

## Properties

### `global fileId` → `String`

The identifier for this file, which can be used to download or reuse the file

### `global fileUniqueId` → `String`

The unique identifier for this file, which is supposed to be the same over time and for different bots

### `global width` → `Integer`

The animation width

### `global height` → `Integer`

The animation height

### `global duration` → `Integer`

The duration of the video in seconds as defined by sender

### `global thumbnail` → `TelegramPhotoSize`

The animation thumbnail as defined by sender

### `global fileName` → `String`

The original animation filename as defined by sender

### `global mimeType` → `String`

The MIME type of the file as defined by sender

### `global fileSize` → `Integer`

The file size in bytes

---
