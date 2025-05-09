# TelegramChat

Describes the chat payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#chat

**Inheritance**

TelegramChat

**Implemented types**

[IBotChat](/types/Classes/IBotChat.md)

## Properties

### `global id` → `Long`

The unique identifier for this chat

### `global type` → `String`

The type of chat, can be either “private”, “group”, “supergroup” or “channel”

### `global title` → `String`

The title, for supergroups, channels and group chats

### `global username` → `String`

The username, for private chats, supergroups and channels if available

### `global firstName` → `String`

The first name of the other party in a private chat

### `global lastName` → `String`

The last name of the other party in a private chat

### `global isForum` → `Boolean`

`True` if the supergroup chat is a forum

### `global photo` → `Photo`

The chat photo. Returned only in `getChat`

### `global activeUsernames` → `List<String>`

If non-empty, the list of all active chat usernames; for private chats, supergroups and channels. Returned only in `getChat`

### `global emojiStatusCustomEmojiId` → `String`

The custom emoji identifier of emoji status of the other party in a private chat. Returned only in `getChat`

### `global emojiStatusExpirationDate` → `DateTime`

The expiration date of the emoji status of the other party in a private chat in Unix time, if any. Returned only in `getChat.

### `global bio` → `String`

The bio of the other party in a private chat. Returned only in `getChat`

### `global hasPrivateForwards` → `Boolean`

`True` if privacy settings of the other party in the private chat allows to use `tg://user?id=&lt;user_id&gt;` links only in chats with the user. Returned only in `getChat`

### `global hasRestrictedVoiceAndVideoMessages` → `Boolean`

`True` if the privacy settings of the other party restrict sending voice and video note messages in the private chat. Returned only in `getChat`

### `global joinToSendMessages` → `Boolean`

`True` if users need to join the supergroup before they can send messages. Returned only in `getChat`

### `global joinByRequest` → `Boolean`

`True` if all users directly joining the supergroup need to be approved by supergroup administrators. Returned only in `getChat`

### `global description` → `String`

The description, for groups, supergroups and channel chats. Returned only in `getChat`

### `global inviteLink` → `String`

The primary invite link, for groups, supergroups and channel chats. Returned only in `getChat`

### `global pinnedMessage` → `TelegramMessage`

The most recent pinned message (by sending date). Returned only in `getChat`

### `global permissions` → `TelegramChatPermissions`

The default chat member permissions, for groups and supergroups. Returned only in `getChat`

### `global slowModeDelay` → `Integer`

For supergroups, the minimum allowed delay between consecutive messages sent by each unprivileged user; in seconds. Returned only in `getChat`

### `global messageAutoDeleteTime` → `Integer`

The time after which all messages sent to the chat will be automatically deleted; in seconds. Returned only in `getChat`

### `global hasAggressiveAntiSpamEnabled` → `Boolean`

`True` if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators. Returned only in `getChat`

### `global hasHiddenMembers` → `Boolean`

`True` if non-administrators can only get the list of bots and administrators in the chat. Returned only in `getChat`

### `global hasProtectedContent` → `Boolean`

`True` if messages from the chat can't be forwarded to other chats. Returned only in `getChat`

### `global stickerSetName` → `String`

For supergroups, name of group sticker set. Returned only in `getChat`

### `global canSetStickerSet` → `Boolean`

`True` if the bot can change the group sticker set. Returned only in `getChat`

### `global linkedChatId` → `Long`

The unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. Returned only in `getChat`

### `global location` → `Location`

For supergroups, the location to which the supergroup is connected. Returned only in `getChat`

---

## Methods

### `global String getId()`

Returns the `Telegram` chat id

#### Returns

| Type     | Description            |
| -------- | ---------------------- |
| `String` | The `Telegram` chat id |

### `global String getTitle()`

Returns the chat title combined from first and last names of the sender or username, if the title itself was not set for the chat

#### Returns

| Type     | Description    |
| -------- | -------------- |
| `String` | The chat title |

### `global TelegramUser getSender()`

Returns the payload of the `Telegram` user who wrote the message received in the update

#### Returns

| Type           | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| `TelegramUser` | The instance of the [TelegramUser](/types/Classes/TelegramUser.md) class |

---

## Classes

### Photo

Describes a payload of a chat photo.
Source: https://core.telegram.org/bots/api#chatphoto

**Inheritance**

Photo

#### Properties

##### `global smallFileId` → `String`

The file identifier of small (`160x160`) chat photo

##### `global smallFileUniqueId` → `String`

The unique file identifier of small (`160x160`) chat photo, which is supposed to be the same over time and for different bots

##### `global bigFileId` → `String`

The file identifier of big (`640x640`) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed

##### `global bigFileUniqueId` → `String`

The unique file identifier of big (`640x640`) chat photo, which is supposed to be the same over time and for different bots

---

### Location

Describes a payload of a location to which a chat is connected.
Source: https://core.telegram.org/bots/api#chatlocation

**Inheritance**

Location

#### Properties

##### `global location` → `TelegramLocation`

The location to which the supergroup is connected. Can't be a live location

##### `global address` → `String`

The location address; `1-64` characters, as defined by the chat owner

---

---
