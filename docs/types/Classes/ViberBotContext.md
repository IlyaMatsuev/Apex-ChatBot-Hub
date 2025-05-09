# ViberBotContext

Represents the context with variables and methods for handling the incoming updates for `Viber` bots

**Inheritance**

[BotContext](/types/Classes/BotContext.md)
&gt;
ViberBotContext

## Methods

### `global ViberBotSenderService reply()`

Provides methods for replying on the received `Viber` update. E.g. send a message back

#### Returns

| Type                    | Description                                                                                    |
| ----------------------- | ---------------------------------------------------------------------------------------------- |
| `ViberBotSenderService` | The instance of the [ViberBotSenderService](/types/Classes/ViberBotSenderService.md) interface |

#### Throws

| Exception    | Description                                                                        |
| ------------ | ---------------------------------------------------------------------------------- |
| `BotContext` | .NoReplyOptionException When there is no chat payload in the received update event |

### `global ViberUpdateEvent getUpdateEvent()`

Returns a received `Viber` bot update event

#### Returns

| Type               | Description                                                                      |
| ------------------ | -------------------------------------------------------------------------------- |
| `ViberUpdateEvent` | The instance of the [ViberUpdateEvent](/types/Classes/ViberUpdateEvent.md) class |

### `global ViberBotService getService()`

Returns the instance of the `Viber` bot service

#### Returns

| Type              | Description                                                                    |
| ----------------- | ------------------------------------------------------------------------------ |
| `ViberBotService` | The instance of the [ViberBotService](/types/Classes/ViberBotService.md) class |

### `global BotModel getBot()`

_Inherited_

Returns the bot model related to the received update

#### Returns

| Type       | Description                                                      |
| ---------- | ---------------------------------------------------------------- |
| `BotModel` | The instance of the [BotModel](/types/Classes/BotModel.md) class |

### `global void save(SObject record)`

_Inherited_

Upserts a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param    | Description                   |
| -------- | ----------------------------- |
| `record` | SObject record to be upserted |

### `global void save(List<SObject> records)`

_Inherited_

Upserts multiple records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `records` | List of records to be upserted |

### `global void save(List<SObject> records, String externalIdField)`

_Inherited_

Upserts multiple records asynchronously by the provided external id field. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param             | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `records`         | List of records to be upserted                         |
| `externalIdField` | Field name of the external id for the provided objects |

---
