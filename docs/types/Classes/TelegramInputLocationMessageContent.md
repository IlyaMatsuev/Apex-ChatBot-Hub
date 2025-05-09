# TelegramInputLocationMessageContent

Describes the input location message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputlocationmessagecontent

**Inheritance**

[TelegramInputMessageContent](/types/Classes/TelegramInputMessageContent.md)
&gt;
TelegramInputLocationMessageContent

## Constructors

### `global TelegramInputLocationMessageContent(Decimal latitude, Decimal longitude)`

Creates a new instance of the input message with the provided latitude and longitude

#### Parameters

| Param       | Description                              |
| ----------- | ---------------------------------------- |
| `latitude`  | The latitude of the location in degrees  |
| `longitude` | The longitude of the location in degrees |

---

## Methods

### `global TelegramInputLocationMessageContent withHorizontalAccuracy(Decimal accuracy)`

Sets the radius of uncertainty for the location, measured in meters

#### Parameters

| Param      | Description                                                                              |
| ---------- | ---------------------------------------------------------------------------------------- |
| `accuracy` | The radius of uncertainty for the location in meters. Accepts values in range: `0..1500` |

#### Returns

| Type                                  | Description                                                                                                                    |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputLocationMessageContent` | The current instance of the [TelegramInputLocationMessageContent](/types/Classes/TelegramInputLocationMessageContent.md) class |

### `global TelegramInputLocationMessageContent withLivePeriod(Integer period)`

Sets the period in seconds for which the location will be updated

#### Parameters

| Param    | Description                                                                                        |
| -------- | -------------------------------------------------------------------------------------------------- |
| `period` | The period in seconds for which the location will be updated. Accepts values in range: `60..86400` |

#### Returns

| Type                                  | Description                                                                                                                    |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputLocationMessageContent` | The current instance of the [TelegramInputLocationMessageContent](/types/Classes/TelegramInputLocationMessageContent.md) class |

### `global TelegramInputLocationMessageContent withProximityAlertRadius(Integer alertRadius)`

Sets the maximum distance in meters for proximity alerts about approaching another chat member

#### Parameters

| Param         | Description                                                                                                                     |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `alertRadius` | The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000` |

#### Returns

| Type                                  | Description                                                                                                                    |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputLocationMessageContent` | The current instance of the [TelegramInputLocationMessageContent](/types/Classes/TelegramInputLocationMessageContent.md) class |

### `global TelegramInputLocationMessageContent withHeading(Integer heading)`

Sets the direction in degrees in which the user is moving

#### Parameters

| Param     | Description                                                                             |
| --------- | --------------------------------------------------------------------------------------- |
| `heading` | The direction in degrees in which the user is moving. Accepts values in range: `1..360` |

#### Returns

| Type                                  | Description                                                                                                                    |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputLocationMessageContent` | The current instance of the [TelegramInputLocationMessageContent](/types/Classes/TelegramInputLocationMessageContent.md) class |

---
