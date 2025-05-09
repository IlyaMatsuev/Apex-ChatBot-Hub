# TelegramChatJoinRequestEvent

Describes the common payload properties for the `Telegram` bot chat join request events.
Source: https://core.telegram.org/bots/api#chatjoinrequest

**Inheritance**

TelegramChatJoinRequestEvent

## Properties

### `global chat` → `TelegramChat`

The chat to which the request was sent

### `global sender` → `TelegramUser`

The user that sent the join request

### `global userChatId` → `Long`

The identifier of a private chat with the user who sent the join request

### `global requestDate` → `DateTime`

The date the request was sent

### `global bio` → `String`

The bio of the user

### `global inviteLink` → `TelegramChatInviteLink`

The chat invite link that was used by the user to send the join request

---
