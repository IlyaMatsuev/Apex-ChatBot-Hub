# BotReplyKeyboardButton

The builder-like class for building custom keyboard buttons, used as reply by the user

## Constructors

### `BotReplyKeyboardButton(String text)`

Creates an instance of the button with the provided text

#### Parameters

| Param  | Description     |
| ------ | --------------- |
| `text` | The button text |

---

## Fields

### `sharesContact` → `Boolean`

Determines whether the button is meant for sharing a user's phone number. Sends the user phone number to the bot instead of the `text` value

### `sharesLocation` → `Boolean`

Determines whether the button is meant for sharing a user's location. Sends the user location to the bot instead of the `text` value

### `text` → `String`

The button text. Will be sent to the bot as a message if the button is clicked

---

## Methods

### `shareContact()`

Makes the current button to share the user's phone number when clicked

#### Return

**Type**

BotReplyKeyboardButton

**Description**

The current [BotReplyKeyboardButton](/types/Classes/BotReplyKeyboardButton.md) instance

### `shareLocation()`

Makes the current button to share the user's location when clicked

#### Return

**Type**

BotReplyKeyboardButton

**Description**

The current [BotReplyKeyboardButton](/types/Classes/BotReplyKeyboardButton.md) instance

---
