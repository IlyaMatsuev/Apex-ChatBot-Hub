# ViberBotService

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

### `sendBroadcast(List<String> chatIds)`

Creates an instance of the `Viber` sender service that will send the message to multiple users at once. The method doesn't throw any errors if it failed to send a message to some of the receivers

#### Parameters

| Param     | Description                                               |
| --------- | --------------------------------------------------------- |
| `chatIds` | The list of chat ids where the information has to be sent |

#### Return

**Type**

ViberBotSenderService

**Description**

The `Viber` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md)

---
