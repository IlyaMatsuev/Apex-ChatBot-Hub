# TelegramMaskPosition

Describes the mask position payload that can be received as part of an update from a `Telegram` bot.
Source: https://core.telegram.org/bots/api#maskposition

**Inheritance**

TelegramMaskPosition

## Properties

### `global point` → `String`

The part of the face relative to which the mask should be placed. One of `forehead`, `eyes`, `mouth`, or `chin`

### `global xShift` → `Decimal`

The shift by X-axis measured in widths of the mask scaled to the face size, from left to right

### `global yShift` → `Decimal`

The shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom

### `global scale` → `Decimal`

The mask scaling coefficient. For example, `2.0` means double size

---
