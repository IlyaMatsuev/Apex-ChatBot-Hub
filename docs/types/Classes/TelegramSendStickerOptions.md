# TelegramSendStickerOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendSticker` method. The source: https://core.telegram.org/bots/api#sendsticker

**Inheritance**

TelegramSendStickerOptions

## Methods

### `withThreadId(String threadId)`

Sets the forum channel thread id where the sticker has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendStickerOptions

**Description**

The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class

### `asEmoji(String emoji)`

Sets the emoji associated with the sticker. Works for just uploaded stickers only

#### Parameters

| Param   | Description                           |
| ------- | ------------------------------------- |
| `emoji` | The emoji associated with the sticker |

#### Return

**Type**

TelegramSendStickerOptions

**Description**

The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class

### `withoutNotification()`

Sends the sticker silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendStickerOptions

**Description**

The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent sticker from forwarding and saving

#### Return

**Type**

TelegramSendStickerOptions

**Description**

The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the sticker as a reply to another message. If the target message was not found, will just send a sticker

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendStickerOptions

**Description**

The current instance of the [TelegramSendStickerOptions](/types/Classes/TelegramSendStickerOptions.md) class

---
