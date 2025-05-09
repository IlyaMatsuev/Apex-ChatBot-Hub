# virtual TelegramPoll

Describes the poll payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#poll

**Inheritance**

TelegramPoll

## Properties

### `global id` → `String`

The unique poll identifier

### `global question` → `String`

The poll question, `1-300` characters

### `global options` → `List<Option>`

The list of poll options

### `global totalVoterCount` → `Integer`

The total number of users that voted in the poll

### `global isClosed` → `Boolean`

`True` if the poll is closed

### `global isAnonymous` → `Boolean`

`True` if the poll is anonymous

### `global type` → `String`

The poll type, currently can be `regular` or `quiz`

### `global allowsMultipleAnswers` → `Boolean`

`True` if the poll allows multiple answers

### `global correctOptionId` → `Integer`

The 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot

### `global explanation` → `String`

The text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, `0-200` characters

### `global explanationEntities` → `List<TelegramMessageEntity>`

The special entities like usernames, URLs, bot commands, etc. that appear in the explanation

### `global openPeriod` → `Integer`

The amount of time in seconds the poll will be active after creation

### `global closeDate` → `DateTime`

The point in time when the poll will be automatically closed

---

## Classes

### Option

Describes the information about one answer option in a poll.
Source: https://core.telegram.org/bots/api#polloption

**Inheritance**

Option

#### Properties

##### `global text` → `String`

The option text, `1-100` characters

##### `global voterCount` → `Integer`

The number of users that voted for this option

---

---
