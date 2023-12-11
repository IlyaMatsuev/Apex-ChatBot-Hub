# TelegramBotSenderService

Service class that provides access to all `Telegram` `send` methods

**Implemented types**

[IBotSenderService](/types/Interfaces/IBotSenderService.md)

## Methods

### `text(String text)`

Sends a text message

#### Parameters

| Param  | Description              |
| ------ | ------------------------ |
| `text` | The message text to send |

### `text(String text, TelegramSendTextOptions options)`

Sends a text message with the provided optional parameters

#### Parameters

| Param     | Description                                                                                                         |
| --------- | ------------------------------------------------------------------------------------------------------------------- |
| `text`    | The message text to send                                                                                            |
| `options` | The instance of [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) with other optional parameters |

### `image(String imageUrl)`

Sends an image

#### Parameters

| Param      | Description   |
| ---------- | ------------- |
| `imageUrl` | The image URL |

### `image(String imageUrl, String caption)`

Sends an image with a caption

#### Parameters

| Param      | Description                     |
| ---------- | ------------------------------- |
| `imageUrl` | The image URL                   |
| `caption`  | The text to attach to the image |

### `image(String imageUrl, TelegramSendImageOptions options)`

Sends an image with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `imageUrl` | The image URL                                                                                                         |
| `options`  | The instance of [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) with other optional parameters |

### `video(String videoUrl)`

Sends a video

#### Parameters

| Param      | Description   |
| ---------- | ------------- |
| `videoUrl` | The video URL |

### `video(String videoUrl, String caption)`

Sends a video with a caption

#### Parameters

| Param      | Description                     |
| ---------- | ------------------------------- |
| `videoUrl` | The video URL                   |
| `caption`  | The text to attach to the video |

### `video(String videoUrl, TelegramSendVideoOptions options)`

Sends a video with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `videoUrl` | The video URL                                                                                                         |
| `options`  | The instance of [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) with other optional parameters |

### `videoNote(String videoNoteId)`

Sends a video note

#### Parameters

| Param         | Description                                                               |
| ------------- | ------------------------------------------------------------------------- |
| `videoNoteId` | The video file id that was uploaded to `Telegram`. URLs are not supported |

### `videoNote(String videoNoteId, TelegramSendVideoNoteOptions options)`

Sends a video note with the provided optional parameters

#### Parameters

| Param         | Description                                                                                                                   |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `videoNoteId` | The video file id that was uploaded to `Telegram`. URLs are not supported                                                     |
| `options`     | The instance of [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) with other optional parameters |

### `animation(String animationUrl)`

Sends an animation, e.g. `gif` or a video without sound

#### Parameters

| Param          | Description       |
| -------------- | ----------------- |
| `animationUrl` | The animation URL |

### `animation(String animationUrl, String caption)`

Sends an animation, e.g. `gif` or a video without sound with a caption

#### Parameters

| Param          | Description                         |
| -------------- | ----------------------------------- |
| `animationUrl` | The animation URL                   |
| `caption`      | The text to attach to the animation |

### `animation(String animationUrl, TelegramSendVideoOptions options)`

Sends an animation, e.g. `gif` or a video without sound with the provided optional parameters

#### Parameters

| Param          | Description                                                                                                           |
| -------------- | --------------------------------------------------------------------------------------------------------------------- |
| `animationUrl` | The video URL                                                                                                         |
| `options`      | The instance of [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) with other optional parameters |

### `audio(String audioUrl)`

Sends an audio

#### Parameters

| Param      | Description   |
| ---------- | ------------- |
| `audioUrl` | The audio URL |

### `audio(String audioUrl, String caption)`

Sends an audio with a caption

#### Parameters

| Param      | Description                     |
| ---------- | ------------------------------- |
| `audioUrl` | The audio URL                   |
| `caption`  | The text to attach to the audio |

### `audio(String audioUrl, TelegramSendAudioOptions options)`

Sends an audio with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `audioUrl` | The audio URL                                                                                                         |
| `options`  | The instance of [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) with other optional parameters |

### `voice(String voiceUrl)`

Sends an audio as a voice message

#### Parameters

| Param      | Description                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------------- |
| `voiceUrl` | The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message |

### `voice(String voiceUrl, String caption)`

Sends an audio as a voice message with a caption

#### Parameters

| Param      | Description                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------------- |
| `voiceUrl` | The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message |
| `caption`  | The text to attach to the audio                                                                         |

### `voice(String voiceUrl, TelegramSendAudioOptions options)`

