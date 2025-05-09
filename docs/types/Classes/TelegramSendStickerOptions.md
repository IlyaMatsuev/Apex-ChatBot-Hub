# TelegramSendStickerOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendSticker` method.
Source: https://core.telegram.org/bots/api#sendsticker

**Inheritance**

TelegramSendStickerOptions

## Methods

### `global TelegramSendStickerOptions withThreadId(String threadId)`

Sets the forum channel thread id where the sticker has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramSendStickerOptions` | The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class |

### `global TelegramSendStickerOptions asEmoji(String emoji)`

Sets the emoji associated with the sticker. Works for just uploaded stickers only

#### Parameters

| Param   | Description                           |
| ------- | ------------------------------------- |
| `emoji` | The emoji associated with the sticker |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramSendStickerOptions` | The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class |

### `global TelegramSendStickerOptions withoutNotification()`

Sends the sticker silently. The receiver will get a notification with no sound

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramSendStickerOptions` | The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class |

### `global TelegramSendStickerOptions withProtectedContent()`

Protects the contents of the sent sticker from forwarding and saving

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramSendStickerOptions` | The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class |

### `global TelegramSendStickerOptions asReplyToMessage(String messageId)`

Sends the sticker as a reply to another message. If the target message was not found, will just send a sticker

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramSendStickerOptions` | The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class |

---
