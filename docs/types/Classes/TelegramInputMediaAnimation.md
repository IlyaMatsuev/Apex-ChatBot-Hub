# TelegramInputMediaAnimation

Describes the input animation media payload that can be attached as part of `send` or `edit` `Telegram` bot methods.
Source: https://core.telegram.org/bots/api#inputmediaanimation

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
[TelegramInputMedia](/types/Classes/TelegramInputMedia.md)
&gt;
TelegramInputMediaAnimation

## Constructors

### `global TelegramInputMediaAnimation(String media)`

Creates a new instance of input animation media with the provided URL or file id

#### Parameters

| Param   | Description                                        |
| ------- | -------------------------------------------------- |
| `media` | The `Telegram` file id or the URL to the animation |

---

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramInputMediaAnimation withThumbnail(String thumbnail)`

Sets the thumbnail for the animation

#### Parameters

| Param       | Description               |
| ----------- | ------------------------- |
| `thumbnail` | The URL to the JPEG image |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

### `global TelegramInputMediaAnimation withCaption(String caption)`

Sets the caption for the animation

#### Parameters

| Param     | Description                         |
| --------- | ----------------------------------- |
| `caption` | The text to attach to the animation |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

### `global TelegramInputMediaAnimation withParseMode(String mode)`

Sets the message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

### `global TelegramInputMediaAnimation withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message caption. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

### `global TelegramInputMediaAnimation withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message caption. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

### `global TelegramInputMediaAnimation withDuration(Integer duration)`

Sets the duration of the animation

#### Parameters

| Param      | Description                              |
| ---------- | ---------------------------------------- |
| `duration` | The duration of the animation in seconds |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

### `global TelegramInputMediaAnimation withLayout(Integer width, Integer height)`

Sets the layout of the animation by the provided width and height

#### Parameters

| Param    | Description                 |
| -------- | --------------------------- |
| `width`  | The width of the animation  |
| `height` | The height of the animation |

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

### `global TelegramInputMediaAnimation withSpoiler()`

Marks the media that it has a spoiler

#### Returns

| Type                          | Description                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramInputMediaAnimation` | The current instance of the [TelegramInputMediaAnimation](/types/Classes/TelegramInputMediaAnimation.md) class |

---
