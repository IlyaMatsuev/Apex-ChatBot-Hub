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

### `global canBeEdited` → `Boolean`

`True` if the bot is allowed to edit administrator privileges of that user

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

### `global isAnonymous` → `Boolean`

_Inherited_

`True` if the user's presence in the chat is hidden

### `global customTitle` → `String`

_Inherited_

The custom title for this user

### `global status` → `String`

_Inherited_

The member's status in the chat. One of `member`, `creator`, `administrator`, `restricted`, `left` or `kicked`

### `global user` → `TelegramUser`

_Inherited_

The information about the user

---
