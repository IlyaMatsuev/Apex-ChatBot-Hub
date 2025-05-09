# IBotContext

Describes the context methods that are common for all bot types

## Methods

### `global BotModel getBot()`

Returns the bot model related to the received update

#### Returns

| Type       | Description                                                      |
| ---------- | ---------------------------------------------------------------- |
| `BotModel` | The instance of the [BotModel](/types/Classes/BotModel.md) class |

### `global IBotSenderService reply()`

Provides methods for replying on the received update. E.g. send a message back

#### Returns

| Type                | Description                                                                               |
| ------------------- | ----------------------------------------------------------------------------------------- |
| `IBotSenderService` | The instance of the [IBotSenderService](/types/Interfaces/IBotSenderService.md) interface |

### `global IBotUpdateEvent getUpdateEvent()`

Returns a received update event

#### Returns

| Type              | Description                                                                        |
| ----------------- | ---------------------------------------------------------------------------------- |
| `IBotUpdateEvent` | The instance of the [IBotUpdateEvent](/types/Classes/IBotUpdateEvent.md) interface |

### `global IBotService getService()`

Returns an instance of the [IBotService](/types/Interfaces/IBotService.md) for the current bot type

#### Returns

| Type          | Description                                                                   |
| ------------- | ----------------------------------------------------------------------------- |
| `IBotService` | The instance of the [IBotService](/types/Interfaces/IBotService.md) interface |

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
