# TelegramSendPollOptions

The builder-like class that describes all optional parameters of the `Telegram` `sendPoll` method.
Source: https://core.telegram.org/bots/api#sendpoll

**Inheritance**

[TelegramSendMessageOptions](/types/Classes/TelegramSendMessageOptions.md)
&gt;
TelegramSendPollOptions

## Constructors

### `TelegramSendPollOptions()`

Creates a new instance of the poll options

---

## Properties

### `answers` → `List<String>`

The list of poll answers (options)

### `entities` → `List<TelegramMessageEntity>`

_Inherited_

The list of special entities that appear in a message text. E.g. hashtag, username, URL, etc.

---

## Methods

### `withThreadId(String threadId)`

Sets the forum channel thread id where the message has to be sent

#### Parameters

| Param      | Description                                                    |
| ---------- | -------------------------------------------------------------- |
| `threadId` | The `Telegram` unique id for the target message thread (topic) |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withAnswer(String answer)`

Adds an answer to the poll

#### Parameters

| Param    | Description            |
| -------- | ---------------------- |
| `answer` | The poll answer to add |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withAnswers(String answers)`

Adds the list of answers to the poll

#### Parameters

| Param     | Description                      |
| --------- | -------------------------------- |
| `answers` | The list of answers for the poll |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `asAnonymous()`

Makes the poll anonymous

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `asAnonymous(Boolean isAnonymous)`

Determines whether the poll should be anonymous or not

#### Parameters

| Param         | Description                                                               |
| ------------- | ------------------------------------------------------------------------- |
| `isAnonymous` | Determines whether the poll should be anonymous or not. Default is `true` |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `allowMultipleAnswers()`

Allows selecting multiple answers or not. Ignored for `quiz` polls

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `allowMultipleAnswers(Boolean allowMultiAnswers)`

Determines whether the poll should allow selecting multiple answers or not. Ignored for `quiz` polls

#### Parameters

| Param               | Description                                                                                    |
| ------------------- | ---------------------------------------------------------------------------------------------- |
| `allowMultiAnswers` | Determines whether the poll should allow selecting multiple answers or not. Default is `false` |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withoutNotification()`

Sends the message silently. The receiver will get a notification with no sound

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withProtectedContent()`

Protects the contents of the sent message from forwarding and saving

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `asReplyToMessage(String messageId)`

Sends the message as a reply to another message. If the target message was not found, will just send a message

#### Parameters

| Param       | Description                                       |
| ----------- | ------------------------------------------------- |
| `messageId` | The `Telegram` message id to which bot will reply |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `asQuiz(Integer correctOptionId, String explanation)`

Makes the poll to be a `quiz`

#### Parameters

| Param             | Description                                                                             |
| ----------------- | --------------------------------------------------------------------------------------- |
| `correctOptionId` | The id of the correct answer, starting from `0`                                         |
| `explanation`     | The text that is shown when a user chooses an incorrect answer or taps on the lamp icon |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withExplanationParseMode(String mode)`

Sets the explanation text parse mode. Needed when the text is formatted with HTML or Markdown markup

#### Parameters

| Param  | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| `mode` | The type of the formatting to use. Possible values: `HTML`, `Markdown`, `MarkdownV2` |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withExplanationMessageEntity(TelegramMessageEntity entity)`

Adds a special entity that appear in the explanation text. For example username tags

#### Parameters

| Param    | Description                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity` | The instance of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md), special message entity. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withExplanationMessageEntities(TelegramMessageEntity entities)`

Adds special entities that appear in the explanation text. For example username tags

#### Parameters

| Param      | Description                                                                                                                                         |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entities` | The list of [TelegramMessageEntity](/types/Classes/TelegramMessageEntity.md) instances, special message entities. E.g. hashtag, username, URL, etc. |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withOpenPeriod(Integer period)`

Specifies the amount of time the poll will be active after creation. Does not work when the `close date` is set

#### Parameters

| Param    | Description                                                      |
| -------- | ---------------------------------------------------------------- |
| `period` | The amount of time in seconds. Accepts values in range: `5..600` |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `withCloseDate(DateTime closeDate)`

Specifies the date after creation when poll should be closed. Does not work when the `open period` is set

#### Parameters

| Param       | Description                                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------------------------ |
| `closeDate` | The date in future when the poll should be closed. Should be at least `5` and no more than `600` seconds in future |

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

### `asClosed()`

Marks the poll immediately closed

#### Return

**Type**

TelegramSendPollOptions

**Description**

The current instance of the [TelegramSendPollOptions](/types/Classes/TelegramSendPollOptions.md) class

---
