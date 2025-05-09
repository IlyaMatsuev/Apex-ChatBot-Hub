# abstract BotContext

Represents the context with all necessary variables and entities for properly handling the incoming updates for bot

**Implemented types**

[IBotContext](/types/Classes/IBotContext.md)

## Methods

### `global BotModel getBot()`

Returns the bot model related to the received update

#### Returns

| Type       | Description                                                      |
| ---------- | ---------------------------------------------------------------- |
| `BotModel` | The instance of the [BotModel](/types/Classes/BotModel.md) class |

### `global IBotService getService(BotModel bot)`

Creates a bot service instance not related to the current context

#### Parameters

| Param | Description                                                                                           |
| ----- | ----------------------------------------------------------------------------------------------------- |
| `bot` | The [BotModel](/types/Classes/BotModel.md) instance related to the bot you need to create service for |

#### Returns

| Type          | Description                                                                   |
| ------------- | ----------------------------------------------------------------------------- |
| `IBotService` | The instance of the [IBotService](/types/Interfaces/IBotService.md) interface |

### `global void save(SObject record)`

Upserts a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param    | Description                   |
| -------- | ----------------------------- |
| `record` | SObject record to be upserted |

### `global void save(List<SObject> records)`

Upserts multiple records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `records` | List of records to be upserted |

### `global void save(List<SObject> records, String externalIdField)`

Upserts multiple records asynchronously by the provided external id field. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param             | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `records`         | List of records to be upserted                         |
| `externalIdField` | Field name of the external id for the provided objects |

---

## Classes

### NoReplyOptionException

Exception that is thrown when there is no possibility to reply to the user. For example, when the update was received from a non-chat event

**Inheritance**

NoReplyOptionException

---
