# TelegramBotSenderService

Service class that provides access to all `Telegram` `send` methods

**Implemented types**

[IBotSenderService](/types/Interfaces/IBotSenderService.md)

## Methods

### `global void text(String text)`

Sends a text message

#### Parameters

| Param  | Description              |
| ------ | ------------------------ |
| `text` | The message text to send |

### `global void text(String text, TelegramSendTextOptions options)`

Sends a text message with the provided optional parameters

#### Parameters

| Param     | Description                                                                                                         |
| --------- | ------------------------------------------------------------------------------------------------------------------- |
| `text`    | The message text to send                                                                                            |
| `options` | The instance of [TelegramSendTextOptions](/types/Classes/TelegramSendTextOptions.md) with other optional parameters |

### `global void image(String imageUrl)`

Sends an image

#### Parameters

| Param      | Description   |
| ---------- | ------------- |
| `imageUrl` | The image URL |

### `global void image(String imageUrl, String caption)`

Sends an image with a caption

#### Parameters

| Param      | Description                     |
| ---------- | ------------------------------- |
| `imageUrl` | The image URL                   |
| `caption`  | The text to attach to the image |

### `global void image(String imageUrl, TelegramSendImageOptions options)`

Sends an image with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `imageUrl` | The image URL                                                                                                         |
| `options`  | The instance of [TelegramSendImageOptions](/types/Classes/TelegramSendImageOptions.md) with other optional parameters |

### `global void video(String videoUrl)`

Sends a video

#### Parameters

| Param      | Description   |
| ---------- | ------------- |
| `videoUrl` | The video URL |

### `global void video(String videoUrl, String caption)`

Sends a video with a caption

#### Parameters

| Param      | Description                     |
| ---------- | ------------------------------- |
| `videoUrl` | The video URL                   |
| `caption`  | The text to attach to the video |

### `global void video(String videoUrl, TelegramSendVideoOptions options)`

Sends a video with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `videoUrl` | The video URL                                                                                                         |
| `options`  | The instance of [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) with other optional parameters |

### `global void videoNote(String videoNoteId)`

Sends a video note

#### Parameters

| Param         | Description                                                               |
| ------------- | ------------------------------------------------------------------------- |
| `videoNoteId` | The video file id that was uploaded to `Telegram`. URLs are not supported |

### `global void videoNote(String videoNoteId, TelegramSendVideoNoteOptions options)`

Sends a video note with the provided optional parameters

#### Parameters

| Param         | Description                                                                                                                   |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `videoNoteId` | The video file id that was uploaded to `Telegram`. URLs are not supported                                                     |
| `options`     | The instance of [TelegramSendVideoNoteOptions](/types/Classes/TelegramSendVideoNoteOptions.md) with other optional parameters |

### `global void animation(String animationUrl)`

Sends an animation, e.g. `gif` or a video without sound

#### Parameters

| Param          | Description       |
| -------------- | ----------------- |
| `animationUrl` | The animation URL |

### `global void animation(String animationUrl, String caption)`

Sends an animation, e.g. `gif` or a video without sound with a caption

#### Parameters

| Param          | Description                         |
| -------------- | ----------------------------------- |
| `animationUrl` | The animation URL                   |
| `caption`      | The text to attach to the animation |

### `global void animation(String animationUrl, TelegramSendVideoOptions options)`

Sends an animation, e.g. `gif` or a video without sound with the provided optional parameters

#### Parameters

| Param          | Description                                                                                                           |
| -------------- | --------------------------------------------------------------------------------------------------------------------- |
| `animationUrl` | The video URL                                                                                                         |
| `options`      | The instance of [TelegramSendVideoOptions](/types/Classes/TelegramSendVideoOptions.md) with other optional parameters |

### `global void audio(String audioUrl)`

Sends an audio

#### Parameters

| Param      | Description   |
| ---------- | ------------- |
| `audioUrl` | The audio URL |

### `global void audio(String audioUrl, String caption)`

Sends an audio with a caption

#### Parameters

| Param      | Description                     |
| ---------- | ------------------------------- |
| `audioUrl` | The audio URL                   |
| `caption`  | The text to attach to the audio |

### `global void audio(String audioUrl, TelegramSendAudioOptions options)`

Sends an audio with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `audioUrl` | The audio URL                                                                                                         |
| `options`  | The instance of [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) with other optional parameters |

### `global void voice(String voiceUrl)`

Sends an audio as a voice message

#### Parameters

| Param      | Description                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------------- |
| `voiceUrl` | The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message |

### `global void voice(String voiceUrl, String caption)`

Sends an audio as a voice message with a caption

#### Parameters

| Param      | Description                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------------- |
| `voiceUrl` | The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message |
| `caption`  | The text to attach to the audio                                                                         |

### `global void voice(String voiceUrl, TelegramSendAudioOptions options)`

Sends an audio as a voice message with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| `voiceUrl` | The voice URL. Accepts only `.OGG` files encoded with `OPUS`, otherwise will be sent as `audio` message               |
| `options`  | The instance of [TelegramSendAudioOptions](/types/Classes/TelegramSendAudioOptions.md) with other optional parameters |

