# BotServiceFactory

`APIVERSION: 55`

`STATUS: ACTIVE`

Factory for creating bot services

## Methods

### `createBotService(Bot__c bot)`

Creates an instance of the [IBotService](/types/Interfaces/IBotService.md) implementation for the passed `Bot__c` record. For example a bot with the type `Telegram` should be related to [TelegramBotService](/types/Classes/TelegramBotService.md)

#### Parameters

| Param | Description                                        |
| ----- | -------------------------------------------------- |
| `bot` | The `Bot__c` record to create service instance for |

#### Return

**Type**

IBotService

**Description**

The instance of [IBotService](/types/Interfaces/IBotService.md)

---
