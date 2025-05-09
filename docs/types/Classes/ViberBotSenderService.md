# ViberBotSenderService

Service class that provides access to all `Viber` `send` methods

**Implemented types**

[IBotSenderService](/types/Interfaces/IBotSenderService.md)

## Methods

### `global void text(String text)`

Sends a text message

#### Parameters

| Param  | Description              |
| ------ | ------------------------ |
| `text` | The message text to send |

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

### `global void image(String imageUrl, ViberSendImageOptions options)`

Sends an image with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                     |
| ---------- | --------------------------------------------------------------------------------------------------------------- |
| `imageUrl` | The image URL                                                                                                   |
| `options`  | The instance of [ViberSendImageOptions](/types/Classes/ViberSendImageOptions.md) with other optional parameters |

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

### `global void video(String videoUrl, ViberSendVideoOptions options)`

Sends a video with the provided optional parameters

#### Parameters

| Param      | Description                                                                                                     |
| ---------- | --------------------------------------------------------------------------------------------------------------- |
| `videoUrl` | The video URL                                                                                                   |
| `options`  | The instance of [ViberSendVideoOptions](/types/Classes/ViberSendVideoOptions.md) with other optional parameters |

### `global void file(String fileUrl)`

Sends a file

#### Parameters

| Param     | Description                                                      |
| --------- | ---------------------------------------------------------------- |
| `fileUrl` | The file URL. Should include file name with extension in the end |

### `global void file(String fileUrl, String caption)`

Sends a file

#### Parameters

| Param     | Description                                                      |
| --------- | ---------------------------------------------------------------- |
| `fileUrl` | The file URL. Should include file name with extension in the end |
| `caption` | The text to attach to the file                                   |

### `global void file(String fileUrl, ViberSendFileOptions options)`

Sends a file

#### Parameters

| Param     | Description                                                                                                   |
| --------- | ------------------------------------------------------------------------------------------------------------- |
| `fileUrl` | The file URL. Should include file name with extension in the end                                              |
| `options` | The instance of [ViberSendFileOptions](/types/Classes/ViberSendFileOptions.md) with other optional parameters |

### `global void contact(String name, String phone)`

Sends a contact reference

#### Parameters

| Param   | Description                                      |
| ------- | ------------------------------------------------ |
| `name`  | The contact first name or full name (via spaces) |
| `phone` | The contact phone number                         |

### `global void location(Decimal latitude, Decimal longitude)`

Sends a location. Latitude and longitude values are not validated

#### Parameters

| Param       | Description            |
| ----------- | ---------------------- |
| `latitude`  | The location latitude  |
| `longitude` | The location longitude |

### `global void sticker(Integer stickerId)`

Sends a sticker

#### Parameters

| Param       | Description                          |
| ----------- | ------------------------------------ |
| `stickerId` | The unique identifier of the sticker |

### `global void url(String link)`

Sends a URL

#### Parameters

| Param  | Description  |
| ------ | ------------ |
| `link` | The URL link |

### `global void carousel(ViberReplyKeyboardOptions carousel)`

Sends a carousel message with the custom layout

#### Parameters

| Param      | Description                                                                                                                            |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `carousel` | The instance of the [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) class for customizing the carousel layout |

### `global ViberBotSenderService withReplyKeyboard(BotReplyKeyboardButton buttons)`

Sets a simple custom keyboard for the message that the receiver will have instead of the standard input keyboard

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `buttons` | The list of buttons to be shown to the receiver |

#### Returns

| Type                    | Description                                    |
| ----------------------- | ---------------------------------------------- |
| `ViberBotSenderService` | The current instance of `Viber` sender service |

### `global ViberBotSenderService withReplyKeyboard(ViberReplyKeyboardOptions keyboard)`

Sets a custom keyboard with more options for the message that the receiver will have instead of the standard input keyboard

#### Parameters

| Param      | Description                                                                                                                            |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `keyboard` | The instance of the [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) class for customizing the keyboard layout |

#### Returns

| Type                    | Description                                    |
| ----------------------- | ---------------------------------------------- |
| `ViberBotSenderService` | The current instance of `Viber` sender service |

---
