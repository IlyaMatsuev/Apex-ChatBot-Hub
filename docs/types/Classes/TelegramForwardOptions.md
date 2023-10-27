# TelegramForwardOptions

Represents the optional parameters for the `Telegram` `forward` method.
Source: https://core.telegram.org/bots/api#forwardmessage

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramForwardOptions

## Properties

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withThreadId(String threadId)`

Sets the unique identifier for the target message thread (topic) of the forum; for forum supergroups only

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramForwardOptions

**Description**

The current instance of the [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) class

### `withoutNotification()`

Forwards the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramForwardOptions

**Description**

The current instance of the [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) class

### `withProtectedContent()`

Protects the contents of the forwarded message from forwarding and saving

#### Return

**Type**

TelegramForwardOptions

**Description**

The current instance of the [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) class

---
