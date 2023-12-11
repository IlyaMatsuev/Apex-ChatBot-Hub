# TelegramAudio

Describes the audio payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#audio

**Inheritance**

TelegramAudio

## Properties

### `duration` → `Integer`

The duration of the audio in seconds as defined by sender or by audio tags

### `fileId` → `String`

The identifier for this file, which can be used to download or reuse the file

### `fileName` → `String`

The filename as defined by sender

### `fileSize` → `Integer`

The file size in bytes

### `fileUniqueId` → `String`

The unique identifier for this file, which is supposed to be the same over time and for different bots

### `mimeType` → `String`

The MIME type of the file as defined by sender

### `performer` → `String`

The performer of the audio as defined by sender or by audio tags

### `thumbnail` → `TelegramPhotoSize`

The thumbnail of the album cover to which the music file belongs

### `title` → `String`

The title of the audio as defined by sender or by audio tags

---
