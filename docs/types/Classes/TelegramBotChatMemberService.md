# TelegramBotChatMemberService

Service class that provides access to all `Telegram` `chatMember` methods

## Methods

### `global TelegramChatMember get()`

Gets information about a chat member of the chat. The method is only guaranteed to work for other users if the bot is an administrator in the chat

#### Returns

| Type                 | Description                                                                          |
| -------------------- | ------------------------------------------------------------------------------------ |
| `TelegramChatMember` | The instance of the [TelegramChatMember](/types/Classes/TelegramChatMember.md) class |

### `global void ban()`

Bans a user in a group, supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first.
The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

### `global void ban(DateTime untilDate)`

Bans a user in a group, supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first.
The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param       | Description                                                                                                                                                                                                             |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `untilDate` | The date when the user will be unbanned. If user is banned for more than `366 days` or less than `30 seconds` from the current time they are considered to be banned forever. Applied for supergroups and channels only |

### `global void ban(DateTime untilDate, Boolean revokeMessages)`

Bans a user in a group, supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first.
The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param            | Description                                                                                                                                                                                                             |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `untilDate`      | The date when the user will be unbanned. If user is banned for more than `366 days` or less than `30 seconds` from the current time they are considered to be banned forever. Applied for supergroups and channels only |
| `revokeMessages` | `True` to delete all messages from the chat for the user that is being removed. Always `True` for supergroups and channels                                                                                              |

### `global void unban()`

Unbans a previously banned user in a supergroup or channel. This method does not return a user back to the group automatically. The bot must be an administrator for this to work

### `global void restrict(TelegramChatPermissions permissions)`

Restricts a user in a supergroup. The bot must be an administrator for this to work. Pass `True` for all permissions to lift restrictions from a user

#### Parameters

| Param         | Description                              |
| ------------- | ---------------------------------------- |
| `permissions` | Object representing applied restrictions |

### `global void restrict(TelegramChatPermissions permissions, DateTime untilDate)`

Restricts a user in a supergroup. The bot must be an administrator for this to work. Pass `True` for all permissions to lift restrictions from a user

#### Parameters

| Param         | Description                                                                                                                                                                                           |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `permissions` | Object representing applied restrictions                                                                                                                                                              |
| `untilDate`   | The date when restrictions will be lifted from the user. If user is restricted for more than `366 days` or less than `30 seconds` from the current time, they are considered to be restricted forever |

### `global void promote(TelegramPromoteChatMemberOptions promoteOptions)`

Promotes or demotes a user in a supergroup or channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param            | Description                            |
| ---------------- | -------------------------------------- |
| `promoteOptions` | Object representing applied promotions |

### `global void setCustomTitle(String title)`

Sets a custom title for an administrator in a supergroup

#### Parameters

| Param   | Description                                                                      |
| ------- | -------------------------------------------------------------------------------- |
| `title` | The custom title for the administrator. `0-16` characters, emoji are not allowed |

---
