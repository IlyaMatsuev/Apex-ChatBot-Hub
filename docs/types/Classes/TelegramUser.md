# TelegramUser

Describes the sender payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#user

**Inheritance**

TelegramUser

**Implemented types**

[IBotUser](/types/Classes/IBotUser.md)

## Properties

### `canJoinGroups` → `Boolean`

`True` if the bot can be invited to groups. Returned only in `getMe`

### `canReadAllGroupMessages` → `Boolean`

`True` if privacy mode is disabled for the bot. Returned only in `getMe`

### `firstName` → `String`

The user's or bot's first name

### `id` → `Long`

The unique identifier for this user or bot

### `isAddedToAttachmentMenu` → `Boolean`

`True` if this user added the bot to the attachment menu

### `isBot` → `Boolean`

`True` if this user is a bot

### `isPremium` → `Boolean`

`True` if this user is a Telegram Premium user

### `languageCode` → `String`

The IETF language tag of the user's language

### `lastName` → `String`

The user's or bot's last name

### `supportsInlineQueries` → `Boolean`

`True` if the bot supports inline queries. Returned only in `getMe`

### `username` → `String`

The user's or bot's username

---

## Methods

### `getId()`

Returns the `Telegram` user id as `String`

#### Return

**Type**

String

**Description**

The `Telegram` user id

### `getFirstName()`

Returns the `Telegram` user first name

#### Return

**Type**

String

**Description**

The `Telegram` user first name

### `getLastName()`

Returns the `Telegram` user last name

#### Return

**Type**

String

**Description**

The `Telegram` user last name

### `getUsername()`

Returns the `Telegram` user username

#### Return

**Type**

String

**Description**

The `Telegram` user username

---
