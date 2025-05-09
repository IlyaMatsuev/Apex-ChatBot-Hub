# TelegramInlineKeyboardMarkupOptions

Represents parameters wrapper for sending inline keyboard to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#inlinekeyboardmarkup

**Inheritance**

TelegramInlineKeyboardMarkupOptions

## Constructors

### `global TelegramInlineKeyboardMarkupOptions()`

Creates an instance of the inline keyboard without any buttons, so that they can be added separately

### `global TelegramInlineKeyboardMarkupOptions(Button buttons)`

Creates an instance of the inline keyboard with the provided buttons row

#### Parameters

| Param     | Description                                                 |
| --------- | ----------------------------------------------------------- |
| `buttons` | The list of buttons as a single row to be shown to the user |

### `global TelegramInlineKeyboardMarkupOptions(List<List<Button>> buttons)`

Creates an instance of the inline keyboard with the provided buttons matrix

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `buttons` | The list of button rows to be shown to the user |

---

## Properties

### `global buttons` → `List<List<Button>>`

The matrix of inline keyboard buttons to be shown next to the message. Represents the list of button rows

---

## Methods

### `global TelegramInlineKeyboardMarkupOptions addButton(Button button)`

Adds a button to the keyboard's first row

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `button` | The button to be added to the first row on the keyboard |

#### Returns

| Type                                  | Description                                                                                                       |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineKeyboardMarkupOptions` | The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance |

### `global TelegramInlineKeyboardMarkupOptions addButton(Integer row, Button button)`

Adds a button to the specific keyboard's row

#### Parameters

| Param    | Description                                                   |
| -------- | ------------------------------------------------------------- |
| `row`    | The row number to add the button to. Counting starts from `0` |
| `button` | The button to be added to the specified row on the keyboard   |

#### Returns

| Type                                  | Description                                                                                                       |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineKeyboardMarkupOptions` | The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance |

### `global TelegramInlineKeyboardMarkupOptions addButtons(Button buttons)`

Adds multiple buttons to the keyboard's first row

#### Parameters

| Param     | Description                                              |
| --------- | -------------------------------------------------------- |
| `buttons` | The buttons to be added to the first row on the keyboard |

#### Returns

