# TelegramBotEditorService

Service class that provides access to all `Telegram` `edit` methods

## Methods

### `text(String text)`

Updates the text of the message

#### Parameters

| Param  | Description                                      |
| ------ | ------------------------------------------------ |
| `text` | The new text of the message, `1-4096 characters` |

### `text(String text, TelegramEditTextOptions options)`

Updates the text of the message

#### Parameters

| Param     | Description                                      |
| --------- | ------------------------------------------------ |
| `text`    | The new text of the message, `1-4096 characters` |
| `options` | The additional edit options                      |

### `caption(String caption)`

Updates the caption of the message

#### Parameters

| Param     | Description                                         |
| --------- | --------------------------------------------------- |
| `caption` | The new caption of the message, `1-1024 characters` |

### `caption(String caption, TelegramEditCaptionOptions options)`

Updates the caption of the message

#### Parameters

| Param     | Description                                         |
| --------- | --------------------------------------------------- |
| `caption` | The new caption of the message, `1-1024 characters` |
| `options` | The additional edit options                         |

### `media(TelegramInputMedia media)`

Updates animation, audio, document, photo, or video messages

#### Parameters

| Param   | Description                                      |
| ------- | ------------------------------------------------ |
| `media` | The input for a new media content of the message |

### `liveLocation(Decimal latitude, Decimal longitude)`

Updates the live location messages

#### Parameters

| Param       | Description                |
| ----------- | -------------------------- |
| `latitude`  | The new location latitude  |
| `longitude` | The new location longitude |

### `liveLocation(Decimal latitude, Decimal longitude, TelegramEditLiveLocationOptions options)`

Updates the live location messages

#### Parameters

| Param       | Description                 |
| ----------- | --------------------------- |
| `latitude`  | The new location latitude   |
| `longitude` | The new location longitude  |
| `options`   | The additional edit options |

### `stopLiveLocation()`

Stops updating the live location messages before live period expires

### `inlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Updates the inline keyboard of the message. This will override the keyboard set using `withInlineKeyboard` method

#### Parameters

| Param      | Description                             |
| ---------- | --------------------------------------- |
| `keyboard` | The new inline keyboard for the message |

### `stopPoll()`

Stops the poll that was sent by the bot

### `deleteMessage()`

Deletes the message

### `withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets a new inline keyboard for the edited message

#### Parameters

| Param      | Description                                                                                                                                            |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `keyboard` | The instance of [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) class, custom inline keyboard to be shown |

#### Return

**Type**

TelegramBotEditorService

**Description**

The current instance of the [TelegramBotEditorService](/types/Classes/TelegramBotEditorService.md) class

---
