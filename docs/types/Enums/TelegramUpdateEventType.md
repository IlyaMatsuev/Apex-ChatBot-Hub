# TelegramUpdateEventType

Custom enum class that contains all available event types for `Telegram` bots.
Source: https://core.telegram.org/bots/api#update.

**Inheritance**

[BotEnumType](/types/Enums/BotEnumType.md)
&gt;
[BotUpdateEventType](/types/Enums/BotUpdateEventType.md)
&gt;
TelegramUpdateEventType

**Group** Enums

## Fields

### `global Message` → `TelegramUpdateEventType`

The `Telegram` message event. Received when a user sends a message to the chat with the bot

### `global EditedMessage` → `TelegramUpdateEventType`

The `Telegram` edited message event. Received when a user edits their message in the chat with the bot

### `global ChannelPost` → `TelegramUpdateEventType`

The `Telegram` channel post event. Received when a user makes a post in a channel with the bot

### `global EditedChannelPost` → `TelegramUpdateEventType`

The `Telegram` edited message event. Received when a user edits a post in a channel with the bot

### `global InlineQuery` → `TelegramUpdateEventType`

The `Telegram` inline query event. Received when a user mentions the bot in any chat via an inline query

### `global ChosenInlineResult` → `TelegramUpdateEventType`

The `Telegram` chosen inline query result event. Received when a user chooses one of the inline query results

### `global CallbackQuery` → `TelegramUpdateEventType`

The `Telegram` callback query event. Received when a user clicks a callback button on an inline keyboard

### `global Poll` → `TelegramUpdateEventType`

The `Telegram` poll event. Received on any poll state update. Bots receive only updates about stopped polls and polls sent by the bot

### `global PollAnswer` → `TelegramUpdateEventType`

The `Telegram` poll answer event. Received when a user changes their answer in a non-anonymous poll. Bots receive new votes only in polls sent by the bot itself

### `global MyChatMember` → `TelegramUpdateEventType`

The `Telegram` my chat member event. Received when the bot's chat member status changes. For private chats, this update is received only when the bot is blocked or unblocked by the user

### `global ChatMember` → `TelegramUpdateEventType`

The `Telegram` chat member event. Received when a user's chat member status changes. The bot must be an administrator in the chat to receive these updates

### `global ChatJoinRequest` → `TelegramUpdateEventType`

The `Telegram` chat join request event. Received when requested to join a chat. The bot must have the `can_invite_users` administrator right in the chat to receive these updates

---

## Methods

### `global String name()`

_Inherited_

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Returns

| Type     | Description                                    |
| -------- | ---------------------------------------------- |
| `String` | The string value the enum was initialized with |

### `global override String toString()`

_Inherited_

Returns the string representation of the enum. Works the same way as the native Apex enums

#### Returns

| Type     | Description                                    |
| -------- | ---------------------------------------------- |
| `String` | The String value the enum was initialized with |

### `global virtual Boolean equals(Object other)`

_Inherited_

Checks if the passed object equals to the enum value

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `other` | Any object this enum instance is compared with |

#### Returns

| Type      | Description                                                                                 |
| --------- | ------------------------------------------------------------------------------------------- |
| `Boolean` | `true` if the passed object equals to the current instance by a reference or a String value |

### `global Integer hashCode()`

_Inherited_

Generates a hashcode based on the string value this enum is initialized with

#### Returns

| Type      | Description                                                    |
| --------- | -------------------------------------------------------------- |
| `Integer` | The enum's string value hashcode or `0` if the value is `null` |

---
