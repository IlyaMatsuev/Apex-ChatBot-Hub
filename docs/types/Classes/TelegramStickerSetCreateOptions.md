# TelegramStickerSetCreateOptions

Describes the `Telegram` optional parameters for creation of a sticker set.
Source: https://core.telegram.org/bots/api#createnewstickerset

**Inheritance**

TelegramStickerSetCreateOptions

## Methods

### `withStickerType(String stickerType)`

Sets the type of stickers in the set

#### Parameters

| Param         | Description                                                                                                              |
| ------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `stickerType` | The type of stickers in the set, pass `regular`, `mask`, or `custom_emoji`. By default, a regular sticker set is created |

#### Return

**Type**

TelegramStickerSetCreateOptions

**Description**

The current instance of the [TelegramStickerSetCreateOptions](/types/Classes/TelegramStickerSetCreateOptions.md) class

### `withRepainting(Boolean repaintingNeeded)`

Determines if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context

#### Parameters

| Param              | Description                                                                                                                                                                                                       |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `repaintingNeeded` | `True` if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context |

#### Return

**Type**

TelegramStickerSetCreateOptions

**Description**

The current instance of the [TelegramStickerSetCreateOptions](/types/Classes/TelegramStickerSetCreateOptions.md) class

---
