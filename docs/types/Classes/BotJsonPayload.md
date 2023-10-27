# BotJsonPayload

Provides a convenient interface on top of the JSON payload via such methods as `getString()`, `getInteger()`, `toJson()`, etc.

## Constructors

### `BotJsonPayload()`

Creates a new instance of JSON payload without any values

### `BotJsonPayload(BotJsonPayload payload)`

Creates a new instance of JSON payload by the provided values from another instance

#### Parameters

| Param     | Description                                                                                |
| --------- | ------------------------------------------------------------------------------------------ |
| `payload` | Another instance of [BotJsonPayload](/types/Classes/BotJsonPayload.md) to copy values from |

### `BotJsonPayload(Map<String,Object> values)`

Creates a new instance of JSON payload by the provided values from a `Map` instance

#### Parameters

| Param    | Description                            |
| -------- | -------------------------------------- |
| `values` | The `Map` instance to copy values from |

---

## Methods

### `static fromJson(String jsonValues)`

Creates a new instance of JSON payload by the provided JSON string

#### Parameters

| Param        | Description                |
| ------------ | -------------------------- |
| `jsonValues` | The JSON string to convert |

#### Return

**Type**

BotJsonPayload

**Description**

The new instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class

### `static fromJson(String jsonValues, Type payloadType)`

Creates a new specific instance of JSON payload by the provided JSON string and instance type

#### Parameters

| Param         | Description                         |
| ------------- | ----------------------------------- |
| `jsonValues`  | The JSON string to convert          |
| `payloadType` | The type to convert the instance to |

#### Return

**Type**

BotJsonPayload

**Description**

The new instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class

### `toJson()`

Serializes the instance to a JSON string

#### Return

**Type**

String

**Description**

The JSON string

### `toJson(Boolean pretty)`

Serializes the instance to a (non-)prettified JSON string

#### Parameters

| Param    | Description                                               |
| -------- | --------------------------------------------------------- |
| `pretty` | Determines if the output JSON should be prettified or not |

#### Return

**Type**

String

**Description**

The JSON string

### `getValues()`

Returns all values from the JSON as a `Map` instance

#### Return

**Type**

Map&lt;String,Object&gt;

**Description**

The `Map&lt;String, Object&gt;` instance

### `has(String key)`

Checks if the current JSON payload has a value by the provided key

#### Parameters

| Param | Description          |
| ----- | -------------------- |
| `key` | The key of the value |

#### Return

**Type**

Boolean

**Description**

`true` if the provided key exists in the JSON. Otherwise `false`

### `hasValue(String key)`

Checks if the current JSON payload has a non-null value by the provided key

#### Parameters

| Param | Description          |
| ----- | -------------------- |
| `key` | The key of the value |

#### Return

**Type**

Boolean

**Description**

`true` if the provided key exists in the JSON and it is not `null`. Otherwise `false`

### `getString(String key)`

Returns a value from the JSON by the provided key, converting it to `String`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

String

**Description**

The `String` value from the JSON

### `getString(String key, String defaultValue)`

Returns a value from the JSON by the provided key, converting it to `String`. Returns default if the JSON value is `null` or does not exist

#### Parameters

| Param          | Description                                                               |
| -------------- | ------------------------------------------------------------------------- |
| `key`          | The JSON value key                                                        |
| `defaultValue` | The default value to return if the JSON value is `null` or does not exist |

#### Return

**Type**

String

**Description**

The `String` value from the JSON or default value

### `getStringList(String key)`

Returns a value from the JSON by the provided key, converting it to `List&lt;String&gt;`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

List&lt;String&gt;

**Description**

The `List&lt;String&gt;` value from the JSON

### `getInteger(String key)`

Returns a value from the JSON by the provided key, converting it to `Integer`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

Integer

**Description**

The `Integer` value from the JSON

### `getIntegerList(String key)`

Returns a value from the JSON by the provided key, converting it to `List&lt;Integer&gt;`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

List&lt;Integer&gt;

**Description**

The `List&lt;Integer&gt;` value from the JSON

### `getLong(String key)`

Returns a value from the JSON by the provided key, converting it to `Long`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

Long

**Description**

The `Long` value from the JSON

### `getDecimal(String key)`

Returns a value from the JSON by the provided key, converting it to `Decimal`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

Decimal

**Description**

The `Decimal` value from the JSON

### `getBoolean(String key)`

Returns a value from the JSON by the provided key, converting it to `Boolean`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

Boolean

**Description**

The `Boolean` value from the JSON

### `getDateTime(String key)`

Returns a value from the JSON by the provided key, converting it to `DateTime`. Will automatically convert the value to `DateTime` if the target value is timestamp

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

DateTime

**Description**

The `DateTime` value from the JSON

### `getJsonPayload(String key)`

Returns a value from the JSON by the provided key, converting it to an instance of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

BotJsonPayload

**Description**

The [BotJsonPayload](/types/Classes/BotJsonPayload.md) instance

### `getJsonPayload(String key, Type payloadType)`

Returns a value from the JSON by the provided key, converting it to a specific instance of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param         | Description                          |
| ------------- | ------------------------------------ |
| `key`         | The JSON value key                   |
| `payloadType` | The Apex type of the result instance |

#### Return

**Type**

BotJsonPayload

**Description**

The [BotJsonPayload](/types/Classes/BotJsonPayload.md) instance

### `getJsonPayloadList(String key)`

Returns a value from the JSON by the provided key, converting it to a `List` of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

List&lt;BotJsonPayload&gt;

**Description**

The [BotJsonPayload](/types/Classes/BotJsonPayload.md) `List` instance

### `get(String key)`

Returns a value from the JSON by the provided key

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Return

**Type**

Object

**Description**

The value from the JSON

### `set(String key, Object value)`

Sets a new value to the JSON payload

#### Parameters

| Param   | Description              |
| ------- | ------------------------ |
| `key`   | The key of the new value |
| `value` | The value                |

#### Return

**Type**

BotJsonPayload

**Description**

The current instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class

### `set(String key, Object value, Boolean skipNull)`

Sets a new value to the JSON payload, if the provided value not `null`

#### Parameters

| Param      | Description                                                         |
| ---------- | ------------------------------------------------------------------- |
| `key`      | The key of the new value                                            |
| `value`    | The value                                                           |
| `skipNull` | Determines if the setting value should be skipped in case of `null` |

#### Return

**Type**

BotJsonPayload

**Description**

The current instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class

---