### `global void file(String fileUrl)`

Sends a file

#### Parameters

| Param     | Description                                                      |
| --------- | ---------------------------------------------------------------- |
| `fileUrl` | The file URL. Should include file name with extension in the end |

### `global void file(String fileUrl, String caption)`

Sends a file with a caption

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `fileUrl` | The file URL                   |
| `caption` | The text to attach to the file |

### `global void file(String fileUrl, TelegramSendFileOptions options)`

Sends a file with the provided optional parameters

#### Parameters

| Param     | Description                                                                                                         |
| --------- | ------------------------------------------------------------------------------------------------------------------- |
| `fileUrl` | The file URL                                                                                                        |
| `options` | The instance of [TelegramSendFileOptions](/types/Classes/TelegramSendFileOptions.md) with other optional parameters |

### `global void contact(String name, String phone)`

Sends a contact reference

#### Parameters

| Param   | Description                                      |
| ------- | ------------------------------------------------ |
| `name`  | The contact first name or full name (via spaces) |
| `phone` | The contact phone number                         |

### `global void contact(String name, String phone, TelegramSendContactOptions options)`

Sends a contact reference with the provided optional parameters

#### Parameters

| Param     | Description                                                                                                               |
| --------- | ------------------------------------------------------------------------------------------------------------------------- |
| `name`    | The contact first name or full name (via spaces)                                                                          |
| `phone`   | The contact phone number                                                                                                  |
| `options` | The instance of [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md) with other optional parameters |

### `global void location(Decimal latitude, Decimal longitude)`

Sends a location

#### Parameters

| Param       | Description            |
| ----------- | ---------------------- |
| `latitude`  | The location latitude  |
| `longitude` | The location longitude |

### `global void location(Decimal latitude, Decimal longitude, TelegramSendLocationOptions options)`

Sends a location with the provided optional parameters

#### Parameters

| Param       | Description                                                                                                                 |
| ----------- | --------------------------------------------------------------------------------------------------------------------------- |
| `latitude`  | The location latitude                                                                                                       |
| `longitude` | The location longitude                                                                                                      |
| `options`   | The instance of [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) with other optional parameters |

### `global void venue(String title, String address, Decimal latitude, Decimal longitude)`

Sends a venue

#### Parameters

| Param       | Description         |
| ----------- | ------------------- |
| `title`     | The venue title     |
| `address`   | The venue address   |
| `latitude`  | The venue latitude  |
| `longitude` | The venue longitude |

### `global void venue(String title, String address, Decimal latitude, Decimal longitude, TelegramSendVenueOptions options)`

Sends a venue with the provided optional parameters

#### Parameters

| Param       | Description                                                                                                           |
| ----------- | --------------------------------------------------------------------------------------------------------------------- |
| `title`     | The venue title                                                                                                       |
| `address`   | The venue address                                                                                                     |
| `latitude`  | The venue latitude                                                                                                    |
| `longitude` | The venue longitude                                                                                                   |
| `options`   | The instance of [TelegramSendVenueOptions](/types/Classes/TelegramSendVenueOptions.md) with other optional parameters |

### `global void sticker(String stickerIdOrUrl)`

Sends a sticker

#### Parameters

| Param            | Description                                                     |
| ---------------- | --------------------------------------------------------------- |
| `stickerIdOrUrl` | The unique identifier of the sticker or the URL to `.WEBP` file |

### `global void sticker(String stickerIdOrUrl, TelegramSendStickerOptions options)`

Sends a sticker with the provided optional parameters

#### Parameters

| Param            | Description                                                                                                                 |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `stickerIdOrUrl` | The unique identifier of the sticker or the URL to `.WEBP` file                                                             |
| `options`        | The instance of [TelegramSendLocationOptions](/types/Classes/TelegramSendLocationOptions.md) with other optional parameters |

### `global void poll(String question, String answers)`

Sends a poll

#### Parameters

| Param      | Description                                                                                                    |
| ---------- | -------------------------------------------------------------------------------------------------------------- |
| `question` | The poll question. Up to `300` characters                                                                      |
| `answers`  | The list of answers to the poll question. Should have at from `2` to `10` answers, up to `100` characters each |

### `global void poll(String question, TelegramSendPollOptions options)`

Sends a poll

#### Parameters

| Param      | Description                                                                                                         |
| ---------- | ------------------------------------------------------------------------------------------------------------------- |
| `question` | The poll question. Up to `300` characters                                                                           |
| `options`  | The instance of [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) with other optional parameters |

### `global void dice()`

Sends an animated emoji displaying a random value

### `global void dice(TelegramSendDiceOptions options)`

Sends an animated emoji displaying a random value with the provided options

#### Parameters

| Param     | Description                                                                                                         |
| --------- | ------------------------------------------------------------------------------------------------------------------- |
| `options` | The instance of [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) with other optional parameters |

### `global void chatAction(String action)`

Sends the bot's status for 5 seconds or until the next message. E.g. `typing...`

#### Parameters

