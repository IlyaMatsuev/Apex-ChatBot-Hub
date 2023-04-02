# TelegramSendDiceOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendDice` method. The source: https://core.telegram.org/bots/api#senddice

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendDiceOptions

## Properties

### `entities` → `List<MessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withEmoji(String emoji)`

Sets a specific emoji on which the dice throw animation is based

#### Parameters

| Param   | Description                                                                                                                                                                                  |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `emoji` | One of the supported emojies: `🎲`, `🎯` and `🎳` - generate values in range: `1..6` `🏀` and `⚽` - generate values in range `1..5` `🎰` - generate values in range `1..64` Default is `🎲` |

#### Return

**Type**

TelegramSendDiceOptions

**Description**

The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendDiceOptions

**Description**

The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendDiceOptions

**Description**

The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendDiceOptions

**Description**

The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendDiceOptions

**Description**

The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class

---
