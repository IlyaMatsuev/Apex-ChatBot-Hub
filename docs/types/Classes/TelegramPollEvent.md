# TelegramPollEvent

Describes the common payload properties for the `Telegram` bot poll events.
Source: https://core.telegram.org/bots/api#poll

**Inheritance**

[TelegramPoll](/types/Classes/TelegramPoll.md)
&gt;
TelegramPollEvent

## Properties

### `global id` → `String`

_Inherited_

The unique poll identifier

### `global question` → `String`

_Inherited_

The poll question, `1-300` characters

### `global options` → `List<Option>`

_Inherited_

The list of poll options

### `global totalVoterCount` → `Integer`

_Inherited_

The total number of users that voted in the poll

### `global isClosed` → `Boolean`

_Inherited_

`True` if the poll is closed

### `global isAnonymous` → `Boolean`

_Inherited_

`True` if the poll is anonymous

### `global type` → `String`

_Inherited_

The poll type, currently can be `regular` or `quiz`

### `global allowsMultipleAnswers` → `Boolean`

_Inherited_

`True` if the poll allows multiple answers

### `global correctOptionId` → `Integer`

_Inherited_

The 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot

### `global explanation` → `String`

_Inherited_

The text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, `0-200` characters

### `global explanationEntities` → `List<TelegramMessageEntity>`

_Inherited_

The special entities like usernames, URLs, bot commands, etc. that appear in the explanation

### `global openPeriod` → `Integer`

_Inherited_

The amount of time in seconds the poll will be active after creation

### `global closeDate` → `DateTime`

_Inherited_

The point in time when the poll will be automatically closed

---
