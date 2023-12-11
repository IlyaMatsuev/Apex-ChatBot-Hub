# TelegramInlineQueryEvent

Describes the common payload properties for the `Telegram` bot inline query events.
Source: https://core.telegram.org/bots/api#inlinequery

**Inheritance**

TelegramInlineQueryEvent

## Properties

### `chatType` → `String`

The type of the chat from which the inline query was sent. Can be either `sender` for a private chat with the inline query sender, `private`, `group`, `supergroup`, or `channel`

### `id` → `String`

The unique identifier for this query

### `location` → `TelegramLocation`

The sender location, only for bots that request user location

### `offset` → `String`

The offset of the results to be returned, can be controlled by the bot

### `query` → `String`

The text of the query (up to `256` characters)

### `sender` → `TelegramUser`

The sender of the inline query

---
