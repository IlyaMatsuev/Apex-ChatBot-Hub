# IBotSenderService

The interface with all common methods for sending messages to the bot users

**Group** Interfaces

## Methods

### `text(String text)`

Sends a text message

#### Parameters

| Param  | Description              |
| ------ | ------------------------ |
| `text` | The message text to send |

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

### `file(String fileUrl)`

Sends a file

#### Parameters

| Param     | Description                                                      |
| --------- | ---------------------------------------------------------------- |
| `fileUrl` | The file URL. Should include file name with extension in the end |

### `file(String fileUrl, String caption)`

Sends a file

#### Parameters

| Param     | Description                                                      |
| --------- | ---------------------------------------------------------------- |
| `fileUrl` | The file URL. Should include file name with extension in the end |
| `caption` | The text to attach to the file                                   |

### `contact(String name, String phone)`

Sends a contact reference

#### Parameters

| Param   | Description                                      |
| ------- | ------------------------------------------------ |
| `name`  | The contact first name or full name (via spaces) |
| `phone` | The contact phone number                         |

### `location(Decimal latitude, Decimal longitude)`

Sends a location. Latitude and longitude values are not validated

#### Parameters

| Param       | Description            |
| ----------- | ---------------------- |
| `latitude`  | The location latitude  |
| `longitude` | The location longitude |

### `withReplyKeyboard(BotReplyKeyboardButton buttons)`

Sets a custom keyboard for the message that the receiver will have instead of the standard input keyboard

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `buttons` | The list of buttons to be shown to the receiver |

#### Return

**Type**

IBotSenderService

**Description**

The current [IBotSenderService](/types/Interfaces/IBotSenderService.md) instance

---
