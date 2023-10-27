# TelegramChatMemberAdmin

Describes the information about an administrator `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberadministrator

**Inheritance**

[TelegramChatMember](/types/Classes/TelegramChatMember.md)
&gt;
[TelegramChatMemberOwner](/types/Classes/TelegramChatMemberOwner.md)
&gt;
TelegramChatMemberAdmin

## Properties

### `canBeEdited` → `Boolean`

`True` if the bot is allowed to edit administrator privileges of that user

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

### `customTitle` → `String`

_Inherited_

The custom title for this user

### `isAnonymous` → `Boolean`

_Inherited_

`True` if the user's presence in the chat is hidden

### `status` → `String`

_Inherited_

The member's status in the chat. One of `member`, `creator`, `administrator`, `restricted`, `left` or `kicked`

### `user` → `TelegramUser`

_Inherited_

The information about the user

---
