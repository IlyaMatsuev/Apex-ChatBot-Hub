# TelegramEditTextOptions

The builder-like class that describes all optional parameters of the `Telegram` `editMessageText` method.
Source: https://core.telegram.org/bots/api#editmessagetext

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramEditTextOptions

## Properties

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withParseMode(String mode)`

Sets the new message text parse mode. Needed when the message text is formatted with `HTML` or `Markdown` markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramEditTextOptions

**Description**

The current instance of the [TelegramEditTextOptions](/types/Classes/TelegramEditTextOptions.md) class

### `withMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the message text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramEditTextOptions

**Description**

The current instance of the [TelegramEditTextOptions](/types/Classes/TelegramEditTextOptions.md) class

### `withMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the message text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramEditTextOptions

**Description**

The current instance of the [TelegramEditTextOptions](/types/Classes/TelegramEditTextOptions.md) class

### `withoutLinksPreview()`

Disables link previews for links in this message

#### Return

**Type**

TelegramEditTextOptions

**Description**

The current instance of the [TelegramEditTextOptions](/types/Classes/TelegramEditTextOptions.md) class

---
