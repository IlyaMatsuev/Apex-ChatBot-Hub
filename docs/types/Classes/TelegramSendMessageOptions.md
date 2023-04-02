# TelegramSendMessageOptions

The builder-like class that describes common optional parameters of the `Telegram` for sending messages

**Inheritance**

TelegramSendMessageOptions

## Constructors

### `TelegramSendMessageOptions()`

Creates an instance of the message options

---

## Properties

### `entities` → `List<MessageEntity>`

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Classes

### MessageEntity

The builder-like class representing a special entity in a message text. For example, hashtags, usernames, etc. The source: https://core.telegram.org/bots/api#messageentity

**Inheritance**

MessageEntity

#### Constructors

##### `MessageEntity(String type, Integer offset, Integer length)`

Creates an instance of the message entity with the provided type and coordinates in the message text

###### Parameters

| Param    | Description                                                                                                                                                                                                                                    |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `type`   | The type of the entity. Possible values: `mention`, `hashtag`, `cashtag`, `bot_command`, `url`, `email`, `phone_number`, `bold`, `italic`, `underline`, `strikethrough`, `spoiler`, `code`, `pre`, `text_link`, `text_mention`, `custom_emoji` |
| `offset` | The offset to start of the message entity                                                                                                                                                                                                      |
| `length` | The length of the entity                                                                                                                                                                                                                       |

---

#### Methods

##### `asUrl(String url)`

Sets the message entity as a link. Works with `text_link` type

###### Parameters

| Param | Description                                             |
| ----- | ------------------------------------------------------- |
| `url` | The URL that will be opened when the user taps the text |

###### Return

**Type**

MessageEntity

**Description**

The current instance of the message entity

##### `asUserMention(String userId)`

Sets the message entity as a user mention. Works with `text_mention` type

###### Parameters

| Param    | Description                                              |
| -------- | -------------------------------------------------------- |
| `userId` | The `Telegram` id of the user that needs to be mentioned |

###### Return

**Type**

MessageEntity

**Description**

The current instance of the message entity

##### `asProgrammingLanguage(String language)`

Sets the message entity as a programming language syntax highlighting. Works with `pre` type

###### Parameters

| Param      | Description                               |
| ---------- | ----------------------------------------- |
| `language` | The programing language to use syntax for |

###### Return

**Type**

MessageEntity

**Description**

The current instance of the message entity

##### `asCustomEmoji(String emojiId)`

Sets the message entity as a custom emoji. Works with `custom_emoji` type

###### Parameters

| Param     | Description         |
| --------- | ------------------- |
| `emojiId` | The custom emoji id |

###### Return

**Type**

MessageEntity

**Description**

The current instance of the message entity

---

---
