# TelegramChatMemberRestricted

Describes the information about a restricted `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberrestricted

**Inheritance**

[TelegramChatMember](/types/Classes/TelegramChatMember.md)
&gt;
TelegramChatMemberRestricted

## Properties

### `global isMember` → `Boolean`

`True` if the user is a member of the chat at the moment of the request

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

`True` if the user is allowed to change the chat title, photo and other settings

### `global canInviteUsers` → `Boolean`

`True` if the user is allowed to invite new users to the chat

### `global canPinMessages` → `Boolean`

`True` if the user is allowed to pin messages

### `global canManageTopics` → `Boolean`

`True` if the user is allowed to create forum topics

### `global untilDate` → `DateTime`

The date when restrictions will be lifted for this user. If `0` then the user is restricted forever

### `global status` → `String`

_Inherited_

The member's status in the chat. One of `member`, `creator`, `administrator`, `restricted`, `left` or `kicked`

### `global user` → `TelegramUser`

_Inherited_

The information about the user

---
