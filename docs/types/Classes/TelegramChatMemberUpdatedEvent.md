# TelegramChatMemberUpdatedEvent

Describes the common payload properties for the `Telegram` bot chat member updated events.
Source: https://core.telegram.org/bots/api#chatmemberupdated

**Inheritance**

TelegramChatMemberUpdatedEvent

## Properties

### `changeDate` → `DateTime`

The date the change was done

### `chat` → `TelegramChat`

The chat the user belongs to

### `inviteLink` → `TelegramChatInviteLink`

The chat invite link, which was used by the user to join the chat; for joining by invite link events only

### `newChatMember` → `TelegramChatMember`

The new information about the chat member

### `oldChatMember` → `TelegramChatMember`

The previous information about the chat member

### `sender` → `TelegramUser`

The performer of the action, which resulted in the change

### `viaChatFolderInviteLink` → `Boolean`

`True` if the user joined the chat via a chat folder invite link

---
