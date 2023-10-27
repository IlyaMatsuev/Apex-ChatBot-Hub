# TelegramInlineQueryResultLocation

Describes the location result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultlocation

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultLocation

## Constructors

### `TelegramInlineQueryResultLocation(String id, Decimal latitude, Decimal longitude)`

Creates a new instance of the location inline query result with the provided result id and coords

#### Parameters

| Param       | Description                                        |
| ----------- | -------------------------------------------------- |
| `id`        | The unique identifier for the result, `1-64 bytes` |
| `latitude`  | The location latitude                              |
| `longitude` | The location longitude                             |

---

## Methods

### `withTitle(String title)`

Sets the title for the inline result

#### Parameters

| Param   | Description             |
| ------- | ----------------------- |
| `title` | The title of the result |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

### `withHorizontalAccuracy(Decimal accuracy)`

Sets the radius of uncertainty for the location, measured in meters

#### Parameters

| Param      | Description                                                                              |
| ---------- | ---------------------------------------------------------------------------------------- |
| `accuracy` | The radius of uncertainty for the location in meters. Accepts values in range: `0..1500` |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

### `withLivePeriod(Integer period)`

Sets the period in seconds for which the location will be updated

#### Parameters

| Param    | Description                                                                                        |
| -------- | -------------------------------------------------------------------------------------------------- |
| `period` | The period in seconds for which the location will be updated. Accepts values in range: `60..86400` |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

### `withProximityAlertRadius(Integer alertRadius)`

Sets the maximum distance in meters for proximity alerts about approaching another chat member

#### Parameters

| Param         | Description                                                                                                                     |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `alertRadius` | The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000` |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

### `withHeading(Integer heading)`

Sets the direction in degrees in which the user is moving

#### Parameters

| Param     | Description                                                                             |
| --------- | --------------------------------------------------------------------------------------- |
| `heading` | The direction in degrees in which the user is moving. Accepts values in range: `1..360` |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

### `withThumbnail(String url, Integer width, Integer height)`

Sets the thumbnail for the inline result

#### Parameters

| Param    | Description          |
| -------- | -------------------- |
| `url`    | The thumbnail URL    |
| `width`  | The thumbnail width  |
| `height` | The thumbnail height |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

### `withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

### `withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the location

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Return

**Type**

TelegramInlineQueryResultLocation

**Description**

The current instance of the [TelegramInlineQueryResultLocation](/types/Classes/TelegramInlineQueryResultLocation.md) class

---
