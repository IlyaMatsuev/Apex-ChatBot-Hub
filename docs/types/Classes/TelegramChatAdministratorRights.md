# TelegramChatAdministratorRights

Describes the default administrator chat permissions payload for a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatadministratorrights

**Inheritance**

TelegramChatAdministratorRights

## Constructors

### `TelegramChatAdministratorRights()`

Creates a new instance of the chat admin rights

---

## Properties

### `canChangeInfo` → `Boolean`

`True` if the user is allowed to change the chat title, photo and other settings

### `canDeleteMessages` → `Boolean`

`True` if the administrator can delete messages of other users

### `canEditMessages` → `Boolean`

`True` if the administrator can edit messages of other users and can pin messages; channels only

### `canInviteUsers` → `Boolean`

`True` if the user is allowed to invite new users to the chat

### `canManageChat` → `Boolean`

`True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode

### `canManageTopics` → `Boolean`

`True` if the user is allowed to create, rename, close, and reopen forum topics; supergroups only

### `canManageVideoChats` → `Boolean`

`True` if the administrator can manage video chats

### `canPinMessages` → `Boolean`

`True` if the user is allowed to pin messages; groups and supergroups only

### `canPostMessages` → `Boolean`

`True` if the administrator can post in the channel; channels only

### `canPromoteMembers` → `Boolean`

`True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly

### `canRestrictMembers` → `Boolean`

`True` if the administrator can restrict, ban or unban chat members

### `isAnonymous` → `Boolean`

`True` if the administrator's presence in the chat should be hidden

---

## Methods

### `asAnonymous(Boolean isAnonymous)`

Determines the administrator's presence in the chat is hidden

#### Parameters

| Param         | Description                                                         |
| ------------- | ------------------------------------------------------------------- |
| `isAnonymous` | `True` if the administrator's presence in the chat should be hidden |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowManageChat(Boolean allow)`

Determines if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode

#### Parameters

| Param   | Description                                                                                                                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowPostMessages(Boolean allow)`

Determines if the administrator can create channel posts, channels only

#### Parameters

| Param   | Description                                                         |
| ------- | ------------------------------------------------------------------- |
| `allow` | `True` if the administrator can create channel posts, channels only |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowEditMessages(Boolean allow)`

Determines if the administrator can edit messages of other users and can pin messages, channels only

#### Parameters

| Param   | Description                                                                                      |
| ------- | ------------------------------------------------------------------------------------------------ |
| `allow` | `True` if the administrator can edit messages of other users and can pin messages, channels only |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowDeleteMessages(Boolean allow)`

Determines if the administrator can delete messages of other users

#### Parameters

| Param   | Description                                                    |
| ------- | -------------------------------------------------------------- |
| `allow` | `True` if the administrator can delete messages of other users |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowManageVideoChats(Boolean allow)`

Determines if the administrator can manage video chats

#### Parameters

| Param   | Description                                        |
| ------- | -------------------------------------------------- |
| `allow` | `True` if the administrator can manage video chats |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowRestrictMembers(Boolean allow)`

Determines if the administrator can restrict, ban or unban chat members

#### Parameters

| Param   | Description                                                         |
| ------- | ------------------------------------------------------------------- |
| `allow` | `True` if the administrator can restrict, ban or unban chat members |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowPromoteMembers(Boolean allow)`

Determines if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly

#### Parameters

| Param   | Description                                                                                                                                                           |
| ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowChangeInfo(Boolean allow)`

Determines if the administrator can change chat title, photo and other settings

#### Parameters

| Param   | Description                                                                 |
| ------- | --------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can change chat title, photo and other settings |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowInviteUsers(Boolean allow)`

Determines if the administrator can invite new users to the chat

#### Parameters

| Param   | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `allow` | `True` if the administrator can invite new users to the chat |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowPinMessages(Boolean allow)`

Determines if the administrator can pin messages, supergroups only

#### Parameters

| Param   | Description                                                    |
| ------- | -------------------------------------------------------------- |
| `allow` | `True` if the administrator can pin messages, supergroups only |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `allowManageTopics(Boolean allow)`

Determines if the user is allowed to create, rename, close, and reopen forum topics, supergroups only

#### Parameters

| Param   | Description                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to create, rename, close, and reopen forum topics, supergroups only |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

---
