# BotModel

The `Bot__c` sObject model

## Constructors

### `global BotModel(Bot__c entity)`

Create an instance of the model by the provided `Bot__c` record

#### Parameters

| Param    | Description                        |
| -------- | ---------------------------------- |
| `entity` | The source `Bot__c` sObject record |

---

## Properties

### `global id` → `Id`

The `Bot__c` sObject `Id` field value

### `global name` → `String`

The `Bot__c` sObject `Name` field value

### `global type` → `BotType`

The instance of the [BotType](/types/Enums/BotType.md) enum based on `Bot__c.Type__c` field value

---

## Methods

### `global String toJson()`

Converts the `BotModel` instance to JSON string

#### Returns

| Type     | Description                      |
| -------- | -------------------------------- |
| `String` | JSON serialized current instance |

### `global static BotModel fromJson(String jsonStr)`

Converts the JSON string back to the [BotModel](/types/Classes/BotModel.md) instance

#### Parameters

| Param     | Description                                                            |
| --------- | ---------------------------------------------------------------------- |
| `jsonStr` | The JSON string with serialized [BotModel](/types/Classes/BotModel.md) |

#### Returns

| Type       | Description                                             |
| ---------- | ------------------------------------------------------- |
| `BotModel` | The new [BotModel](/types/Classes/BotModel.md) instance |

---
