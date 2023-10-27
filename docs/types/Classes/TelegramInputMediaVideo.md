# TelegramInputMediaVideo

Describes the input video media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediavideo

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
[TelegramInputMedia](/types/Classes/TelegramInputMedia.md)
&gt;
TelegramInputMediaVideo

## Constructors

### `TelegramInputMediaVideo(String media)`

Creates a new instance of input video media with the provided URL or file id

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `media` | The `Telegram` file id or the URL to the video |

---

## Properties

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withThumbnail(String thumbnail)`

Sets the thumbnail for the video

#### Parameters

| Param       | Description               |
| ----------- | ------------------------- |
| `thumbnail` | The URL to the JPEG image |

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withCaption(String caption)`

Sets the caption for the video

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the video |

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withParseMode(String mode)`

Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withDuration(Integer duration)`

Sets the duration of the video

#### Parameters

| Param      | Description                          |
| ---------- | ------------------------------------ |
| `duration` | The duration of the video in seconds |

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withLayout(Integer width, Integer height)`

Sets the layout of the video by the provided width and height

#### Parameters

| Param    | Description             |
| -------- | ----------------------- |
| `width`  | The width of the video  |
| `height` | The height of the video |

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withStreamingSupport()`

Marks the video as suitable for streaming. Does not work for the `animation` message

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

### `withSpoiler()`

Marks the media that it has a spoiler

#### Return

**Type**

TelegramInputMediaVideo

**Description**

The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class

---
