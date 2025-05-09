# TelegramEditCaptionOptions

The builder-like class that describes all optional parameters of the `Telegram` `editMessageCaption` method.
Source: https://core.telegram.org/bots/api#editmessagecaption

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramEditCaptionOptions

## Properties

### `global entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `global TelegramEditCaptionOptions withParseMode(String mode)`

Sets the new message caption parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramEditCaptionOptions` | The current instance of the [TelegramEditCaptionOptions](/types/Classes/TelegramEditCaptionOptions.md) class |

### `global TelegramEditCaptionOptions withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramEditCaptionOptions` | The current instance of the [TelegramEditCaptionOptions](/types/Classes/TelegramEditCaptionOptions.md) class |

### `global TelegramEditCaptionOptions withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Returns

| Type                         | Description                                                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `TelegramEditCaptionOptions` | The current instance of the [TelegramEditCaptionOptions](/types/Classes/TelegramEditCaptionOptions.md) class |

---
