# TelegramVideoNote

Describes the video note payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#videonote

**Inheritance**

TelegramVideoNote

## Properties

### `duration` → `Integer`

The duration of the video in seconds as defined by sender

### `fileId` → `String`

The identifier for this file, which can be used to download or reuse the file

### `fileSize` → `Integer`

The file size in bytes

### `fileUniqueId` → `String`

The unique identifier for this file, which is supposed to be the same over time and for different bots

### `length` → `Integer`

The video width and height (diameter of the video message) as defined by sender

### `thumbnail` → `TelegramPhotoSize`

The video thumbnail

---
