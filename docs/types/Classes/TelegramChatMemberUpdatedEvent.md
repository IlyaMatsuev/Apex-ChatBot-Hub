# TelegramChatMemberUpdatedEvent

Describes the common payload properties for the `Telegram` bot chat member updated events.
Source: https://core.telegram.org/bots/api#chatmemberupdated

**Inheritance**

TelegramChatMemberUpdatedEvent

## Properties

### `global chat` → `TelegramChat`

The chat the user belongs to

### `global sender` → `TelegramUser`

The performer of the action, which resulted in the change

### `global changeDate` → `DateTime`

The date the change was done

### `global oldChatMember` → `TelegramChatMember`

The previous information about the chat member

### `global newChatMember` → `TelegramChatMember`

The new information about the chat member

### `global inviteLink` → `TelegramChatInviteLink`

The chat invite link, which was used by the user to join the chat; for joining by invite link events only

### `global viaChatFolderInviteLink` → `Boolean`

`True` if the user joined the chat via a chat folder invite link

---
