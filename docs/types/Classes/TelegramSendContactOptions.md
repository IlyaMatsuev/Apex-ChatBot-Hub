# TelegramSendContactOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendContact` method.
Source: https://core.telegram.org/bots/api#sendcontact

**Inheritance**

TelegramSendContactOptions

## Methods

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendContactOptions

**Description**

The current instance of the [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md) class

### `withVCard(String vcard)`

Sets the additional data for the contact message of a vCard format

#### Parameters

| Param   | Description               |
| ------- | ------------------------- |
| `vcard` | The `vCard` format string |

#### Return

**Type**

TelegramSendContactOptions

**Description**

The current instance of the [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendContactOptions

**Description**

The current instance of the [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendContactOptions

**Description**

The current instance of the [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendContactOptions

**Description**

The current instance of the [TelegramSendContactOptions](/types/Classes/TelegramSendContactOptions.md) class

---
