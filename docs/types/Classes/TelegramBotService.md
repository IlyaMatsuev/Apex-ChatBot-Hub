# TelegramBotService

The concrete service for the `Telegram` messanger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Telegram` only

**Inheritance**

[BotService](/types/Classes/BotService.md)
&gt;
TelegramBotService

## Methods

### `send(String chatId)`

Creates an instance of the `Telegram` sender service

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `chatId` | The id of the chat where the information has to be sent |

#### Return

**Type**

TelegramBotSenderService

**Description**

The `Telegram` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md)

---
