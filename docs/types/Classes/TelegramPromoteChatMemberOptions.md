# TelegramPromoteChatMemberOptions

The builder-like class that describes optional parameters for promoting a `Telegram` chat member.
Source: https://core.telegram.org/bots/api#promotechatmember

**Inheritance**

TelegramPromoteChatMemberOptions

## Methods

### `global TelegramPromoteChatMemberOptions asAnonymous(Boolean isAnonymous)`

Determines the administrator's presence in the chat is hidden

#### Parameters

| Param         | Description                                                         |
| ------------- | ------------------------------------------------------------------- |
| `isAnonymous` | `True` if the administrator's presence in the chat should be hidden |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowManageChat(Boolean allow)`

Determines if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode

#### Parameters

| Param   | Description                                                                                                                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowPostMessages(Boolean allow)`

Determines if the administrator can create channel posts, channels only

#### Parameters

| Param   | Description                                                         |
| ------- | ------------------------------------------------------------------- |
| `allow` | `True` if the administrator can create channel posts, channels only |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowEditMessages(Boolean allow)`

Determines if the administrator can edit messages of other users and can pin messages, channels only

#### Parameters

| Param   | Description                                                                                      |
| ------- | ------------------------------------------------------------------------------------------------ |
| `allow` | `True` if the administrator can edit messages of other users and can pin messages, channels only |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowDeleteMessages(Boolean allow)`

Determines if the administrator can delete messages of other users

#### Parameters

| Param   | Description                                                    |
| ------- | -------------------------------------------------------------- |
| `allow` | `True` if the administrator can delete messages of other users |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowManageVideoChats(Boolean allow)`

Determines if the administrator can manage video chats

#### Parameters

| Param   | Description                                        |
| ------- | -------------------------------------------------- |
| `allow` | `True` if the administrator can manage video chats |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowRestrictMembers(Boolean allow)`

Determines if the administrator can restrict, ban or unban chat members

#### Parameters

| Param   | Description                                                         |
| ------- | ------------------------------------------------------------------- |
| `allow` | `True` if the administrator can restrict, ban or unban chat members |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowPromoteMembers(Boolean allow)`

Determines if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly

#### Parameters

| Param   | Description                                                                                                                                                           |
| ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowChangeInfo(Boolean allow)`

Determines if the administrator can change chat title, photo and other settings

#### Parameters

| Param   | Description                                                                 |
| ------- | --------------------------------------------------------------------------- |
| `allow` | `True` if the administrator can change chat title, photo and other settings |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowInviteUsers(Boolean allow)`

Determines if the administrator can invite new users to the chat

#### Parameters

| Param   | Description                                                  |
| ------- | ------------------------------------------------------------ |
| `allow` | `True` if the administrator can invite new users to the chat |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowPinMessages(Boolean allow)`

Determines if the administrator can pin messages, supergroups only

#### Parameters

| Param   | Description                                                    |
| ------- | -------------------------------------------------------------- |
| `allow` | `True` if the administrator can pin messages, supergroups only |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

### `global TelegramPromoteChatMemberOptions allowManageTopics(Boolean allow)`

Determines if the user is allowed to create, rename, close, and reopen forum topics, supergroups only

#### Parameters

| Param   | Description                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------- |
| `allow` | `True` if the user is allowed to create, rename, close, and reopen forum topics, supergroups only |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramPromoteChatMemberOptions` | The current instance of the [TelegramPromoteChatMemberOptions](/types/Classes/TelegramPromoteChatMemberOptions.md) class |

---
