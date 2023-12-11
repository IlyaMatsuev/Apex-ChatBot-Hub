# TelegramChatMemberRestricted

Describes the information about a restricted `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberrestricted

**Inheritance**

[TelegramChatMember](/types/Classes/TelegramChatMember.md)
&gt;
TelegramChatMemberRestricted

## Properties

### `canAddWebPagePreviews` → `Boolean`

`True` if the user is allowed to add web page previews to their messages

### `canChangeInfo` → `Boolean`

`True` if the user is allowed to change the chat title, photo and other settings

### `canInviteUsers` → `Boolean`

`True` if the user is allowed to invite new users to the chat

### `canManageTopics` → `Boolean`

`True` if the user is allowed to create forum topics

### `canPinMessages` → `Boolean`

`True` if the user is allowed to pin messages

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

### `isMember` → `Boolean`

`True` if the user is a member of the chat at the moment of the request

### `status` → `String`

_Inherited_

The member's status in the chat. One of `member`, `creator`, `administrator`, `restricted`, `left` or `kicked`

### `untilDate` → `DateTime`

The date when restrictions will be lifted for this user. If `0` then the user is restricted forever

### `user` → `TelegramUser`

_Inherited_

The information about the user

---
