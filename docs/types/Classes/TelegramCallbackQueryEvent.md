# TelegramCallbackQueryEvent

Describes the common payload properties for the `Telegram` bot callback query events.
Source: https://core.telegram.org/bots/api#callbackquery

**Inheritance**

TelegramCallbackQueryEvent

## Properties

### `global id` → `String`

The unique identifier for this query

### `global sender` → `TelegramUser`

The sender

### `global message` → `TelegramMessage`

The message with the callback button that originated the query

### `global inlineMessageId` → `String`

The identifier of the message sent via the bot in inline mode, that originated the query

### `global chatInstance` → `String`

The global identifier, uniquely corresponding to the chat to which the message with the callback button was sent

### `global data` → `String`

The data associated with the callback button

---
