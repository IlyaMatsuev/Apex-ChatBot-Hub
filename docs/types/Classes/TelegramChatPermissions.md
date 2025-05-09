# TelegramChatPermissions

Describes the chat permissions payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatpermissions

**Inheritance**

TelegramChatPermissions

## Constructors

### `global TelegramChatPermissions()`

Creates a new instance of chat permissions

---

## Properties

### `global canSendMessages` → `Boolean`

`True` if the user is allowed to send text messages, contacts, invoices, locations and venues

### `global canSendAudios` → `Boolean`

`True` if the user is allowed to send audios

### `global canSendDocuments` → `Boolean`

`True` if the user is allowed to send documents

### `global canSendPhotos` → `Boolean`

`True` if the user is allowed to send photos

### `global canSendVideos` → `Boolean`

`True` if the user is allowed to send videos

### `global canSendVideoNotes` → `Boolean`

`True` if the user is allowed to send video notes

### `global canSendVoiceNotes` → `Boolean`

`True` if the user is allowed to send voice notes

### `global canSendPolls` → `Boolean`

`True` if the user is allowed to send polls

### `global canSendOtherMessages` → `Boolean`

`True` if the user is allowed to send animations, games, stickers and use inline bots

### `global canAddWebPagePreviews` → `Boolean`

`True` if the user is allowed to add web page previews to their messages

### `global canChangeInfo` → `Boolean`

`True` if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups

### `global canInviteUsers` → `Boolean`

`True` if the user is allowed to invite new users to the chat

### `global canPinMessages` → `Boolean`

`True` if the user is allowed to pin messages. Ignored in public supergroups

### `global canManageTopics` → `Boolean`

`True` if the user is allowed to create forum topics. If omitted defaults to the value of can_pin_messages

---

## Methods

### `global TelegramChatPermissions allowSendMessages(Boolean allow)`

Determines if the user is allowed to send text messages, contacts, invoices, locations and venues

#### Parameters

| Param   | Description                                                                                   |
| ------- | --------------------------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to send text messages, contacts, invoices, locations and venues |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendAudios(Boolean allow)`

Determines if the user is allowed to send audios

#### Parameters

| Param   | Description                                  |
| ------- | -------------------------------------------- |
| `allow` | `True` if the user is allowed to send audios |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendDocuments(Boolean allow)`

Determines if the user is allowed to send documents

#### Parameters

| Param   | Description                                     |
| ------- | ----------------------------------------------- |
| `allow` | `True` if the user is allowed to send documents |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendPhotos(Boolean allow)`

Determines if the user is allowed to send photos

#### Parameters

| Param   | Description                                  |
| ------- | -------------------------------------------- |
| `allow` | `True` if the user is allowed to send photos |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendVideos(Boolean allow)`

Determines if the user is allowed to send videos

#### Parameters

| Param   | Description                                  |
| ------- | -------------------------------------------- |
| `allow` | `True` if the user is allowed to send videos |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendVideoNotes(Boolean allow)`

Determines if the user is allowed to send video notes

#### Parameters

| Param   | Description                                       |
| ------- | ------------------------------------------------- |
| `allow` | `True` if the user is allowed to send video notes |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendVoiceNotes(Boolean allow)`

Determines if the user is allowed to send voice notes

#### Parameters

| Param   | Description                                       |
| ------- | ------------------------------------------------- |
| `allow` | `True` if the user is allowed to send voice notes |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendPolls(Boolean allow)`

Determines if the user is allowed to send polls

#### Parameters

| Param   | Description                                 |
| ------- | ------------------------------------------- |
| `allow` | `True` if the user is allowed to send polls |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowSendOtherMessages(Boolean allow)`

Determines if the user is allowed to send other messages

#### Parameters

| Param   | Description                                          |
| ------- | ---------------------------------------------------- |
| `allow` | `True` if the user is allowed to send other messages |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowAddWebPagePreviews(Boolean allow)`

Determines if the user is allowed to add web page previews to their messages

#### Parameters

| Param   | Description                                                              |
| ------- | ------------------------------------------------------------------------ |
| `allow` | `True` if the user is allowed to add web page previews to their messages |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowChangeInfo(Boolean allow)`

Determines if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups

#### Parameters

| Param   | Description                                                                                                     |
| ------- | --------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowInviteUsers(Boolean allow)`

Determines if the user is allowed to invite new users to the chat

#### Parameters

| Param   | Description                                                   |
| ------- | ------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to invite new users to the chat |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowPinMessages(Boolean allow)`

Determines if the user is allowed to pin messages. Ignored in public supergroups

#### Parameters

| Param   | Description                                                                  |
| ------- | ---------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to pin messages. Ignored in public supergroups |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

### `global TelegramChatPermissions allowManageTopics(Boolean allow)`

Determines if the user is allowed to create forum topics

#### Parameters

| Param   | Description                                          |
| ------- | ---------------------------------------------------- |
| `allow` | `True` if the user is allowed to create forum topics |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramChatPermissions` | The current instance of the [TelegramChatPermissions](/types/Classes/TelegramChatPermissions.md) class |

---
