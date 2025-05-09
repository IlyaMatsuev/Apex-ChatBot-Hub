# virtual TelegramMessage

Describes the message payload received as an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#message

**Inheritance**

TelegramMessage

**Implemented types**

[IBotMessage](/types/Classes/IBotMessage.md)

## Properties

### `global messageId` → `Integer`

The unique message identifier inside this chat

### `global messageThreadId` → `Integer`

The unique identifier of a message thread to which the message belongs; for supergroups only

### `global sender` → `TelegramUser`

The sender of the message; empty for messages sent to channels

### `global senderChat` → `TelegramChat`

The sender of the message, sent on behalf of a chat. For example, the channel itself for channel posts, the supergroup itself for messages from anonymous group administrators, the linked channel for messages automatically forwarded to the discussion group

### `global sendDate` → `DateTime`

The date the message was sent

### `global chat` → `TelegramChat`

The conversation the message belongs to

### `global forwardFrom` → `TelegramUser`

For forwarded messages, sender of the original message

### `global forwardFromChat` → `TelegramChat`

For messages forwarded from channels or from anonymous administrators, information about the original sender chat

### `global forwardFromMessageId` → `Integer`

For messages forwarded from channels, identifier of the original message in the channel

### `global forwardSignature` → `String`

For messages forwarded from channels, identifier of the original message in the channel

### `global forwardSenderName` → `String`

The sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages

### `global forwardSendDate` → `DateTime`

For forwarded messages, date the original message was sent

### `global isTopicMessage` → `Boolean`

`True` if the message is sent to a forum topic

### `global isAutomaticForward` → `Boolean`

`True` if the message is a channel post that was automatically forwarded to the connected discussion group

### `global replyToMessage` → `TelegramMessage`

For replies, the original message. Note that the [TelegramMessage](/types/Classes/TelegramMessage.md) object in this field will not contain further reply_to_message fields even if it itself is a reply

### `global viaBot` → `TelegramUser`

The bot through which the message was sent

### `global editDate` → `DateTime`

Date the message was last edited

### `global hasProtectedContent` → `Boolean`

`True` if the message can't be forwarded

### `global mediaGroupId` → `String`

The unique identifier of a media message group this message belongs to

### `global authorSignature` → `String`

The signature of the post author for messages in channels, or the custom title of an anonymous group administrator

### `global text` → `String`

For text messages, the actual UTF-8 text of the message

### `global entities` → `List<TelegramMessageEntity>`

For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text

### `global animation` → `TelegramAnimation`

If the message is an animation, information about the animation

### `global audio` → `TelegramAudio`

If the message is an audio file, information about the file

### `global document` → `TelegramDocument`

If the message is a general file, information about the file

### `global photo` → `List<TelegramPhotoSize>`

If the message is a photo, available sizes of the photo

### `global sticker` → `TelegramSticker`

If the message is a sticker, information about the sticker

### `global video` → `TelegramVideo`

If the message is a video, information about the video

### `global videoNote` → `TelegramVideoNote`

If the message is a video note, information about the video message

### `global voice` → `TelegramVoice`

If the message is a voice message, information about the file

### `global caption` → `String`

The caption for the animation, audio, document, photo, video or voice

### `global captionEntities` → `List<TelegramMessageEntity>`

For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption

### `global hasMediaSpoiler` → `Boolean`

`True` if the message media is covered by a spoiler animation

### `global contact` → `TelegramContact`

If the message is a shared contact, information about the contact

### `global dice` → `TelegramDice`

If the message is a dice with random value

### `global poll` → `TelegramPoll`

If the message is a native poll, information about the poll

### `global venue` → `TelegramVenue`

If the message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set

### `global location` → `TelegramLocation`

If the message is a shared location, information about the location

### `global newChatMembers` → `List<TelegramUser>`

New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)

### `global leftChatMember` → `TelegramUser`

A member was removed from the group, information about them (this member may be the bot itself)

### `global newChatTitle` → `String`

A chat title was changed to this value

### `global newChatPhoto` → `List<TelegramPhotoSize>`

A chat photo was change to this value

### `global pinnedMessage` → `TelegramMessage`

The specified message was pinned

### `global replyMarkup` → `TelegramInlineKeyboardMarkupOptions`

The inline keyboard attached to the message

---

## Methods

### `global String getId()`

Returns the `Telegram` message id as a `String`

#### Returns

| Type     | Description               |
| -------- | ------------------------- |
| `String` | The `Telegram` message id |

### `global BotMessageType getType()`

Returns the message type

#### Returns

| Type             | Description                                                               |
| ---------------- | ------------------------------------------------------------------------- |
| `BotMessageType` | The instance of the [BotMessageType](/types/Enums/BotMessageType.md) enum |

### `global String getText()`

Returns the message text

#### Returns

| Type     | Description      |
| -------- | ---------------- |
| `String` | The message text |

### `global String getMediaUrl()`

Returns the media URL if it was attached to the message

#### Returns

| Type     | Description           |
| -------- | --------------------- |
| `String` | The message media URL |

### `global DateTime getSendDate()`

Returns the message send date

#### Returns

| Type       | Description           |
| ---------- | --------------------- |
| `DateTime` | The message send date |

### `global BotJsonPayload getParameters()`

Returns the additional message parameters

#### Returns

| Type             | Description                                                                  |
| ---------------- | ---------------------------------------------------------------------------- |
| `BotJsonPayload` | The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

---
