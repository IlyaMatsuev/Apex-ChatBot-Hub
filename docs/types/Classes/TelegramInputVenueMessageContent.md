# TelegramInputVenueMessageContent

Describes the input venue message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputvenuemessagecontent

**Inheritance**

[TelegramInputMessageContent](/types/Classes/TelegramInputMessageContent.md)
&gt;
TelegramInputVenueMessageContent

## Constructors

### `global TelegramInputVenueMessageContent(Decimal latitude, Decimal longitude)`

Creates a new instance of the input message with the provided latitude and longitude

#### Parameters

| Param       | Description                              |
| ----------- | ---------------------------------------- |
| `latitude`  | The latitude of the location in degrees  |
| `longitude` | The longitude of the location in degrees |

---

## Methods

### `global TelegramInputVenueMessageContent withTitle(String title)`

Sets the name of the venue

#### Parameters

| Param   | Description           |
| ------- | --------------------- |
| `title` | The name of the venue |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputVenueMessageContent` | The current instance of the [TelegramInputVenueMessageContent](/types/Classes/TelegramInputVenueMessageContent.md) class |

### `global TelegramInputVenueMessageContent withAddress(String address)`

Sets the address of the venue

#### Parameters

| Param     | Description              |
| --------- | ------------------------ |
| `address` | The address of the venue |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputVenueMessageContent` | The current instance of the [TelegramInputVenueMessageContent](/types/Classes/TelegramInputVenueMessageContent.md) class |

### `global TelegramInputVenueMessageContent withFoursquare(String id, String type)`

Sets the Foursquare information of the venue

#### Parameters

| Param  | Description                                                                                                                               |
| ------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `id`   | The Foursquare identifier of the venue, if known                                                                                          |
| `type` | The Foursquare type of the venue, if known. (For example, `arts_entertainment/default`, `arts_entertainment/aquarium` or `food/icecream`) |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputVenueMessageContent` | The current instance of the [TelegramInputVenueMessageContent](/types/Classes/TelegramInputVenueMessageContent.md) class |

### `global TelegramInputVenueMessageContent withGooglePlaces(String id, String type)`

Sets the Google Places information of the venue

#### Parameters

| Param  | Description                               |
| ------ | ----------------------------------------- |
| `id`   | The Google Places identifier of the venue |
| `type` | The Google Places type of the venue       |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInputVenueMessageContent` | The current instance of the [TelegramInputVenueMessageContent](/types/Classes/TelegramInputVenueMessageContent.md) class |

---
