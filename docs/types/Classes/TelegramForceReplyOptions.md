# TelegramForceReplyOptions

Represents parameters wrapper for sending a force reply to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#forcereply

**Inheritance**

TelegramForceReplyOptions

## Constructors

### `global TelegramForceReplyOptions()`

Creates an instance of the force reply options without any additional parameters

---

## Methods

### `global TelegramForceReplyOptions setInputPlaceholder(String placeholder)`

Sets the placeholder to be shown in the input field when the force reply applied

#### Parameters

| Param         | Description          |
| ------------- | -------------------- |
| `placeholder` | The placeholder text |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `TelegramForceReplyOptions` | The current [TelegramForceReplyOptions](/types/Classes/TelegramForceReplyOptions.md) instance |

### `global TelegramForceReplyOptions asSelective()`

Makes the force reply available for the specific users only

1. Users that are mentioned `@` in the sent message
2. If the current message is a reply, use the target user

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `TelegramForceReplyOptions` | The current [TelegramForceReplyOptions](/types/Classes/TelegramForceReplyOptions.md) instance |

### `global TelegramForceReplyOptions asSelective(Boolean isSelective)`

Makes the force reply available for the specific users only

1. Users that are mentioned `@` in the sent message
2. If the current message is a reply, use the target user

#### Parameters

| Param         | Description                                                                                                 |
| ------------- | ----------------------------------------------------------------------------------------------------------- |
| `isSelective` | Determines whether the force reply will be available for the specific users only or not. Default is `false` |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `TelegramForceReplyOptions` | The current [TelegramForceReplyOptions](/types/Classes/TelegramForceReplyOptions.md) instance |

---
