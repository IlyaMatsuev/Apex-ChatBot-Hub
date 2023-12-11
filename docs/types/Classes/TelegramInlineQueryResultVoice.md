# TelegramInlineQueryResultVoice

Describes the voice result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultvoice

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultVoice

## Constructors

### `TelegramInlineQueryResultVoice(String id, String voiceUrlOrFileId)`

Creates a new instance of the voice inline query result with the provided result id and voice URL/file id

#### Parameters

| Param              | Description                                        |
| ------------------ | -------------------------------------------------- |
| `id`               | The unique identifier for the result, `1-64 bytes` |
| `voiceUrlOrFileId` | The valid voice URL or `Telegram` file id          |

---

## Properties

### `captionEntities` → `List<TelegramMessageEntity>`

The list of special entities that appear in the caption text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withCaption(String caption)`

Sets the caption for the voice to be sent

#### Parameters

| Param     | Description                            |
| --------- | -------------------------------------- |
| `caption` | The voice caption, `0-1024 characters` |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

### `withTitle(String title)`

Sets the title for the inline result

#### Parameters

| Param   | Description             |
| ------- | ----------------------- |
| `title` | The title of the result |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

### `withDuration(Integer duration)`

Sets the voice duration

#### Parameters

| Param      | Description        |
| ---------- | ------------------ |
| `duration` | The voice duration |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

### `withParseMode(String mode)`

Sets the caption text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the caption text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the caption text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

### `withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

### `withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the voice

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Return

**Type**

TelegramInlineQueryResultVoice

**Description**

The current instance of the [TelegramInlineQueryResultVoice](/types/Classes/TelegramInlineQueryResultVoice.md) class

---
