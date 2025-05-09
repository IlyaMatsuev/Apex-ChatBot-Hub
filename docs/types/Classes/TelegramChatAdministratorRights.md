# TelegramChatAdministratorRights

Describes the default administrator chat permissions payload for a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatadministratorrights

**Inheritance**

TelegramChatAdministratorRights

## Constructors

### `global TelegramChatAdministratorRights()`

Creates a new instance of the chat admin rights

---

## Properties

### `global isAnonymous` → `Boolean`

`True` if the administrator's presence in the chat should be hidden

### `global canManageChat` → `Boolean`

`True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode

### `global canDeleteMessages` → `Boolean`

`True` if the administrator can delete messages of other users

### `global canManageVideoChats` → `Boolean`

`True` if the administrator can manage video chats

### `global canRestrictMembers` → `Boolean`

`True` if the administrator can restrict, ban or unban chat members

### `global canPromoteMembers` → `Boolean`

`True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly

### `global canChangeInfo` → `Boolean`

`True` if the user is allowed to change the chat title, photo and other settings

### `global canInviteUsers` → `Boolean`

`True` if the user is allowed to invite new users to the chat

### `global canPostMessages` → `Boolean`

`True` if the administrator can post in the channel; channels only

### `global canEditMessages` → `Boolean`

`True` if the administrator can edit messages of other users and can pin messages; channels only

### `global canPinMessages` → `Boolean`

`True` if the user is allowed to pin messages; groups and supergroups only

### `global canManageTopics` → `Boolean`

`True` if the user is allowed to create, rename, close, and reopen forum topics; supergroups only

---

## Methods

### `global TelegramChatAdministratorRights asAnonymous(Boolean isAnonymous)`

Determines the administrator's presence in the chat is hidden

#### Parameters

| Param         | Description                                                         |
| ------------- | ------------------------------------------------------------------- |
| `isAnonymous` | `True` if the administrator's presence in the chat should be hidden |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowManageChat(Boolean allow)`

Determines if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode

#### Parameters

| Param   | Description                                                                                                                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowPostMessages(Boolean allow)`

Determines if the administrator can create channel posts, channels only

#### Parameters

| Param   | Description                                                         |
| ------- | ------------------------------------------------------------------- |
| `allow` | `True` if the administrator can create channel posts, channels only |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowEditMessages(Boolean allow)`

Determines if the administrator can edit messages of other users and can pin messages, channels only

#### Parameters

| Param   | Description                                                                                      |
| ------- | ------------------------------------------------------------------------------------------------ |
| `allow` | `True` if the administrator can edit messages of other users and can pin messages, channels only |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowDeleteMessages(Boolean allow)`

Determines if the administrator can delete messages of other users

#### Parameters

| Param   | Description                                                    |
| ------- | -------------------------------------------------------------- |
| `allow` | `True` if the administrator can delete messages of other users |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowManageVideoChats(Boolean allow)`

Determines if the administrator can manage video chats

#### Parameters

| Param   | Description                                        |
| ------- | -------------------------------------------------- |
| `allow` | `True` if the administrator can manage video chats |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowRestrictMembers(Boolean allow)`

Determines if the administrator can restrict, ban or unban chat members

#### Parameters

| Param   | Description                                                         |
| ------- | ------------------------------------------------------------------- |
| `allow` | `True` if the administrator can restrict, ban or unban chat members |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowPromoteMembers(Boolean allow)`

Determines if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly

#### Parameters

| Param   | Description                                                                                                                                                           |
| ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowChangeInfo(Boolean allow)`

Determines if the administrator can change chat title, photo and other settings

#### Parameters

| Param   | Description                                                                 |
| ------- | --------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can change chat title, photo and other settings |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowInviteUsers(Boolean allow)`

Determines if the administrator can invite new users to the chat

#### Parameters

| Param   | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `allow` | `True` if the administrator can invite new users to the chat |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowPinMessages(Boolean allow)`

Determines if the administrator can pin messages, supergroups only

#### Parameters

| Param   | Description                                                    |
| ------- | -------------------------------------------------------------- |
| `allow` | `True` if the administrator can pin messages, supergroups only |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights allowManageTopics(Boolean allow)`

Determines if the user is allowed to create, rename, close, and reopen forum topics, supergroups only

#### Parameters

| Param   | Description                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to create, rename, close, and reopen forum topics, supergroups only |

#### Returns

| Type                              | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The current instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

---
