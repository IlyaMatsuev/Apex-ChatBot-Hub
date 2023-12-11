# TelegramBotChatInviteLinkService

Service class that provides access to all `Telegram` `chatInviteLink` methods

## Methods

### `export()`

Generates a new primary invite link for the chat. Any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Return

**Type**

String

**Description**

The new chat invite link

### `create()`

Creates an additional invite link for the chat. The link can be revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Return

**Type**

TelegramChatInviteLink

**Description**

The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class

### `create(LinkOptions options)`

Creates an additional invite link for the chat. The link can be revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param     | Description                        |
| --------- | ---------------------------------- |
| `options` | The additional invite link options |

#### Return

**Type**

TelegramChatInviteLink

**Description**

The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class

### `edit(String inviteLink)`

Edits a non-primary invite link for the chat created by bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param        | Description             |
| ------------ | ----------------------- |
| `inviteLink` | The invite link to edit |

#### Return

**Type**

TelegramChatInviteLink

**Description**

The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class

### `edit(String inviteLink, LinkOptions options)`

Edits a non-primary invite link for the chat created by bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param        | Description                        |
| ------------ | ---------------------------------- |
| `inviteLink` | The invite link to edit            |
| `options`    | The additional invite link options |

#### Return

**Type**

TelegramChatInviteLink

**Description**

The instance of the [TelegramChatInviteLink](/types/Classes/TelegramChatInviteLink.md) class

### `revoke(String inviteLink)`

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

##### `LinkOptions()`

Creates a new instance of the invite link options without the link name

##### `LinkOptions(String name)`

Creates a new instance of the invite link options with the provided link name

###### Parameters

| Param  | Description   |
| ------ | ------------- |
| `name` | The link name |

---

#### Methods

##### `withExpireDate(DateTime expireDate)`

Sets the point in time when the link will expire

###### Parameters

| Param        | Description                                 |
| ------------ | ------------------------------------------- |
| `expireDate` | The point in time when the link will expire |

###### Return

**Type**

LinkOptions

**Description**

The current instance of the [TelegramBotChatInviteLinkService.LinkOptions](TelegramBotChatInviteLinkService.LinkOptions) class

##### `withMemberLimit(Integer memberLimit)`

Sets the maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link

###### Parameters

| Param         | Description                                                                                                                       |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `memberLimit` | The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link, `1-99999` |

###### Return

**Type**

LinkOptions

**Description**

The current instance of the [TelegramBotChatInviteLinkService.LinkOptions](TelegramBotChatInviteLinkService.LinkOptions) class

##### `withRequestApproval()`

Sets if users joining the chat via the link need to be approved by chat administrators. If `True` member limit can't be specified

###### Return

**Type**

LinkOptions

**Description**

The current instance of the [TelegramBotChatInviteLinkService.LinkOptions](TelegramBotChatInviteLinkService.LinkOptions) class

---

---