Sends an audio as a voice message with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `voiceUrl` | The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message               |
| `options`  | The instance of [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) with other optional parameters |

### `file(String fileUrl)`

Sends a file

#### Parameters

| Param     | Description                                                      |
| --------- | ---------------------------------------------------------------- |
| `fileUrl` | The file URL. Should include file name with extension in the end |

### `file(String fileUrl, String caption)`

Sends a file with a caption

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `fileUrl` | The file URL                   |
| `caption` | The text to attach to the file |

### `file(String fileUrl, TelegramSendFileOptions options)`

Sends a file with the provided optional parameters

#### Parameters

| Param     | Description                                                                                                         |
| --------- | ------------------------------------------------------------------------------------------------------------------- |
| `fileUrl` | The file URL                                                                                                        |
| `options` | The instance of [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) with other optional parameters |

### `contact(String name, String phone)`

Sends a contact reference

#### Parameters

| Param   | Description                                      |
| ------- | ------------------------------------------------ |
| `name`  | The contact first name or full name (via spaces) |
| `phone` | The contact phone number                         |

### `contact(String name, String phone, TelegramSendContactOptions options)`

Sends a contact reference with the provided optional parameters

#### Parameters

| Param     | Description                                                                                                               |
| --------- | ------------------------------------------------------------------------------------------------------------------------- |
| `name`    | The contact first name or full name (via spaces)                                                                          |
| `phone`   | The contact phone number                                                                                                  |
| `options` | The instance of [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md) with other optional parameters |

### `location(Decimal latitude, Decimal longitude)`

Sends a location

#### Parameters

| Param       | Description            |
| ----------- | ---------------------- |
| `latitude`  | The location latitude  |
| `longitude` | The location longitude |

### `location(Decimal latitude, Decimal longitude, TelegramSendLocationOptions options)`

Sends a location with the provided optional parameters

#### Parameters

| Param       | Description                                                                                                                 |
| ----------- | --------------------------------------------------------------------------------------------------------------------------- |
| `latitude`  | The location latitude                                                                                                       |
| `longitude` | The location longitude                                                                                                      |
| `options`   | The instance of [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) with other optional parameters |

### `venue(String title, String address, Decimal latitude, Decimal longitude)`

Sends a venue

#### Parameters

| Param       | Description         |
| ----------- | ------------------- |
| `title`     | The venue title     |
| `address`   | The venue address   |
| `latitude`  | The venue latitude  |
| `longitude` | The venue longitude |

### `venue(String title, String address, Decimal latitude, Decimal longitude, TelegramSendVenueOptions options)`

Sends a venue with the provided optional parameters

#### Parameters

| Param       | Description                                                                                                           |
| ----------- | --------------------------------------------------------------------------------------------------------------------- |
| `title`     | The venue title                                                                                                       |
| `address`   | The venue address                                                                                                     |
| `latitude`  | The venue latitude                                                                                                    |
| `longitude` | The venue longitude                                                                                                   |
| `options`   | The instance of [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) with other optional parameters |

### `sticker(String stickerIdOrUrl)`

Sends a sticker

#### Parameters

| Param            | Description                                                     |
| ---------------- | --------------------------------------------------------------- |
| `stickerIdOrUrl` | The unique identifier of the sticker or the URL to `.WEBP` file |

### `sticker(String stickerIdOrUrl, TelegramSendStickerOptions options)`

Sends a sticker with the provided optional parameters

#### Parameters

| Param            | Description                                                                                                                 |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `stickerIdOrUrl` | The unique identifier of the sticker or the URL to `.WEBP` file                                                             |
| `options`        | The instance of [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) with other optional parameters |

### `poll(String question, String answers)`

Sends a poll

#### Parameters

| Param      | Description                                                                                                    |
| ---------- | -------------------------------------------------------------------------------------------------------------- |
| `question` | The poll question. Up to `300` characters                                                                      |
| `answers`  | The list of answers to the poll question. Should have at from `2` to `10` answers, up to `100` characters each |

### `poll(String question, TelegramSendPollOptions options)`

Sends a poll

#### Parameters

| Param      | Description                                                                                                         |
| ---------- | ------------------------------------------------------------------------------------------------------------------- |
| `question` | The poll question. Up to `300` characters                                                                           |
| `options`  | The instance of [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) with other optional parameters |

### `dice()`

Sends an animated emoji displaying a random value

### `dice(TelegramSendDiceOptions options)`

Sends an animated emoji displaying a random value with the provided options

#### Parameters

| Param     | Description                                                                                                         |
| --------- | ------------------------------------------------------------------------------------------------------------------- |
| `options` | The instance of [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) with other optional parameters |

