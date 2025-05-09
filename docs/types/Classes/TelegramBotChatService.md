# TelegramBotChatService

## Methods

### `global TelegramChat get()`

Gets the information about the chat

#### Returns

| Type           | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| `TelegramChat` | The instance of the [TelegramChat](/types/Classes/TelegramChat.md) class |

### `global List<TelegramChatMemberAdmin> getAdministrators()`

Gets the list of non-bot administrator members in the chat

#### Returns

| Type                            | Description                                                                                |
| ------------------------------- | ------------------------------------------------------------------------------------------ |
| `List<TelegramChatMemberAdmin>` | The list of the [TelegramChatMemberAdmin](/types/Classes/TelegramChatMemberAdmin.md) class |

### `global void leave()`

Leaves the chat group, supergroup or channel

### `global TelegramBotChatInviteLinkService inviteLink()`

Creates an instance of the `Telegram` chat invite link service

#### Returns

| Type                               | Description                                                                                                      |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `TelegramBotChatInviteLinkService` | The instance of the [TelegramBotChatInviteLinkService](/types/Classes/TelegramBotChatInviteLinkService.md) class |

### `global TelegramBotChatJoinRequestService joinRequest(String userId)`

Creates an instance of the `Telegram` chat join request service

#### Parameters

| Param    | Description                                                                  |
| -------- | ---------------------------------------------------------------------------- |
| `userId` | The `Telegram` id of the user whose request needs to be approved or declined |

#### Returns

| Type                                | Description                                                                                                        |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `TelegramBotChatJoinRequestService` | The instance of the [TelegramBotChatJoinRequestService](/types/Classes/TelegramBotChatJoinRequestService.md) class |

### `global TelegramBotChatMemberService member(String userId)`

Creates an instance of the `Telegram` chat member service

#### Parameters

| Param    | Description                               |
| -------- | ----------------------------------------- |
| `userId` | The `Telegram` id of the chat member user |

#### Returns

| Type                           | Description                                                                                              |
| ------------------------------ | -------------------------------------------------------------------------------------------------------- |
| `TelegramBotChatMemberService` | The instance of the [TelegramBotChatMemberService](/types/Classes/TelegramBotChatMemberService.md) class |

### `global Integer getMembersCount()`

Gets the number of members in the chat

#### Returns

| Type      | Description       |
| --------- | ----------------- |
| `Integer` | The members count |

### `global void setPermissions(TelegramChatPermissions permissions)`

Sets the default permissions for all members of the chat. The bot must be an administrator in the group or a supergroup for this to work and must have the `can_restrict_members` administrator rights

#### Parameters

| Param         | Description                             |
| ------------- | --------------------------------------- |
| `permissions` | Object representing applied permissions |

### `global void setPhoto(String photo)`

Sets the new chat profile photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param   | Description                       |
| ------- | --------------------------------- |
| `photo` | New chat photo `Telegram` file id |

### `global void deletePhoto()`

Deletes the chat profile photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

### `global void setTitle(String title)`

Sets the new chat title. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param   | Description                        |
| ------- | ---------------------------------- |
| `title` | New chat title, `1-128` characters |

### `global void setDescription(String description)`

Sets the new chat description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param         | Description                              |
| ------------- | ---------------------------------------- |
| `description` | New chat description, `0-255` characters |

### `global void pinMessage(String messageId)`

Pins the message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel

#### Parameters

| Param       | Description                |
| ----------- | -------------------------- |
| `messageId` | The unique chat message id |

### `global void pinMessage(String messageId, Boolean disableNotification)`

Pins the message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel

#### Parameters

| Param                 | Description                                                                                                                                                            |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `messageId`           | The unique chat message id                                                                                                                                             |
| `disableNotification` | `True` if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats |

### `global void unpinMessage()`

Unpins the last pinned message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel

### `global void unpinMessage(String messageId)`

Unpins the message in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel

#### Parameters

| Param       | Description                       |
| ----------- | --------------------------------- |
| `messageId` | The unique pinned chat message id |

### `global void unpinAllMessages()`

Unpins messages in the chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the `can_pin_messages` administrator right in a supergroup or `can_edit_messages` administrator right in a channel

### `global void setStickerSet(String stickerSetName)`

Sets a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

#### Parameters

| Param            | Description                                                    |
| ---------------- | -------------------------------------------------------------- |
| `stickerSetName` | The name of the sticker set to be set as the group sticker set |

### `global void deleteStickerSet()`

Deletes a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights

---
