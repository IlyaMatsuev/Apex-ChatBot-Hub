# BotModel

The `Bot__c` sObject model

## Constructors

### `BotModel(Bot__c entity)`

Create an instance of the model by the provided `Bot__c` record

#### Parameters

| Param    | Description                        |
| -------- | ---------------------------------- |
| `entity` | The source `Bot__c` sObject record |

---

## Properties

### `id` → `Id`

The `Bot__c` sObject `Id` field value

### `name` → `String`

The `Bot__c` sObject `Name` field value

### `type` → `BotType`

The instance of the [BotType](/types/Enums/BotType.md) enum based on `Bot__c.Type__c` field value

---

## Methods

### `toJson()`

Converts the `BotModel` instance to JSON string

#### Return

**Type**

String

**Description**

JSON serialized current instance

### `static fromJson(String jsonStr)`

Converts the JSON string back to the [BotModel](/types/Classes/BotModel.md) instance

#### Parameters

| Param     | Description                                                            |
| --------- | ---------------------------------------------------------------------- |
| `jsonStr` | The JSON string with serialized [BotModel](/types/Classes/BotModel.md) |

#### Return

**Type**

BotModel

**Description**

The new [BotModel](/types/Classes/BotModel.md) instance

---
