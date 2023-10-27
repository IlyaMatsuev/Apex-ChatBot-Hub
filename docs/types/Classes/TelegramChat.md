# TelegramChat

Describes the chat payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chat

**Inheritance**

TelegramChat

**Implemented types**

[IBotChat](/types/Classes/IBotChat.md)

## Properties

### `activeUsernames` → `List<String>`

If non-empty, the list of all active chat usernames; for private chats, supergroups and channels. Returned only in `getChat`

### `bio` → `String`

The bio of the other party in a private chat. Returned only in `getChat`

### `canSetStickerSet` → `Boolean`

`True` if the bot can change the group sticker set. Returned only in `getChat`

### `description` → `String`

The description, for groups, supergroups and channel chats. Returned only in `getChat`

### `emojiStatusCustomEmojiId` → `String`

The custom emoji identifier of emoji status of the other party in a private chat. Returned only in `getChat`

### `emojiStatusExpirationDate` → `DateTime`

The expiration date of the emoji status of the other party in a private chat in Unix time, if any. Returned only in `getChat.

### `firstName` → `String`

The first name of the other party in a private chat

### `hasAggressiveAntiSpamEnabled` → `Boolean`

`True` if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators. Returned only in `getChat`

### `hasHiddenMembers` → `Boolean`

`True` if non-administrators can only get the list of bots and administrators in the chat. Returned only in `getChat`

### `hasPrivateForwards` → `Boolean`

`True` if privacy settings of the other party in the private chat allows to use `tg://user?id=&lt;user_id&gt;` links only in chats with the user. Returned only in `getChat`

### `hasProtectedContent` → `Boolean`

`True` if messages from the chat can't be forwarded to other chats. Returned only in `getChat`

### `hasRestrictedVoiceAndVideoMessages` → `Boolean`

`True` if the privacy settings of the other party restrict sending voice and video note messages in the private chat. Returned only in `getChat`

### `id` → `Long`

The unique identifier for this chat

### `inviteLink` → `String`

The primary invite link, for groups, supergroups and channel chats. Returned only in `getChat`

### `isForum` → `Boolean`

`True` if the supergroup chat is a forum

### `joinByRequest` → `Boolean`

`True` if all users directly joining the supergroup need to be approved by supergroup administrators. Returned only in `getChat`

### `joinToSendMessages` → `Boolean`

`True` if users need to join the supergroup before they can send messages. Returned only in `getChat`

### `lastName` → `String`

The last name of the other party in a private chat

### `linkedChatId` → `Long`

The unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. Returned only in `getChat`

### `location` → `Location`

For supergroups, the location to which the supergroup is connected. Returned only in `getChat`

### `messageAutoDeleteTime` → `Integer`

The time after which all messages sent to the chat will be automatically deleted; in seconds. Returned only in `getChat`

### `permissions` → `TelegramChatPermissions`

The default chat member permissions, for groups and supergroups. Returned only in `getChat`

### `photo` → `Photo`

The chat photo. Returned only in `getChat`

### `pinnedMessage` → `TelegramMessage`

The most recent pinned message (by sending date). Returned only in `getChat`

### `slowModeDelay` → `Integer`

For supergroups, the minimum allowed delay between consecutive messages sent by each unprivileged user; in seconds. Returned only in `getChat`

### `stickerSetName` → `String`

For supergroups, name of group sticker set. Returned only in `getChat`

### `title` → `String`

The title, for supergroups, channels and group chats

### `type` → `String`

The type of chat, can be either “private”, “group”, “supergroup” or “channel”

### `username` → `String`

The username, for private chats, supergroups and channels if available

---

## Methods

### `getId()`

Returns the `Telegram` chat id

#### Return

**Type**

String

**Description**

The `Telegram` chat id

### `getTitle()`

Returns the chat title combined from first and last names of the sender or username, if the title itself was not set for the chat

#### Return

**Type**

String

**Description**

The chat title

### `getSender()`

Returns the payload of the `Telegram` user who wrote the message received in the update

#### Return

**Type**

TelegramUser

**Description**

The instance of the [TelegramUser](/types/Classes/TelegramUser.md) class

---

## Classes

### Location

Describes a payload of a location to which a chat is connected.
Source: https://core.telegram.org/bots/api#chatlocation

**Inheritance**

Location

#### Properties

##### `address` → `String`

The location address; `1-64` characters, as defined by the chat owner

##### `location` → `TelegramLocation`

The location to which the supergroup is connected. Can't be a live location

---

### Photo

Describes a payload of a chat photo.
Source: https://core.telegram.org/bots/api#chatphoto

**Inheritance**

Photo

#### Properties

##### `bigFileId` → `String`

The file identifier of big (`640x640`) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed

##### `bigFileUniqueId` → `String`

The unique file identifier of big (`640x640`) chat photo, which is supposed to be the same over time and for different bots

##### `smallFileId` → `String`

The file identifier of small (`160x160`) chat photo

##### `smallFileUniqueId` → `String`

The unique file identifier of small (`160x160`) chat photo, which is supposed to be the same over time and for different bots

---

---
