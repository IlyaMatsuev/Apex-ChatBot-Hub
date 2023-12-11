# TelegramInputMediaAudio

Describes the input audio media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediaaudio

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
[TelegramInputMedia](/types/Classes/TelegramInputMedia.md)
&gt;
TelegramInputMediaAudio

## Constructors

### `TelegramInputMediaAudio(String media)`

Creates a new instance of input audio media with the provided URL or file id

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `media` | The `Telegram` file id or the URL to the audio |

---

## Properties

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withThumbnail(String thumbnail)`

Sets the thumbnail for the audio

#### Parameters

| Param       | Description               |
| ----------- | ------------------------- |
| `thumbnail` | The URL to the JPEG image |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

### `withCaption(String caption)`

Sets the caption for the audio

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the audio |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

### `withParseMode(String mode)`

Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message caption. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message caption. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

### `withDuration(Integer duration)`

Sets the duration of the audio

#### Parameters

| Param      | Description                          |
| ---------- | ------------------------------------ |
| `duration` | The duration of the audio in seconds |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

### `withTitle(String title)`

Sets the title of the audio

#### Parameters

| Param   | Description            |
| ------- | ---------------------- |
| `title` | The title of the audio |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

### `withPerformer(String performer)`

Sets the performer of the audio

#### Parameters

| Param       | Description                |
| ----------- | -------------------------- |
| `performer` | The performer of the audio |

#### Return

**Type**

TelegramInputMediaAudio

**Description**

The current instance of the [TelegramInputMediaAudio](/types/Classes/TelegramInputMediaAudio.md) class

---
