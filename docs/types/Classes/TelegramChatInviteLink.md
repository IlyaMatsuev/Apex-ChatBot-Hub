# TelegramChatInviteLink

Describes the chat invite link payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chatinvitelink

**Inheritance**

TelegramChatInviteLink

## Properties

### `global inviteLink` → `String`

The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with `...`

### `global creator` → `TelegramUser`

The creator of the link

### `global createsJoinRequest` → `Boolean`

`True` if users joining the chat via the link need to be approved by chat administrators

### `global isPrimary` → `Boolean`

`True` if the link is primary

### `global isRevoked` → `Boolean`

`True` if the link is revoked

### `global name` → `String`

The invite link name

### `global expireDate` → `DateTime`

The point in time when the link will expire or has been expired

### `global memberLimit` → `Integer`

The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; `1-99999`

### `global pendingJoinRequestCount` → `Integer`

The number of pending join requests created using this link

---
