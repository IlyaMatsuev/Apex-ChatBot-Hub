# TelegramPollAnswerEvent

Describes the common payload properties for the `Telegram` bot poll answer events.
Source: https://core.telegram.org/bots/api#pollanswer

**Inheritance**

TelegramPollAnswerEvent

## Properties

### `optionIds` → `List<Integer>`

The 0-based identifiers of chosen answer options. May be empty if the vote was retracted

### `pollId` → `String`

The unique poll identifier

### `user` → `TelegramUser`

The user that changed the answer to the poll, if the voter isn't anonymous

### `voterChat` → `TelegramChat`

The chat that changed the answer to the poll, if the voter is anonymous

---
