# TelegramMessage

Describes the message payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#message

**Inheritance**

TelegramMessage

**Implemented types**

[IBotMessage](/types/Classes/IBotMessage.md)

## Properties

### `animation` → `TelegramAnimation`

If the message is an animation, information about the animation

### `audio` → `TelegramAudio`

If the message is an audio file, information about the file

### `authorSignature` → `String`

The signature of the post author for messages in channels, or the custom title of an anonymous group administrator

### `caption` → `String`

The caption for the animation, audio, document, photo, video or voice

### `captionEntities` → `List<TelegramMessageEntity>`

For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption

### `chat` → `TelegramChat`

The conversation the message belongs to

### `contact` → `TelegramContact`

If the message is a shared contact, information about the contact

### `dice` → `TelegramDice`

If the message is a dice with random value

### `document` → `TelegramDocument`

If the message is a general file, information about the file

### `editDate` → `DateTime`

Date the message was last edited

### `entities` → `List<TelegramMessageEntity>`

For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text

### `forwardFrom` → `TelegramUser`

For forwarded messages, sender of the original message

### `forwardFromChat` → `TelegramChat`

For messages forwarded from channels or from anonymous administrators, information about the original sender chat

### `forwardFromMessageId` → `Integer`

For messages forwarded from channels, identifier of the original message in the channel

### `forwardSendDate` → `DateTime`

For forwarded messages, date the original message was sent

### `forwardSenderName` → `String`

The sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages

### `forwardSignature` → `String`

For messages forwarded from channels, identifier of the original message in the channel

### `hasMediaSpoiler` → `Boolean`

`True` if the message media is covered by a spoiler animation

### `hasProtectedContent` → `Boolean`

`True` if the message can't be forwarded

### `isAutomaticForward` → `Boolean`

`True` if the message is a channel post that was automatically forwarded to the connected discussion group

### `isTopicMessage` → `Boolean`

`True` if the message is sent to a forum topic

### `leftChatMember` → `TelegramUser`

A member was removed from the group, information about them (this member may be the bot itself)

### `location` → `TelegramLocation`

If the message is a shared location, information about the location

### `mediaGroupId` → `String`

The unique identifier of a media message group this message belongs to

### `messageId` → `Integer`

The unique message identifier inside this chat

### `messageThreadId` → `Integer`

The unique identifier of a message thread to which the message belongs; for supergroups only

### `newChatMembers` → `List<TelegramUser>`

New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)

### `newChatPhoto` → `List<TelegramPhotoSize>`

A chat photo was change to this value

### `newChatTitle` → `String`

A chat title was changed to this value

### `photo` → `List<TelegramPhotoSize>`

If the message is a photo, available sizes of the photo

### `pinnedMessage` → `TelegramMessage`

The specified message was pinned

### `poll` → `TelegramPoll`

If the message is a native poll, information about the poll

### `replyMarkup` → `TelegramInlineKeyboardMarkupOptions`

The inline keyboard attached to the message

### `replyToMessage` → `TelegramMessage`

For replies, the original message. Note that the [TelegramMessage](/types/Classes/TelegramMessage.md) object in this field will not contain further reply_to_message fields even if it itself is a reply

### `sendDate` → `DateTime`

The date the message was sent

### `sender` → `TelegramUser`

The sender of the message; empty for messages sent to channels

### `senderChat` → `TelegramChat`

The sender of the message, sent on behalf of a chat. For example, the channel itself for channel posts, the supergroup itself for messages from anonymous group administrators, the linked channel for messages automatically forwarded to the discussion group

### `sticker` → `TelegramSticker`

If the message is a sticker, information about the sticker

### `text` → `String`

For text messages, the actual UTF-8 text of the message

### `venue` → `TelegramVenue`

If the message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set

### `viaBot` → `TelegramUser`

The bot through which the message was sent

### `video` → `TelegramVideo`

If the message is a video, information about the video

### `videoNote` → `TelegramVideoNote`

If the message is a video note, information about the video message

### `voice` → `TelegramVoice`

If the message is a voice message, information about the file

---

## Methods

### `getId()`

Returns the `Telegram` message id as a `String`

#### Return

**Type**

String

**Description**

The `Telegram` message id

### `getType()`

Returns the message type

#### Return

**Type**

BotMessageType

**Description**

The instance of the [BotMessageType](/types/Enums/BotMessageType.md) enum

### `getText()`

Returns the message text

#### Return

**Type**

String

**Description**

The message text

### `getMediaUrl()`

Returns the media URL if it was attached to the message

#### Return

**Type**

String

**Description**

The message media URL

### `getSendDate()`

Returns the message send date

#### Return

**Type**

DateTime

**Description**

The message send date

### `getParameters()`

Returns the additional message parameters

#### Return

**Type**

BotJsonPayload

**Description**

The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class

---
