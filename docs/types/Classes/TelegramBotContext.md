# TelegramBotContext

Represents the context with variables and methods for handling the incoming updates for `Telegram` bots

**Inheritance**

[BotContext](/types/Classes/BotContext.md)
&gt;
TelegramBotContext

## Methods

### `global TelegramBotSenderService reply()`

Provides methods for replying on the received `Telegram` update. E.g. send a message back

#### Returns

| Type                       | Description                                                                                          |
| -------------------------- | ---------------------------------------------------------------------------------------------------- |
| `TelegramBotSenderService` | The instance of the [TelegramBotSenderService](/types/Classes/TelegramBotSenderService.md) interface |

#### Throws

| Exception    | Description                                                                        |
| ------------ | ---------------------------------------------------------------------------------- |
| `BotContext` | .NoReplyOptionException When there is no chat payload in the received update event |

### `global TelegramUpdateEvent getUpdateEvent()`

Returns a received `Telegram` bot update event

#### Returns

| Type                  | Description                                                                            |
| --------------------- | -------------------------------------------------------------------------------------- |
| `TelegramUpdateEvent` | The instance of the [TelegramUpdateEvent](/types/Classes/TelegramUpdateEvent.md) class |

### `global TelegramBotService getService()`

Returns the instance of the `Telegram` bot service

#### Returns

| Type                 | Description                                                                          |
| -------------------- | ------------------------------------------------------------------------------------ |
| `TelegramBotService` | The instance of the [TelegramBotService](/types/Classes/TelegramBotService.md) class |

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
