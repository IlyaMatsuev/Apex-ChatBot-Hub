# TelegramForwardOptions

Represents the optional parameters for the `Telegram` `forward` method.
Source: https://core.telegram.org/bots/api#forwardmessage

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramForwardOptions

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramForwardOptions withThreadId(String threadId)`

Sets the unique identifier for the target message thread (topic) of the forum; for forum supergroups only

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Returns

| Type                     | Description                                                                                          |
| ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `TelegramForwardOptions` | The current instance of the [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) class |

### `global TelegramForwardOptions withoutNotification()`

Forwards the message silently. The receiver will get a notification with no sound

#### Returns

| Type                     | Description                                                                                          |
| ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `TelegramForwardOptions` | The current instance of the [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) class |

### `global TelegramForwardOptions withProtectedContent()`

Protects the contents of the forwarded message from forwarding and saving

#### Returns

| Type                     | Description                                                                                          |
| ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `TelegramForwardOptions` | The current instance of the [TelegramForwardOptions](/types/Classes/TelegramForwardOptions.md) class |

---
