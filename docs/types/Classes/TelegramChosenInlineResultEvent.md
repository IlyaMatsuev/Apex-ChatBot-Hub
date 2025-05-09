# TelegramChosenInlineResultEvent

Describes the common payload properties for the `Telegram` bot chosen inline result events.
Source: https://core.telegram.org/bots/api#choseninlineresult

**Inheritance**

TelegramChosenInlineResultEvent

## Properties

### `global resultId` → `String`

The unique identifier for the result that was chosen

### `global sender` → `TelegramUser`

The user that chose the result

### `global location` → `TelegramLocation`

The sender location, only for bots that require user location

### `global inlineMessageId` → `String`

The identifier of the sent inline message. Available only if there is an inline keyboard attached to the message

### `global query` → `String`

The query that was used to obtain the result

---
