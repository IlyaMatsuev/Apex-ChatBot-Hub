# virtual BotJsonPayload

Provides a convenient interface on top of the JSON payload via such methods as `getString()`, `getInteger()`, `toJson()`, etc.

## Constructors

### `global BotJsonPayload()`

Creates a new instance of JSON payload without any values

### `global BotJsonPayload(BotJsonPayload payload)`

Creates a new instance of JSON payload by the provided values from another instance

#### Parameters

| Param     | Description                                                                                |
| --------- | ------------------------------------------------------------------------------------------ |
| `payload` | Another instance of [BotJsonPayload](/types/Classes/BotJsonPayload.md) to copy values from |

### `global BotJsonPayload(Map<String,Object> values)`

Creates a new instance of JSON payload by the provided values from a `Map` instance

#### Parameters

| Param    | Description                            |
| -------- | -------------------------------------- |
| `values` | The `Map` instance to copy values from |

---

## Methods

### `global static BotJsonPayload fromJson(String jsonValues)`

Creates a new instance of JSON payload by the provided JSON string

#### Parameters

| Param        | Description                |
| ------------ | -------------------------- |
| `jsonValues` | The JSON string to convert |

#### Returns

| Type             | Description                                                                      |
| ---------------- | -------------------------------------------------------------------------------- |
| `BotJsonPayload` | The new instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

### `global static BotJsonPayload fromJson(String jsonValues, Type payloadType)`

Creates a new specific instance of JSON payload by the provided JSON string and instance type

#### Parameters

| Param         | Description                         |
| ------------- | ----------------------------------- |
| `jsonValues`  | The JSON string to convert          |
| `payloadType` | The type to convert the instance to |

#### Returns

| Type             | Description                                                                      |
| ---------------- | -------------------------------------------------------------------------------- |
| `BotJsonPayload` | The new instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

### `global static BotJsonPayload fromPayload(BotJsonPayload payload, Type payloadType)`

Creates a new specific instance of payload from another payload and instance type

#### Parameters

| Param         | Description                         |
| ------------- | ----------------------------------- |
| `payload`     | The JSON payload to copy            |
| `payloadType` | The type to convert the instance to |

#### Returns

| Type             | Description                                                                      |
| ---------------- | -------------------------------------------------------------------------------- |
| `BotJsonPayload` | The new instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

### `global String toJson()`

Serializes the instance to a JSON string

#### Returns

| Type     | Description     |
| -------- | --------------- |
| `String` | The JSON string |

### `global String toJson(Boolean pretty)`

Serializes the instance to a (non-)prettified JSON string

#### Parameters

| Param    | Description                                               |
| -------- | --------------------------------------------------------- |
| `pretty` | Determines if the output JSON should be prettified or not |

#### Returns

| Type     | Description     |
| -------- | --------------- |
| `String` | The JSON string |

### `global Map<String,Object> getValues()`

Returns all values from the JSON as a `Map` instance

#### Returns

| Type                 | Description                        |
| -------------------- | ---------------------------------- |
| `Map<String,Object>` | The `Map<String, Object>` instance |

### `global Boolean has(String key)`

Checks if the current JSON payload has a value by the provided key

#### Parameters

| Param | Description          |
| ----- | -------------------- |
| `key` | The key of the value |

#### Returns

| Type      | Description                                                      |
| --------- | ---------------------------------------------------------------- |
| `Boolean` | `true` if the provided key exists in the JSON. Otherwise `false` |

### `global Boolean hasValue(String key)`

Checks if the current JSON payload has a non-null value by the provided key

#### Parameters

| Param | Description          |
| ----- | -------------------- |
| `key` | The key of the value |

#### Returns

| Type      | Description                                                                           |
| --------- | ------------------------------------------------------------------------------------- |
| `Boolean` | `true` if the provided key exists in the JSON and it is not `null`. Otherwise `false` |

### `global String getString(String key)`

Returns a value from the JSON by the provided key, converting it to `String`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type     | Description                      |
| -------- | -------------------------------- |
| `String` | The `String` value from the JSON |

### `global String getString(String key, String defaultValue)`

Returns a value from the JSON by the provided key, converting it to `String`. Returns default if the JSON value is `null` or does not exist

#### Parameters

| Param          | Description                                                               |
| -------------- | ------------------------------------------------------------------------- |
| `key`          | The JSON value key                                                        |
| `defaultValue` | The default value to return if the JSON value is `null` or does not exist |

#### Returns

| Type     | Description                                       |
| -------- | ------------------------------------------------- |
| `String` | The `String` value from the JSON or default value |

### `global List<String> getStringList(String key)`

Returns a value from the JSON by the provided key, converting it to `List&lt;String&gt;`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type           | Description                            |
| -------------- | -------------------------------------- |
| `List<String>` | The `List<String>` value from the JSON |

### `global Integer getInteger(String key)`

