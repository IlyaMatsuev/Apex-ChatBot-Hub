# TelegramVideoNote

Describes the video note payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#videonote

**Inheritance**

TelegramVideoNote

## Properties

### `global fileId` → `String`

The identifier for this file, which can be used to download or reuse the file

### `global fileUniqueId` → `String`

The unique identifier for this file, which is supposed to be the same over time and for different bots

### `global length` → `Integer`

The video width and height (diameter of the video message) as defined by sender

### `global duration` → `Integer`

The duration of the video in seconds as defined by sender

### `global thumbnail` → `TelegramPhotoSize`

The video thumbnail

### `global fileSize` → `Integer`

The file size in bytes

---
