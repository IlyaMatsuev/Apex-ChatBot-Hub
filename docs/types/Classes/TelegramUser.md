# TelegramUser

Describes the sender payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#user

**Inheritance**

TelegramUser

**Implemented types**

[IBotUser](/types/Classes/IBotUser.md)

## Properties

### `global id` → `Long`

The unique identifier for this user or bot

### `global isBot` → `Boolean`

`True` if this user is a bot

### `global firstName` → `String`

The user's or bot's first name

### `global lastName` → `String`

The user's or bot's last name

### `global languageCode` → `String`

The IETF language tag of the user's language

### `global username` → `String`

The user's or bot's username

### `global isPremium` → `Boolean`

`True` if this user is a Telegram Premium user

### `global isAddedToAttachmentMenu` → `Boolean`

`True` if this user added the bot to the attachment menu

### `global canJoinGroups` → `Boolean`

`True` if the bot can be invited to groups. Returned only in `getMe`

### `global canReadAllGroupMessages` → `Boolean`

`True` if privacy mode is disabled for the bot. Returned only in `getMe`

### `global supportsInlineQueries` → `Boolean`

`True` if the bot supports inline queries. Returned only in `getMe`

---

## Methods

### `global String getId()`

Returns the `Telegram` user id as `String`

#### Returns

| Type     | Description            |
| -------- | ---------------------- |
| `String` | The `Telegram` user id |

### `global String getFirstName()`

Returns the `Telegram` user first name

#### Returns

| Type     | Description                    |
| -------- | ------------------------------ |
| `String` | The `Telegram` user first name |

### `global String getLastName()`

Returns the `Telegram` user last name

#### Returns

| Type     | Description                   |
| -------- | ----------------------------- |
| `String` | The `Telegram` user last name |

### `global String getUsername()`

Returns the `Telegram` user username

#### Returns

| Type     | Description                  |
| -------- | ---------------------------- |
| `String` | The `Telegram` user username |

---
