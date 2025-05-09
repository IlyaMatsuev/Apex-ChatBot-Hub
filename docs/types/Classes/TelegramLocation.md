# TelegramLocation

Describes the location payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#location

**Inheritance**

TelegramLocation

## Properties

### `global longitude` → `Decimal`

The longitude as defined by sender

### `global latitude` → `Decimal`

The latitude as defined by sender

### `global horizontalAccuracy` → `Decimal`

The radius of uncertainty for the location, measured in meters; `0-1500`

### `global livePeriod` → `Integer`

The time relative to the message sending date, during which the location can be updated; in seconds. For active live locations only

### `global heading` → `Integer`

The direction in which user is moving, in degrees; `1-360`. For active live locations only

### `global proximityAlertRadius` → `Integer`

The maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only

---
