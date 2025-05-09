# TelegramChatMemberBanned

Describes the information about a banned `Telegram` chat member.
Source: https://core.telegram.org/bots/api#chatmemberbanned

**Inheritance**

[TelegramChatMember](/types/Classes/TelegramChatMember.md)
&gt;
TelegramChatMemberBanned

## Properties

### `global untilDate` → `DateTime`

The date when restrictions will be lifted for this user. If `0` then the user is restricted forever

### `global status` → `String`

_Inherited_

The member's status in the chat. One of `member`, `creator`, `administrator`, `restricted`, `left` or `kicked`

### `global user` → `TelegramUser`

_Inherited_

The information about the user

---
