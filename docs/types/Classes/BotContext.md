# BotContext

`APIVERSION: 55`

`STATUS: ACTIVE`

Represents the context with all necessary variables and entities for properly handling the incoming updates for bot webhooks

## Fields

### `bot` → `Bot__c`

The `Bot__c` record associated with the current webhook update

### `received` → `BotUpdateModel`

The model instance containing all incoming related to the incoming update (new message, edited message, etc.)

### `service` → `IBotService`

The generic bot service instance with the methods common for all bots

---

## Properties

### `reply` → `IBotSenderService`

The object with the most common methods for quick reply to the incoming updates

---

## Methods

### `getService(Bot__c bot)`

Create BotService not related to the current context

#### Parameters

| Param | Description                                              |
| ----- | -------------------------------------------------------- |
| `bot` | SObject record of the bot you need to create service for |

### `save(SObject record)`

Upsert a record asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param    | Description                   |
| -------- | ----------------------------- |
| `record` | SObject record to be upserted |

### `save(List<SObject> records)`

Upsert records asynchronously. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param     | Description                    |
| --------- | ------------------------------ |
| `records` | List of records to be upserted |

### `save(List<SObject> records, String externalIdField)`

Upsert records asynchronously by the provided external id field. This method is needed to avoid the "Uncommited work pending" exception during the bot handler execution

#### Parameters

| Param             | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `records`         | List of records to be upserted                         |
| `externalIdField` | Field name of the external id for the provided objects |

---
