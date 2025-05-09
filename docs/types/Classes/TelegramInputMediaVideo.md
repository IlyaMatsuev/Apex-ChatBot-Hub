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

### `global TelegramInputMediaVideo(String media)`

Creates a new instance of input video media with the provided URL or file id

#### Parameters

| Param   | Description                                    |
| ------- | ---------------------------------------------- |
| `media` | The `Telegram` file id or the URL to the video |

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramInputMediaVideo withThumbnail(String thumbnail)`

Sets the thumbnail for the video

#### Parameters

| Param       | Description               |
| ----------- | ------------------------- |
| `thumbnail` | The URL to the JPEG image |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withCaption(String caption)`

Sets the caption for the video

#### Parameters

| Param     | Description                     |
| --------- | ------------------------------- |
| `caption` | The text to attach to the video |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withParseMode(String mode)`

Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withDuration(Integer duration)`

Sets the duration of the video

#### Parameters

| Param      | Description                          |
| ---------- | ------------------------------------ |
| `duration` | The duration of the video in seconds |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withLayout(Integer width, Integer height)`

Sets the layout of the video by the provided width and height

#### Parameters

| Param    | Description             |
| -------- | ----------------------- |
| `width`  | The width of the video  |
| `height` | The height of the video |

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withStreamingSupport()`

Marks the video as suitable for streaming. Does not work for the `animation` message

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

### `global TelegramInputMediaVideo withSpoiler()`

Marks the media that it has a spoiler

#### Returns

| Type                      | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TelegramInputMediaVideo` | The current instance of the [TelegramInputMediaVideo](/types/Classes/TelegramInputMediaVideo.md) class |

---
