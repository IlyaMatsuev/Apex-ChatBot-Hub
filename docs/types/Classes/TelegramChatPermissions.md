# TelegramChatPermissions

Describes the chat permissions payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatpermissions

**Inheritance**

TelegramChatPermissions

## Constructors

### `TelegramChatPermissions()`

Creates a new instance of chat permissions

---

## Properties

### `canAddWebPagePreviews` → `Boolean`

`True` if the user is allowed to add web page previews to their messages

### `canChangeInfo` → `Boolean`

`True` if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups

### `canInviteUsers` → `Boolean`

`True` if the user is allowed to invite new users to the chat

### `canManageTopics` → `Boolean`

`True` if the user is allowed to create forum topics. If omitted defaults to the value of can_pin_messages

### `canPinMessages` → `Boolean`

`True` if the user is allowed to pin messages. Ignored in public supergroups

### `canSendAudios` → `Boolean`

`True` if the user is allowed to send audios

### `canSendDocuments` → `Boolean`

`True` if the user is allowed to send documents

### `canSendMessages` → `Boolean`

`True` if the user is allowed to send text messages, contacts, invoices, locations and venues

### `canSendOtherMessages` → `Boolean`

`True` if the user is allowed to send animations, games, stickers and use inline bots

### `canSendPhotos` → `Boolean`

`True` if the user is allowed to send photos

### `canSendPolls` → `Boolean`

`True` if the user is allowed to send polls

### `canSendVideoNotes` → `Boolean`

`True` if the user is allowed to send video notes

### `canSendVideos` → `Boolean`

`True` if the user is allowed to send videos

### `canSendVoiceNotes` → `Boolean`

`True` if the user is allowed to send voice notes

---

## Methods

### `allowSendMessages(Boolean allow)`

Determines if the user is allowed to send text messages, contacts, invoices, locations and venues

#### Parameters

| Param   | Description                                                                                   |
| ------- | --------------------------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to send text messages, contacts, invoices, locations and venues |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendAudios(Boolean allow)`

Determines if the user is allowed to send audios

#### Parameters

| Param   | Description                                  |
| ------- | -------------------------------------------- |
| `allow` | `True` if the user is allowed to send audios |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendDocuments(Boolean allow)`

Determines if the user is allowed to send documents

#### Parameters

| Param   | Description                                     |
| ------- | ----------------------------------------------- |
| `allow` | `True` if the user is allowed to send documents |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendPhotos(Boolean allow)`

Determines if the user is allowed to send photos

#### Parameters

| Param   | Description                                  |
| ------- | -------------------------------------------- |
| `allow` | `True` if the user is allowed to send photos |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendVideos(Boolean allow)`

Determines if the user is allowed to send videos

#### Parameters

| Param   | Description                                  |
| ------- | -------------------------------------------- |
| `allow` | `True` if the user is allowed to send videos |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendVideoNotes(Boolean allow)`

Determines if the user is allowed to send video notes

#### Parameters

| Param   | Description                                       |
| ------- | ------------------------------------------------- |
| `allow` | `True` if the user is allowed to send video notes |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendVoiceNotes(Boolean allow)`

Determines if the user is allowed to send voice notes

#### Parameters

| Param   | Description                                       |
| ------- | ------------------------------------------------- |
| `allow` | `True` if the user is allowed to send voice notes |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendPolls(Boolean allow)`

Determines if the user is allowed to send polls

#### Parameters

| Param   | Description                                 |
| ------- | ------------------------------------------- |
| `allow` | `True` if the user is allowed to send polls |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowSendOtherMessages(Boolean allow)`

Determines if the user is allowed to send other messages

#### Parameters

| Param   | Description                                          |
| ------- | ---------------------------------------------------- |
| `allow` | `True` if the user is allowed to send other messages |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowAddWebPagePreviews(Boolean allow)`

Determines if the user is allowed to add web page previews to their messages

#### Parameters

| Param   | Description                                                              |
| ------- | ------------------------------------------------------------------------ |
| `allow` | `True` if the user is allowed to add web page previews to their messages |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowChangeInfo(Boolean allow)`

Determines if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups

#### Parameters

| Param   | Description                                                                                                     |
| ------- | --------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowInviteUsers(Boolean allow)`

Determines if the user is allowed to invite new users to the chat

#### Parameters

| Param   | Description                                                   |
| ------- | ------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to invite new users to the chat |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowPinMessages(Boolean allow)`

Determines if the user is allowed to pin messages. Ignored in public supergroups

#### Parameters

| Param   | Description                                                                  |
| ------- | ---------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to pin messages. Ignored in public supergroups |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

### `allowManageTopics(Boolean allow)`

Determines if the user is allowed to create forum topics

#### Parameters

| Param   | Description                                          |
| ------- | ---------------------------------------------------- |
| `allow` | `True` if the user is allowed to create forum topics |

#### Return

**Type**

TelegramChatPermissions

**Description**

The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class

---
