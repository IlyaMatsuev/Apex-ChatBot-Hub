# BotServiceFactory

`APIVERSION: 55`

`STATUS: ACTIVE`

Factory for creating bot services

## Methods

### `createBotService(BotModel bot)`

Creates an instance of the [IBotService](/types/Interfaces/IBotService.md) implementation for the passed [BotModel](/types/Classes/BotModel.md) instance. For example a bot with the type `Telegram` should be related to [TelegramBotService](/types/Classes/TelegramBotService.md)

#### Parameters

| Param | Description                                                               |
| ----- | ------------------------------------------------------------------------- |
| `bot` | The [BotModel](/types/Classes/BotModel.md) instance to create service for |

#### Return

**Type**

IBotService

**Description**

The instance of [IBotService](/types/Interfaces/IBotService.md)

---
