# IBotContext

Describes the context methods that are common for all bot types

## Methods

### `getBot()`

Returns the bot model related to the received update

#### Return

**Type**

BotModel

**Description**

The instance of the [BotModel](/types/Classes/BotModel.md) class

### `reply()`

Provides methods for replying on the received update. E.g. send a message back

#### Return

**Type**

IBotSenderService

**Description**

The instance of the [IBotSenderService](/types/Interfaces/IBotSenderService.md) interface

### `getUpdateEvent()`

Returns a received update event

#### Return

**Type**

IBotUpdateEvent

**Description**

The instance of the [IBotUpdateEvent](/types/Classes/IBotUpdateEvent.md) interface

### `getService()`

Returns an instance of the [IBotService](/types/Interfaces/IBotService.md) for the current bot type

#### Return

**Type**

IBotService

**Description**

The instance of the [IBotService](/types/Interfaces/IBotService.md) interface

### `getService(BotModel bot)`

Creates a bot service instance not related to the current context

#### Parameters

| Param | Description                                                                                           |
| ----- | ----------------------------------------------------------------------------------------------------- |
| `bot` | The [BotModel](/types/Classes/BotModel.md) instance related to the bot you need to create service for |

#### Return

**Type**

IBotService

**Description**

The instance of the [IBotService](/types/Interfaces/IBotService.md) interface

### `save(SObject record)`

Upserts a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param    | Description                   |
| -------- | ----------------------------- |
| `record` | SObject record to be upserted |

### `save(List<SObject> records)`

Upserts multiple records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `records` | List of records to be upserted |

### `save(List<SObject> records, String externalIdField)`

Upserts multiple records asynchronously by the provided external id field. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param             | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `records`         | List of records to be upserted                         |
| `externalIdField` | Field name of the external id for the provided objects |

---
