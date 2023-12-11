# TelegramAnswerInlineQueryOptions

Represents the optional parameters for inline mode `answer` method.
Source: https://core.telegram.org/bots/api#inlinequeryresult

**Inheritance**

TelegramAnswerInlineQueryOptions

## Constructors

### `TelegramAnswerInlineQueryOptions()`

Creates an instance of the answer inline query options without any results, so that they can be added separately

### `TelegramAnswerInlineQueryOptions(TelegramInlineQueryResult results)`

Creates an instance of the answer inline query options with the provided results

#### Parameters

| Param     | Description                                 |
| --------- | ------------------------------------------- |
| `results` | The list of results to be shown to the user |

---

## Properties

### `results` → `List<TelegramInlineQueryResult>`

The list of results to be shown to the user for the inline query

---

## Methods

### `addResult(TelegramInlineQueryResult result)`

Adds a result to the inline query answer

#### Parameters

| Param    | Description                                                                                                                   |
| -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `result` | The inline query result entry, instance of the [TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md) class |

#### Return

**Type**

TelegramAnswerInlineQueryOptions

**Description**

The current instance of the [TelegramAnswerInlineQueryOptions](/types/Classes/TelegramAnswerInlineQueryOptions.md) class

### `addResults(TelegramInlineQueryResult results)`

Adds multiple results to the inline query answer

#### Parameters

| Param     | Description                                                                                                                       |
| --------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `results` | The list of inline query results, instances of the [TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md) class |

#### Return

**Type**

TelegramAnswerInlineQueryOptions

**Description**

The current instance of the [TelegramAnswerInlineQueryOptions](/types/Classes/TelegramAnswerInlineQueryOptions.md) class

### `withCacheTime(Integer seconds)`

Sets the maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to `300`

#### Parameters

| Param     | Description                                                                                           |
| --------- | ----------------------------------------------------------------------------------------------------- |
| `seconds` | The maximum amount of time in seconds that the result of the inline query may be cached on the server |

#### Return

**Type**

TelegramAnswerInlineQueryOptions

**Description**

The current instance of the [TelegramAnswerInlineQueryOptions](/types/Classes/TelegramAnswerInlineQueryOptions.md) class

### `asPersonal()`

Sets if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query

#### Return

**Type**

TelegramAnswerInlineQueryOptions

**Description**

The current instance of the [TelegramAnswerInlineQueryOptions](/types/Classes/TelegramAnswerInlineQueryOptions.md) class

### `withNextOffset(String offset)`

Sets the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don't support pagination

#### Parameters

| Param    | Description                                                                                                                              |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `offset` | the offset that a client should send in the next query with the same text to receive more results. Offset length can't exceed `64 bytes` |

#### Return

**Type**

TelegramAnswerInlineQueryOptions

**Description**

The current instance of the [TelegramAnswerInlineQueryOptions](/types/Classes/TelegramAnswerInlineQueryOptions.md) class

### `withButton(TelegramAnswerInlineQueryOptions button)`

Sets the button to be shown above inline query results

#### Parameters

| Param    | Description                                                                                                                                                     |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `button` | The button to be shown above inline query results. The instance of the [TelegramAnswerInlineQueryOptions.Button](TelegramAnswerInlineQueryOptions.Button) class |

#### Return

**Type**

TelegramAnswerInlineQueryOptions

**Description**

The current instance of the [TelegramAnswerInlineQueryOptions](/types/Classes/TelegramAnswerInlineQueryOptions.md) class

---

## Classes

### Button

The builder-like class representing a button in the `Telegram` inline mode results.
Source: https://core.telegram.org/bots/api#inlinequeryresultsbutton

**Inheritance**

Button

#### Constructors

##### `Button(String text)`

Creates a new instance of the inline mode results button with the provided label

###### Parameters

| Param  | Description           |
| ------ | --------------------- |
| `text` | The button label text |

---

#### Methods

##### `withStartParameter(String parameter)`

###### Parameters

| Param       | Description |
| ----------- | ----------- |
| `parameter` | wqd         |

###### Return

**Type**

Button

**Description**

The current instance of the [TelegramAnswerInlineQueryOptions.Button](TelegramAnswerInlineQueryOptions.Button) class

---

---
