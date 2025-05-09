# BotReplyKeyboardButton

The builder-like class for building custom keyboard buttons, used as reply by the user

## Constructors

### `global BotReplyKeyboardButton(String text)`

Creates an instance of the button with the provided text

#### Parameters

| Param  | Description     |
| ------ | --------------- |
| `text` | The button text |

---

## Fields

### `global text` → `String`

The button text. Will be sent to the bot as a message if the button is clicked

### `global sharesContact` → `Boolean`

Determines whether the button is meant for sharing a user's phone number. Sends the user phone number to the bot instead of the `text` value

### `global sharesLocation` → `Boolean`

Determines whether the button is meant for sharing a user's location. Sends the user location to the bot instead of the `text` value

---

## Methods

### `global BotReplyKeyboardButton shareContact()`

Makes the current button to share the user's phone number when clicked

#### Returns

| Type                     | Description                                                                             |
| ------------------------ | --------------------------------------------------------------------------------------- |
| `BotReplyKeyboardButton` | The current [BotReplyKeyboardButton](/types/Classes/BotReplyKeyboardButton.md) instance |

### `global BotReplyKeyboardButton shareLocation()`

Makes the current button to share the user's location when clicked

#### Returns

| Type                     | Description                                                                             |
| ------------------------ | --------------------------------------------------------------------------------------- |
| `BotReplyKeyboardButton` | The current [BotReplyKeyboardButton](/types/Classes/BotReplyKeyboardButton.md) instance |

---
