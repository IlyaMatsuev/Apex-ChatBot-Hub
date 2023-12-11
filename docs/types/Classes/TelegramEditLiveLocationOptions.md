# TelegramEditLiveLocationOptions

The builder-like class that describes all optional parameters of the `Telegram` `editMessageLiveLocation` method.
Source: https://core.telegram.org/bots/api#editmessagelivelocation

**Inheritance**

TelegramEditLiveLocationOptions

## Methods

### `withHorizontalAccuracy(Decimal accuracy)`

Sets the radius of uncertainty for the new location, measured in meters

#### Parameters

| Param      | Description                                                                              |
| ---------- | ---------------------------------------------------------------------------------------- |
| `accuracy` | The radius of uncertainty for the location in meters. Accepts values in range: `0..1500` |

#### Return

**Type**

TelegramEditLiveLocationOptions

**Description**

The current instance of the [TelegramEditLiveLocationOptions](/types/Classes/TelegramEditLiveLocationOptions.md) class

### `withProximityAlertRadius(Integer alertRadius)`

Sets the maximum distance in meters for proximity alerts about approaching another chat member

#### Parameters

| Param         | Description                                                                                                                     |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `alertRadius` | The maximum distance in meters for proximity alerts about approaching another chat member. Accepts values in range: `1..100000` |

#### Return

**Type**

TelegramEditLiveLocationOptions

**Description**

The current instance of the [TelegramEditLiveLocationOptions](/types/Classes/TelegramEditLiveLocationOptions.md) class

### `withHeading(Integer heading)`

Sets the direction in degrees in which the user is moving

#### Parameters

| Param     | Description                                                                             |
| --------- | --------------------------------------------------------------------------------------- |
| `heading` | The direction in degrees in which the user is moving. Accepts values in range: `1..360` |

#### Return

**Type**

TelegramEditLiveLocationOptions

**Description**

The current instance of the [TelegramEditLiveLocationOptions](/types/Classes/TelegramEditLiveLocationOptions.md) class

---
