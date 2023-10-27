# TelegramPoll

Describes the poll payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#poll

**Inheritance**

TelegramPoll

## Properties

### `allowsMultipleAnswers` → `Boolean`

`True` if the poll allows multiple answers

### `closeDate` → `DateTime`

The point in time when the poll will be automatically closed

### `correctOptionId` → `Integer`

The 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot

### `explanation` → `String`

The text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, `0-200` characters

### `explanationEntities` → `List<TelegramMessageEntity>`

The special entities like usernames, URLs, bot commands, etc. that appear in the explanation

### `id` → `String`

The unique poll identifier

### `isAnonymous` → `Boolean`

`True` if the poll is anonymous

### `isClosed` → `Boolean`

`True` if the poll is closed

### `openPeriod` → `Integer`

The amount of time in seconds the poll will be active after creation

### `options` → `List<Option>`

The list of poll options

### `question` → `String`

The poll question, `1-300` characters

### `totalVoterCount` → `Integer`

The total number of users that voted in the poll

### `type` → `String`

The poll type, currently can be `regular` or `quiz`

---

## Classes

### Option

Describes the information about one answer option in a poll.
Source: https://core.telegram.org/bots/api#polloption

**Inheritance**

Option

#### Properties

##### `text` → `String`

The option text, `1-100` characters

##### `voterCount` → `Integer`

The number of users that voted for this option

---

---
