# TelegramInlineQueryResultVenue

Describes the venue result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultvenue

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultVenue

## Constructors

### `global TelegramInlineQueryResultVenue(String id, Decimal latitude, Decimal longitude)`

Creates a new instance of the venue inline query result with the provided result id and coords

#### Parameters

| Param       | Description                                        |
| ----------- | -------------------------------------------------- |
| `id`        | The unique identifier for the result, `1-64 bytes` |
| `latitude`  | The venue latitude                                 |
| `longitude` | The venue longitude                                |

---

## Methods

### `global TelegramInlineQueryResultVenue withTitle(String title)`

Sets the name of the venue

#### Parameters

| Param   | Description           |
| ------- | --------------------- |
| `title` | The name of the venue |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultVenue` | The current instance of the [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md) class |

### `global TelegramInlineQueryResultVenue withAddress(String address)`

Sets the address of the venue

#### Parameters

| Param     | Description              |
| --------- | ------------------------ |
| `address` | The address of the venue |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultVenue` | The current instance of the [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md) class |

### `global TelegramInlineQueryResultVenue withFoursquare(String id, String type)`

Sets the Foursquare information of the venue

#### Parameters

| Param  | Description                                                                                                                               |
| ------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `id`   | The Foursquare identifier of the venue, if known                                                                                          |
| `type` | The Foursquare type of the venue, if known. (For example, `arts_entertainment/default`, `arts_entertainment/aquarium` or `food/icecream`) |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultVenue` | The current instance of the [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md) class |

### `global TelegramInlineQueryResultVenue withGooglePlaces(String id, String type)`

Sets the Google Places information of the venue

#### Parameters

| Param  | Description                               |
| ------ | ----------------------------------------- |
| `id`   | The Google Places identifier of the venue |
| `type` | The Google Places type of the venue       |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultVenue` | The current instance of the [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md) class |

### `global TelegramInlineQueryResultVenue withThumbnail(String url, Integer width, Integer height)`

Sets the thumbnail for the inline result

#### Parameters

| Param    | Description          |
| -------- | -------------------- |
| `url`    | The thumbnail URL    |
| `width`  | The thumbnail width  |
| `height` | The thumbnail height |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultVenue` | The current instance of the [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md) class |

### `global TelegramInlineQueryResultVenue withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultVenue` | The current instance of the [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md) class |

### `global TelegramInlineQueryResultVenue withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the venue

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Returns

| Type                             | Description                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineQueryResultVenue` | The current instance of the [TelegramInlineQueryResultVenue](/types/Classes/TelegramInlineQueryResultVenue.md) class |

---
