# TelegramBotChatInviteLinkService

Service class that provides access to all `Telegram` `chatInviteLink` methods

## Methods

### `global String export()`

Generates a new primary invite link for the chat. Any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Returns

| Type     | Description              |
| -------- | ------------------------ |
| `String` | The new chat invite link |

### `global TelegramChatInviteLink create()`

Creates an additional invite link for the chat. The link can be revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Returns

| Type                     | Description                                                                                  |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| `TelegramChatInviteLink` | The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class |

### `global TelegramChatInviteLink create(LinkOptions options)`

Creates an additional invite link for the chat. The link can be revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param     | Description                        |
| --------- | ---------------------------------- |
| `options` | The additional invite link options |

#### Returns

| Type                     | Description                                                                                  |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| `TelegramChatInviteLink` | The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class |

### `global TelegramChatInviteLink edit(String inviteLink)`

Edits a non-primary invite link for the chat created by bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param        | Description             |
| ------------ | ----------------------- |
| `inviteLink` | The invite link to edit |

#### Returns

| Type                     | Description                                                                                  |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| `TelegramChatInviteLink` | The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class |

### `global TelegramChatInviteLink edit(String inviteLink, LinkOptions options)`

Edits a non-primary invite link for the chat created by bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param        | Description                        |
| ------------ | ---------------------------------- |
| `inviteLink` | The invite link to edit            |
| `options`    | The additional invite link options |

#### Returns

| Type                     | Description                                                                                  |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| `TelegramChatInviteLink` | The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class |

### `global void revoke(String inviteLink)`

Revokes the invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param        | Description               |
| ------------ | ------------------------- |
| `inviteLink` | The invite link to revoke |

---

## Classes

### LinkOptions

Represents the optional parameters for `create` and `edit` chat invite link methods.
Source: https://core.telegram.org/bots/api#createchatinvitelink

**Inheritance**

LinkOptions

#### Constructors

##### `global LinkOptions()`

Creates a new instance of the invite link options without the link name

##### `global LinkOptions(String name)`

Creates a new instance of the invite link options with the provided link name

###### Parameters

| Param  | Description   |
| ------ | ------------- |
| `name` | The link name |

---

#### Methods

##### `global LinkOptions withExpireDate(DateTime expireDate)`

Sets the point in time when the link will expire

###### Parameters

| Param        | Description                                 |
| ------------ | ------------------------------------------- |
| `expireDate` | The point in time when the link will expire |

###### Returns

| Type          | Description                                                                                                                    |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `LinkOptions` | The current instance of the [TelegramBotChatInviteLinkService.LinkOptions](TelegramBotChatInviteLinkService.LinkOptions) class |

##### `global LinkOptions withMemberLimit(Integer memberLimit)`

Sets the maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link

###### Parameters

| Param         | Description                                                                                                                       |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `memberLimit` | The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link, `1-99999` |

###### Returns

| Type          | Description                                                                                                                    |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `LinkOptions` | The current instance of the [TelegramBotChatInviteLinkService.LinkOptions](TelegramBotChatInviteLinkService.LinkOptions) class |

##### `global LinkOptions withRequestApproval()`

Sets if users joining the chat via the link need to be approved by chat administrators. If `True` member limit can't be specified

###### Returns

| Type          | Description                                                                                                                    |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `LinkOptions` | The current instance of the [TelegramBotChatInviteLinkService.LinkOptions](TelegramBotChatInviteLinkService.LinkOptions) class |

---

---
