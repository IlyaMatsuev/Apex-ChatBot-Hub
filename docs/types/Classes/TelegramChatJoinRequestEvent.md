# TelegramChatJoinRequestEvent

Describes the common payload properties for the `Telegram` bot chat join request events.
Source: https://core.telegram.org/bots/api#chatjoinrequest

**Inheritance**

TelegramChatJoinRequestEvent

## Properties

### `bio` → `String`

The bio of the user

### `chat` → `TelegramChat`

The chat to which the request was sent

### `inviteLink` → `TelegramChatInviteLink`

The chat invite link that was used by the user to send the join request

### `requestDate` → `DateTime`

The date the request was sent

### `sender` → `TelegramUser`

The user that sent the join request

### `userChatId` → `Long`

The identifier of a private chat with the user who sent the join request

---
