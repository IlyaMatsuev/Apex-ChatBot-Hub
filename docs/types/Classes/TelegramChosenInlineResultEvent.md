# TelegramChosenInlineResultEvent

Describes the common payload properties for the `Telegram` bot chosen inline result events.
Source: https://core.telegram.org/bots/api#choseninlineresult

**Inheritance**

TelegramChosenInlineResultEvent

## Properties

### `inlineMessageId` → `String`

The identifier of the sent inline message. Available only if there is an inline keyboard attached to the message

### `location` → `TelegramLocation`

The sender location, only for bots that require user location

### `query` → `String`

The query that was used to obtain the result

### `resultId` → `String`

The unique identifier for the result that was chosen

### `sender` → `TelegramUser`

The user that chose the result

---
