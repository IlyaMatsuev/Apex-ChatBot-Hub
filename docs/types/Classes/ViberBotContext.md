# ViberBotContext

Represents the context with variables and methods for handling the incoming updates for `Viber` bots

**Inheritance**

[BotContext](/types/Classes/BotContext.md)
&gt;
ViberBotContext

## Methods

### `reply()`

Provides methods for replying on the received `Viber` update. E.g. send a message back

#### Return

**Type**

ViberBotSenderService

**Description**

The instance of the [ViberBotSenderService](/types/Classes/ViberBotSenderService.md) interface

#### Throws

| Exception    | Description                                                                        |
| ------------ | ---------------------------------------------------------------------------------- |
| `BotContext` | .NoReplyOptionException When there is no chat payload in the received update event |

### `getUpdateEvent()`

Returns a received `Viber` bot update event

#### Return

**Type**

ViberUpdateEvent

**Description**

The instance of the [ViberUpdateEvent](/types/Classes/ViberUpdateEvent.md) class

### `getService()`

Returns the instance of the `Viber` bot service

#### Return

**Type**

ViberBotService

**Description**

The instance of the [ViberBotService](/types/Classes/ViberBotService.md) class

### `getBot()`

_Inherited_

Returns the bot model related to the received update

#### Return

**Type**

BotModel

**Description**

The instance of the [BotModel](/types/Classes/BotModel.md) class

### `save(SObject record)`

_Inherited_

Upserts a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param    | Description                   |
| -------- | ----------------------------- |
| `record` | SObject record to be upserted |

### `save(List<SObject> records)`

_Inherited_

Upserts multiple records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `records` | List of records to be upserted |

### `save(List<SObject> records, String externalIdField)`

_Inherited_

Upserts multiple records asynchronously by the provided external id field. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param             | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `records`         | List of records to be upserted                         |
| `externalIdField` | Field name of the external id for the provided objects |

---