### `chatAction(String action)`

Sends the bot's status for 5 seconds or until the next message. E.g. `typing...`

#### Parameters

| Param    | Description                                                                                                                                                                                                                               |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `action` | The action to show to the user. Possible values: `typing`, `upload_photo`, `record_video`, `upload_video`, `record_voice`, `upload_voice`, `upload_document`, `choose_sticker`, `find_location`, `record_video_note`, `upload_video_note` |

### `chatAction(String action, String threadId)`

Sends the bot's status for 5 seconds or until the next message. E.g. `typing...`

#### Parameters

| Param      | Description                                                                                                                                                                                                                               |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `action`   | The action to show to the user. Possible values: `typing`, `upload_photo`, `record_video`, `upload_video`, `record_voice`, `upload_voice`, `upload_document`, `choose_sticker`, `find_location`, `record_video_note`, `upload_video_note` |
| `threadId` | The id of the channel thread (topic) to where the message should be sent                                                                                                                                                                  |

### `forward(String fromChatId, String messageId)`

Forwards a message

#### Parameters

| Param        | Description                                                            |
| ------------ | ---------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent |
| `messageId`  | The message identifier in the chat specified in `fromChatId`           |

### `forward(String fromChatId, String messageId, TelegramForwardOptions options)`

Forwards a message

#### Parameters

| Param        | Description                                                                                                       |
| ------------ | ----------------------------------------------------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent                                            |
| `messageId`  | The message identifier in the chat specified in `fromChatId`                                                      |
| `options`    | The instance of [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) with other optional parameters |

### `copy(String fromChatId, String messageId)`

Sends a copy of the specified message without referencing the original message

#### Parameters

| Param        | Description                                                            |
| ------------ | ---------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent |
| `messageId`  | The message identifier in the chat specified in `fromChatId`           |

### `copy(String fromChatId, String messageId, TelegramCopyOptions options)`

Sends a copy of the specified message without referencing the original message

#### Parameters

| Param        | Description                                                                                                 |
| ------------ | ----------------------------------------------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent                                      |
| `messageId`  | The message identifier in the chat specified in `fromChatId`                                                |
| `options`    | The instance of [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) with other optional parameters |

### `withReplyKeyboard(BotReplyKeyboardButton buttons)`

Sets a simple custom keyboard for the message that the receiver will have instead of the standard input keyboard

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `buttons` | The list of buttons to be shown to the receiver |

#### Return

**Type**

TelegramBotSenderService

**Description**

The current instance of `Telegram` sender service

### `withReplyKeyboard(TelegramReplyKeyboardMarkupOptions keyboard)`

Sets a reply keyboard for the message that the receiver will have instead of the standard input keyboard

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `keyboard` | The instance of [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) class, custom reply keyboard to be shown |

#### Return

**Type**

TelegramBotSenderService

**Description**

The current instance of `Telegram` sender service

### `withReplyKeyboardRemoved()`

Sets a signal that the reply keyboard has to be deleted for the receiver

#### Return

**Type**

TelegramBotSenderService

**Description**

The current instance of `Telegram` sender service

### `withReplyKeyboardRemoved(TelegramReplyKeyboardRemoveOptions removeOptions)`

Sets a signal that the reply keyboard has to be deleted for the receiver

#### Parameters

| Param           | Description                                        |
| --------------- | -------------------------------------------------- |
| `removeOptions` | Additional options for removing the reply keyboard |

#### Return

**Type**

TelegramBotSenderService

**Description**

The current instance of `Telegram` sender service

### `withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets an inline keyboard for the message that will be shown next to the message

#### Parameters

| Param      | Description                                                                                                                                            |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `keyboard` | The instance of [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) class, custom inline keyboard to be shown |

#### Return

**Type**

TelegramBotSenderService

**Description**

The current instance of `Telegram` sender service

### `withForceReply()`

Will force `Telegram` client to display a reply interface to the user to the current bot's message

#### Return

**Type**

TelegramBotSenderService

**Description**

The current instance of `Telegram` sender service

### `withForceReply(TelegramForceReplyOptions forceReplyOptions)`

Will force `Telegram` client to display a reply interface to the user to the current bot's message

#### Parameters

| Param               | Description                                                                                                                  |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `forceReplyOptions` | The instance of [TelegramForceReplyOptions](/types/Classes/TelegramForceReplyOptions.md) class with additional reply options |

#### Return

**Type**

TelegramBotSenderService

**Description**

The current instance of `Telegram` sender service

---
