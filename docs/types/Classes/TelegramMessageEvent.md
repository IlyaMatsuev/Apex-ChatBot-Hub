# TelegramMessageEvent

Describes the common payload properties for the `Telegram` bot message events.
Source: https://core.telegram.org/bots/api#message

**Inheritance**

[TelegramMessage](/types/Classes/TelegramMessage.md)
&gt;
TelegramMessageEvent

## Properties

### `global messageId` → `Integer`

_Inherited_

The unique message identifier inside this chat

### `global messageThreadId` → `Integer`

_Inherited_

The unique identifier of a message thread to which the message belongs; for supergroups only

### `global sender` → `TelegramUser`

_Inherited_

The sender of the message; empty for messages sent to channels

### `global senderChat` → `TelegramChat`

_Inherited_

The sender of the message, sent on behalf of a chat. For example, the channel itself for channel posts, the supergroup itself for messages from anonymous group administrators, the linked channel for messages automatically forwarded to the discussion group

### `global sendDate` → `DateTime`

_Inherited_

The date the message was sent

### `global chat` → `TelegramChat`

_Inherited_

The conversation the message belongs to

### `global forwardFrom` → `TelegramUser`

_Inherited_

For forwarded messages, sender of the original message

### `global forwardFromChat` → `TelegramChat`

_Inherited_

For messages forwarded from channels or from anonymous administrators, information about the original sender chat

### `global forwardFromMessageId` → `Integer`

_Inherited_

For messages forwarded from channels, identifier of the original message in the channel

### `global forwardSignature` → `String`

_Inherited_

For messages forwarded from channels, identifier of the original message in the channel

### `global forwardSenderName` → `String`

_Inherited_

The sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages

### `global forwardSendDate` → `DateTime`

_Inherited_

For forwarded messages, date the original message was sent

### `global isTopicMessage` → `Boolean`

_Inherited_

`True` if the message is sent to a forum topic

### `global isAutomaticForward` → `Boolean`

_Inherited_

`True` if the message is a channel post that was automatically forwarded to the connected discussion group

### `global replyToMessage` → `TelegramMessage`

_Inherited_

For replies, the original message. Note that the [TelegramMessage](/types/Classes/TelegramMessage.md) object in this field will not contain further reply_to_message fields even if it itself is a reply

### `global viaBot` → `TelegramUser`

_Inherited_

The bot through which the message was sent

### `global editDate` → `DateTime`

_Inherited_

Date the message was last edited

### `global hasProtectedContent` → `Boolean`

_Inherited_

`True` if the message can't be forwarded

### `global mediaGroupId` → `String`

_Inherited_

The unique identifier of a media message group this message belongs to

### `global authorSignature` → `String`

_Inherited_

The signature of the post author for messages in channels, or the custom title of an anonymous group administrator

### `global text` → `String`

_Inherited_

For text messages, the actual UTF-8 text of the message

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text

### `global animation` → `TelegramAnimation`

_Inherited_

If the message is an animation, information about the animation

### `global audio` → `TelegramAudio`

_Inherited_

If the message is an audio file, information about the file

### `global document` → `TelegramDocument`

_Inherited_

If the message is a general file, information about the file

### `global photo` → `List<TelegramPhotoSize>`

_Inherited_

If the message is a photo, available sizes of the photo

### `global sticker` → `TelegramSticker`

_Inherited_

If the message is a sticker, information about the sticker

### `global video` → `TelegramVideo`

_Inherited_

If the message is a video, information about the video

### `global videoNote` → `TelegramVideoNote`

_Inherited_

If the message is a video note, information about the video message

### `global voice` → `TelegramVoice`

_Inherited_

If the message is a voice message, information about the file

### `global caption` → `String`

_Inherited_

The caption for the animation, audio, document, photo, video or voice

### `global captionEntities` → `List<TelegramMessageEntity>`

_Inherited_

For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption

### `global hasMediaSpoiler` → `Boolean`

_Inherited_

`True` if the message media is covered by a spoiler animation

### `global contact` → `TelegramContact`

_Inherited_

If the message is a shared contact, information about the contact

### `global dice` → `TelegramDice`

_Inherited_

If the message is a dice with random value

### `global poll` → `TelegramPoll`

_Inherited_

If the message is a native poll, information about the poll

### `global venue` → `TelegramVenue`

_Inherited_

If the message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set

### `global location` → `TelegramLocation`

_Inherited_

If the message is a shared location, information about the location

### `global newChatMembers` → `List<TelegramUser>`

_Inherited_

New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)

### `global leftChatMember` → `TelegramUser`

_Inherited_

A member was removed from the group, information about them (this member may be the bot itself)

### `global newChatTitle` → `String`

_Inherited_

A chat title was changed to this value

### `global newChatPhoto` → `List<TelegramPhotoSize>`

_Inherited_

A chat photo was change to this value

### `global pinnedMessage` → `TelegramMessage`

_Inherited_

The specified message was pinned

### `global replyMarkup` → `TelegramInlineKeyboardMarkupOptions`

_Inherited_

The inline keyboard attached to the message

---

## Methods

### `global String getId()`

_Inherited_

Returns the `Telegram` message id as a `String`

#### Returns

| Type     | Description               |
| -------- | ------------------------- |
| `String` | The `Telegram` message id |

### `global BotMessageType getType()`

_Inherited_

Returns the message type

#### Returns

| Type             | Description                                                               |
| ---------------- | ------------------------------------------------------------------------- |
| `BotMessageType` | The instance of the [BotMessageType](/types/Enums/BotMessageType.md) enum |

### `global String getText()`

_Inherited_

Returns the message text

#### Returns

| Type     | Description      |
| -------- | ---------------- |
| `String` | The message text |

### `global String getMediaUrl()`

_Inherited_

Returns the media URL if it was attached to the message

#### Returns

| Type     | Description           |
| -------- | --------------------- |
| `String` | The message media URL |

### `global DateTime getSendDate()`

_Inherited_

Returns the message send date

#### Returns

| Type       | Description           |
| ---------- | --------------------- |
| `DateTime` | The message send date |

### `global BotJsonPayload getParameters()`

_Inherited_

Returns the additional message parameters

#### Returns

| Type             | Description                                                                  |
| ---------------- | ---------------------------------------------------------------------------- |
| `BotJsonPayload` | The instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

---
