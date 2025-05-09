# TelegramReplyKeyboardRemoveOptions

Represents parameters wrapper for sending a remove reply keyboard signal to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#replykeyboardremove

**Inheritance**

TelegramReplyKeyboardRemoveOptions

## Constructors

### `global TelegramReplyKeyboardRemoveOptions()`

Creates an instance of the remove reply keyboard options without any additional parameters

---

## Methods

### `global TelegramReplyKeyboardRemoveOptions asSelective()`

Makes the reply keyboard removed for the specific users only

1. Users that are mentioned `@` in the sent message
2. If the current message is a reply, use the target user

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardRemoveOptions` | The current [TelegramReplyKeyboardRemoveOptions](/types/Classes/TelegramReplyKeyboardRemoveOptions.md) instance |

### `global TelegramReplyKeyboardRemoveOptions asSelective(Boolean isSelective)`

Makes the reply keyboard removed for the specific users only

1. Users that are mentioned `@` in the sent message
2. If the current message is a reply, use the target user

#### Parameters

| Param         | Description                                                                                                  |
| ------------- | ------------------------------------------------------------------------------------------------------------ |
| `isSelective` | Determines whether the reply keyboard will be removed for the specific users only or not. Default is `false` |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardRemoveOptions` | The current [TelegramReplyKeyboardRemoveOptions](/types/Classes/TelegramReplyKeyboardRemoveOptions.md) instance |

---
