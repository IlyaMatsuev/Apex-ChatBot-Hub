# TelegramSendDiceOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendDice` method.
Source: https://core.telegram.org/bots/api#senddice

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendDiceOptions

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramSendDiceOptions withEmoji(String emoji)`

Sets a specific emoji on which the dice throw animation is based

#### Parameters

| Param   | Description                                                                                                                                                                                 |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `emoji` | One of the supported emojis: `🎲`, `🎯` and `🎳` - generate values in range: `1..6` `🏀` and `⚽` - generate values in range `1..5` `🎰` - generate values in range `1..64` Default is `🎲` |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendDiceOptions` | The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class |

### `global TelegramSendDiceOptions withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendDiceOptions` | The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class |

### `global TelegramSendDiceOptions withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendDiceOptions` | The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class |

### `global TelegramSendDiceOptions withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendDiceOptions` | The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class |

### `global TelegramSendDiceOptions asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramSendDiceOptions` | The current instance of the [TelegramSendDiceOptions](/types/Classes/TelegramSendDiceOptions.md) class |

---