| Param    | Description                                                                                                                                                                                                                               |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `action` | The action to show to the user. Possible values: `typing`, `upload_photo`, `record_video`, `upload_video`, `record_voice`, `upload_voice`, `upload_document`, `choose_sticker`, `find_location`, `record_video_note`, `upload_video_note` |

### `global void chatAction(String action, String threadId)`

Sends the bot's status for 5 seconds or until the next message. E.g. `typing...`

#### Parameters

| Param      | Description                                                                                                                                                                                                                               |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `action`   | The action to show to the user. Possible values: `typing`, `upload_photo`, `record_video`, `upload_video`, `record_voice`, `upload_voice`, `upload_document`, `choose_sticker`, `find_location`, `record_video_note`, `upload_video_note` |
| `threadId` | The id of the channel thread (topic) to where the message should be sent                                                                                                                                                                  |

### `global void forward(String fromChatId, String messageId)`

Forwards a message

#### Parameters

| Param        | Description                                                            |
| ------------ | ---------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent |
| `messageId`  | The message identifier in the chat specified in `fromChatId`           |

### `global void forward(String fromChatId, String messageId, TelegramForwardOptions options)`

Forwards a message

#### Parameters

| Param        | Description                                                                                                       |
| ------------ | ----------------------------------------------------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent                                            |
| `messageId`  | The message identifier in the chat specified in `fromChatId`                                                      |
| `options`    | The instance of [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) with other optional parameters |

### `global void copy(String fromChatId, String messageId)`

Sends a copy of the specified message without referencing the original message

#### Parameters

| Param        | Description                                                            |
| ------------ | ---------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent |
| `messageId`  | The message identifier in the chat specified in `fromChatId`           |

### `global void copy(String fromChatId, String messageId, TelegramCopyOptions options)`

Sends a copy of the specified message without referencing the original message

#### Parameters

| Param        | Description                                                                                                 |
| ------------ | ----------------------------------------------------------------------------------------------------------- |
| `fromChatId` | The unique identifier for the chat where the original message was sent                                      |
| `messageId`  | The message identifier in the chat specified in `fromChatId`                                                |
| `options`    | The instance of [TelegramCopyOptions](/types/Classes/TelegramCopyOptions.md) with other optional parameters |

### `global TelegramBotSenderService withReplyKeyboard(BotReplyKeyboardButton buttons)`

Sets a simple custom keyboard for the message that the receiver will have instead of the standard input keyboard

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `buttons` | The list of buttons to be shown to the receiver |

#### Returns

| Type                       | Description                                       |
| -------------------------- | ------------------------------------------------- |
| `TelegramBotSenderService` | The current instance of `Telegram` sender service |

### `global TelegramBotSenderService withReplyKeyboard(TelegramReplyKeyboardMarkupOptions keyboard)`

Sets a reply keyboard for the message that the receiver will have instead of the standard input keyboard

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `keyboard` | The instance of [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) class, custom reply keyboard to be shown |

#### Returns

| Type                       | Description                                       |
| -------------------------- | ------------------------------------------------- |
| `TelegramBotSenderService` | The current instance of `Telegram` sender service |

### `global TelegramBotSenderService withReplyKeyboardRemoved()`

Sets a signal that the reply keyboard has to be deleted for the receiver

#### Returns

| Type                       | Description                                       |
| -------------------------- | ------------------------------------------------- |
| `TelegramBotSenderService` | The current instance of `Telegram` sender service |

### `global TelegramBotSenderService withReplyKeyboardRemoved(TelegramReplyKeyboardRemoveOptions removeOptions)`

Sets a signal that the reply keyboard has to be deleted for the receiver

#### Parameters

| Param           | Description                                        |
| --------------- | -------------------------------------------------- |
| `removeOptions` | Additional options for removing the reply keyboard |

#### Returns

| Type                       | Description                                       |
| -------------------------- | ------------------------------------------------- |
| `TelegramBotSenderService` | The current instance of `Telegram` sender service |

### `global TelegramBotSenderService withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets an inline keyboard for the message that will be shown next to the message

#### Parameters

| Param      | Description                                                                                                                                            |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `keyboard` | The instance of [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) class, custom inline keyboard to be shown |

#### Returns

| Type                       | Description                                       |
| -------------------------- | ------------------------------------------------- |
| `TelegramBotSenderService` | The current instance of `Telegram` sender service |

### `global TelegramBotSenderService withForceReply()`

Will force `Telegram` client to display a reply interface to the user to the current bot's message

#### Returns

| Type                       | Description                                       |
| -------------------------- | ------------------------------------------------- |
| `TelegramBotSenderService` | The current instance of `Telegram` sender service |

### `global TelegramBotSenderService withForceReply(TelegramForceReplyOptions forceReplyOptions)`

Will force `Telegram` client to display a reply interface to the user to the current bot's message

#### Parameters

| Param               | Description                                                                                                                  |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `forceReplyOptions` | The instance of [TelegramForceReplyOptions](/types/Classes/TelegramForceReplyOptions.md) class with additional reply options |

#### Returns

| Type                       | Description                                       |
| -------------------------- | ------------------------------------------------- |
| `TelegramBotSenderService` | The current instance of `Telegram` sender service |

---