| Type                                  | Description                                                                                                       |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineKeyboardMarkupOptions` | The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance |

### `global TelegramInlineKeyboardMarkupOptions addButtons(Integer row, Button buttons)`

Adds multiple buttons to the specific keyboard's row

#### Parameters

| Param     | Description                                                    |
| --------- | -------------------------------------------------------------- |
| `row`     | The row number to add the buttons to. Counting starts from `0` |
| `buttons` | The buttons to be added to the specified row on the keyboard   |

#### Returns

| Type                                  | Description                                                                                                       |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `TelegramInlineKeyboardMarkupOptions` | The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance |

---

## Classes

### Button

The builder-like class representing a button in the `Telegram` inline keyboard.
Source: https://core.telegram.org/bots/api#inlinekeyboardbutton

**Inheritance**

Button

#### Constructors

##### `global Button(String text)`

Creates an instance of the button with the provided text

###### Parameters

| Param  | Description     |
| ------ | --------------- |
| `text` | The button text |

---

#### Properties

##### `global text` → `String`

The label text on the button

##### `global url` → `String`

The URL to be opened when the button is pressed

##### `global callbackData` → `String`

The data to be sent in a callback query to the bot when the button is pressed. `1-64` bytes

##### `global webApp` → `TelegramWebAppInfo`

The description of the Web App that will be launched when the user presses the button

##### `global loginUrl` → `LoginConfigs`

An HTTPS URL used to automatically authorize the user

##### `global switchInlineQuery` → `String`

If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted

##### `global switchInlineQueryCurrentChat` → `String`

If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted

##### `global switchInlineQueryChosenChat` → `SwitchInlineQueryChatConfigs`

If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field

---

#### Methods

##### `global Button withCallbackData(String data)`

Sets the data to be sent in a callback query to the bot when the button is pressed. `1-64` bytes

###### Parameters

| Param  | Description                             |
| ------ | --------------------------------------- |
| `data` | The data to be sent in a callback query |

###### Returns

| Type     | Description                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance |

##### `global Button asUrl(String url)`

Sets the URL to be opened when the button is pressed

###### Parameters

| Param | Description          |
| ----- | -------------------- |
| `url` | The URL to be opened |

###### Returns

| Type     | Description                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance |

##### `global Button asLoginUrl(LoginConfigs loginConfigs)`

Sets the login configs for when the button is pressed

###### Parameters

| Param          | Description                             |
| -------------- | --------------------------------------- |
| `loginConfigs` | The data to be sent in a callback query |

###### Returns

| Type     | Description                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance |

##### `global Button asWebAppLauncher(String webAppUrl)`

Determines if the clicking on the button will launch a specified web app

###### Parameters

| Param       | Description                           |
| ----------- | ------------------------------------- |
| `webAppUrl` | The URL of the web app to be launched |

###### Returns

| Type     | Description                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance |

##### `global Button asSwitchInlineQuery(String query)`

If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted

###### Parameters

| Param   | Description                            |
| ------- | -------------------------------------- |
| `query` | The query to be pasted in another chat |

###### Returns

| Type     | Description                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance |

##### `global Button asSwitchInlineQueryCurrentChat(String query)`

If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted

###### Parameters

| Param   | Description                            |
| ------- | -------------------------------------- |
| `query` | The query to be pasted in another chat |

###### Returns

| Type     | Description                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance |

##### `global Button asSwitchInlineQueryChosenChat(SwitchInlineQueryChatConfigs chatConfigs)`

If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field

###### Parameters

| Param         | Description                        |
| ------------- | ---------------------------------- |
| `chatConfigs` | The configs for the chat selection |

###### Returns

| Type     | Description                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance |

---

### LoginConfigs

The builder-like class representing login button configurations in the `Telegram` inline keyboard.
Source: https://core.telegram.org/bots/api#loginurl

**Inheritance**

LoginConfigs

#### Constructors

##### `global LoginConfigs(String url)`

Creates an instance of the login configs with the provided service url

###### Parameters

| Param | Description                                                                                                 |
| ----- | ----------------------------------------------------------------------------------------------------------- |
| `url` | An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed |

---

#### Properties

##### `global url` → `String`

An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed

##### `global forwardText` → `String`

The new text of the button in forwarded messages

##### `global botUsername` → `String`

The username of a bot that will be used for the user authorization

##### `global requestWriteAccess` → `Boolean`

`True` to request the permission for your bot to send messages to the user

---

#### Methods

##### `global LoginConfigs withForwardText(String text)`

Sets the new text of the button in forwarded messages

###### Parameters

| Param  | Description                  |
| ------ | ---------------------------- |
| `text` | The text to be replaced with |

###### Returns

| Type           | Description                                                                                                               |
| -------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `LoginConfigs` | The current [TelegramInlineKeyboardMarkupOptions.LoginConfigs](TelegramInlineKeyboardMarkupOptions.LoginConfigs) instance |

##### `global LoginConfigs withAuthorizationBot(String botUsername)`

Sets the username of a bot that will be used for the user authorization

###### Parameters

| Param         | Description                                                        |
| ------------- | ------------------------------------------------------------------ |
| `botUsername` | The username of a bot that will be used for the user authorization |

###### Returns

| Type           | Description                                                                                                               |
| -------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `LoginConfigs` | The current [TelegramInlineKeyboardMarkupOptions.LoginConfigs](TelegramInlineKeyboardMarkupOptions.LoginConfigs) instance |

##### `global LoginConfigs withWriteAccess()`

Requests permissions for the bot to send messages to the user

###### Returns

| Type           | Description                                                                                                               |
| -------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `LoginConfigs` | The current [TelegramInlineKeyboardMarkupOptions.LoginConfigs](TelegramInlineKeyboardMarkupOptions.LoginConfigs) instance |

---

### SwitchInlineQueryChatConfigs

The builder-like class representing switch inline query configurations in the `Telegram` inline keyboard button.
Source: https://core.telegram.org/bots/api#switchinlinequerychosenchat

**Inheritance**

SwitchInlineQueryChatConfigs

#### Constructors

##### `global SwitchInlineQueryChatConfigs(String query)`

Creates an instance of the switch inline query configs with the provided query

###### Parameters

| Param   | Description                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------- |
| `query` | The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted |

---

#### Properties

##### `global query` → `String`

The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted

##### `global allowUserChats` → `Boolean`

`True` if private chats with users can be chosen

##### `global allowBotChats` → `Boolean`

`True` if private chats with bots can be chosen

##### `global allowGroupChats` → `Boolean`

`True` if group and supergroup chats can be chosen

##### `global allowChannelChats` → `Boolean`

`True` if channel chats can be chosen

---

#### Methods

##### `global SwitchInlineQueryChatConfigs withUserChats()`

Defines if private chats with users can be chosen

###### Returns

| Type                           | Description                                                                                                                                               |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SwitchInlineQueryChatConfigs` | The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance |

##### `global SwitchInlineQueryChatConfigs withBotChats()`

Defines if private chats with bots can be chosen

###### Returns

| Type                           | Description                                                                                                                                               |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SwitchInlineQueryChatConfigs` | The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance |

##### `global SwitchInlineQueryChatConfigs withGroupChats()`

Defines if group and supergroup chats can be chosen

###### Returns

| Type                           | Description                                                                                                                                               |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SwitchInlineQueryChatConfigs` | The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance |

##### `global SwitchInlineQueryChatConfigs withChannelChats()`

Defines if channel chats can be chosen

###### Returns

| Type                           | Description                                                                                                                                               |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SwitchInlineQueryChatConfigs` | The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance |

---

---