Returns a value from the JSON by the provided key, converting it to `Integer`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type      | Description                       |
| --------- | --------------------------------- |
| `Integer` | The `Integer` value from the JSON |

### `global List<Integer> getIntegerList(String key)`

Returns a value from the JSON by the provided key, converting it to `List&lt;Integer&gt;`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type            | Description                             |
| --------------- | --------------------------------------- |
| `List<Integer>` | The `List<Integer>` value from the JSON |

### `global Long getLong(String key)`

Returns a value from the JSON by the provided key, converting it to `Long`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type   | Description                    |
| ------ | ------------------------------ |
| `Long` | The `Long` value from the JSON |

### `global Decimal getDecimal(String key)`

Returns a value from the JSON by the provided key, converting it to `Decimal`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type      | Description                       |
| --------- | --------------------------------- |
| `Decimal` | The `Decimal` value from the JSON |

### `global Boolean getBoolean(String key)`

Returns a value from the JSON by the provided key, converting it to `Boolean`

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type      | Description                       |
| --------- | --------------------------------- |
| `Boolean` | The `Boolean` value from the JSON |

### `global DateTime getDateTime(String key)`

Returns a value from the JSON by the provided key, converting it to `DateTime`. Will automatically convert the value to `DateTime` if the target value is timestamp

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type       | Description                        |
| ---------- | ---------------------------------- |
| `DateTime` | The `DateTime` value from the JSON |

### `global BotJsonPayload getJsonPayload(String key)`

Returns a value from the JSON by the provided key, converting it to an instance of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type             | Description                                                     |
| ---------------- | --------------------------------------------------------------- |
| `BotJsonPayload` | The [BotJsonPayload](/types/Classes/BotJsonPayload.md) instance |

### `global BotJsonPayload getJsonPayload(String key, Type payloadType)`

Returns a value from the JSON by the provided key, converting it to a specific instance of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param         | Description                          |
| ------------- | ------------------------------------ |
| `key`         | The JSON value key                   |
| `payloadType` | The Apex type of the result instance |

#### Returns

| Type             | Description                                                     |
| ---------------- | --------------------------------------------------------------- |
| `BotJsonPayload` | The [BotJsonPayload](/types/Classes/BotJsonPayload.md) instance |

### `global List<BotJsonPayload> getJsonPayloadList(String key)`

Returns a value from the JSON by the provided key, converting it to a `List` of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type                   | Description                                                            |
| ---------------------- | ---------------------------------------------------------------------- |
| `List<BotJsonPayload>` | The [BotJsonPayload](/types/Classes/BotJsonPayload.md) `List` instance |

### `global List<BotJsonPayload> getJsonPayloadList(String key, Type listEntryType)`

Returns a value from the JSON by the provided key, converting it to a `List` of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param           | Description                                     |
| --------------- | ----------------------------------------------- |
| `key`           | The JSON value key                              |
| `listEntryType` | The type of an entry of the result payload list |

#### Returns

| Type                   | Description                                                            |
| ---------------------- | ---------------------------------------------------------------------- |
| `List<BotJsonPayload>` | The [BotJsonPayload](/types/Classes/BotJsonPayload.md) `List` instance |

### `global Object get(String key)`

Returns a value from the JSON by the provided key

#### Parameters

| Param | Description        |
| ----- | ------------------ |
| `key` | The JSON value key |

#### Returns

| Type     | Description             |
| -------- | ----------------------- |
| `Object` | The value from the JSON |

### `global BotJsonPayload set(String key, Object value)`

Sets a new value to the JSON payload

#### Parameters

| Param   | Description              |
| ------- | ------------------------ |
| `key`   | The key of the new value |
| `value` | The value                |

#### Returns

| Type             | Description                                                                          |
| ---------------- | ------------------------------------------------------------------------------------ |
| `BotJsonPayload` | The current instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

### `global BotJsonPayload set(BotJsonPayload payload)`

Sets all values from another instance of [BotJsonPayload](/types/Classes/BotJsonPayload.md)

#### Parameters

| Param     | Description                         |
| --------- | ----------------------------------- |
| `payload` | Another payload to copy values from |

#### Returns

| Type             | Description                                                                          |
| ---------------- | ------------------------------------------------------------------------------------ |
| `BotJsonPayload` | The current instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

### `global BotJsonPayload set(String key, Object value, Boolean skipNull)`

Sets a new value to the JSON payload, if the provided value not `null`

#### Parameters

| Param      | Description                                                         |
| ---------- | ------------------------------------------------------------------- |
| `key`      | The key of the new value                                            |
| `value`    | The value                                                           |
| `skipNull` | Determines if the setting value should be skipped in case of `null` |

#### Returns

| Type             | Description                                                                          |
| ---------------- | ------------------------------------------------------------------------------------ |
| `BotJsonPayload` | The current instance of the [BotJsonPayload](/types/Classes/BotJsonPayload.md) class |

---
