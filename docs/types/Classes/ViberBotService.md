# ViberBotService

`APIVERSION: 55`

`STATUS: ACTIVE`

The concrete service for the `Viber` messanger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Viber` only

**Inheritance**

[BotService](/types/Classes/BotService.md)
&gt;
ViberBotService

## Methods

### `send(String chatId)`

Creates an instance of the `Viber` sender service

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `chatId` | The id of the chat where the information has to be sent |

#### Return

**Type**

ViberBotSenderService

**Description**

The `Viber` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md)

---
