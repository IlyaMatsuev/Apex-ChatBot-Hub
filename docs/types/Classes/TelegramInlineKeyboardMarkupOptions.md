# TelegramInlineKeyboardMarkupOptions

Represents parameters wrapper for sending inline keyboard to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#inlinekeyboardmarkup

**Inheritance**

TelegramInlineKeyboardMarkupOptions

## Constructors

### `TelegramInlineKeyboardMarkupOptions()`

Creates an instance of the inline keyboard without any buttons, so that they can be added separately

### `TelegramInlineKeyboardMarkupOptions(Button buttons)`

Creates an instance of the inline keyboard with the provided buttons row

#### Parameters

| Param     | Description                                                 |
| --------- | ----------------------------------------------------------- |
| `buttons` | The list of buttons as a single row to be shown to the user |

### `TelegramInlineKeyboardMarkupOptions(List<List<Button>> buttons)`

Creates an instance of the inline keyboard with the provided buttons matrix

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `buttons` | The list of button rows to be shown to the user |

---

## Properties

### `buttons` → `List<List<Button>>`

The matrix of inline keyboard buttons to be shown next to the message. Represents the list of button rows

---

## Methods

### `addButton(Button button)`

Adds a button to the keyboard's first row

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `button` | The button to be added to the first row on the keyboard |

#### Return

**Type**

TelegramInlineKeyboardMarkupOptions

**Description**

The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance

### `addButton(Integer row, Button button)`

Adds a button to the specific keyboard's row

#### Parameters

| Param    | Description                                                   |
| -------- | ------------------------------------------------------------- |
| `row`    | The row number to add the button to. Counting starts from `0` |
| `button` | The button to be added to the specified row on the keyboard   |

#### Return

**Type**

TelegramInlineKeyboardMarkupOptions

**Description**

The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance

### `addButtons(Button buttons)`

Adds multiple buttons to the keyboard's first row

#### Parameters

| Param     | Description                                              |
| --------- | -------------------------------------------------------- |
| `buttons` | The buttons to be added to the first row on the keyboard |

#### Return

**Type**

TelegramInlineKeyboardMarkupOptions

**Description**

The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance

### `addButtons(Integer row, Button buttons)`

Adds multiple buttons to the specific keyboard's row

#### Parameters

| Param     | Description                                                    |
| --------- | -------------------------------------------------------------- |
| `row`     | The row number to add the buttons to. Counting starts from `0` |
| `buttons` | The buttons to be added to the specified row on the keyboard   |

#### Return

**Type**

TelegramInlineKeyboardMarkupOptions

**Description**

The current [TelegramInlineKeyboardMarkupOptions](/types/Classes/TelegramInlineKeyboardMarkupOptions.md) instance

---

## Classes

### Button

The builder-like class representing a button in the `Telegram` inline keyboard.
Source: https://core.telegram.org/bots/api#inlinekeyboardbutton

**Inheritance**

Button

#### Constructors

##### `Button(String text)`

Creates an instance of the button with the provided text

###### Parameters

| Param  | Description     |
| ------ | --------------- |
| `text` | The button text |

---

#### Properties

##### `callbackData` → `String`

The data to be sent in a callback query to the bot when the button is pressed. `1-64` bytes

##### `loginUrl` → `LoginConfigs`

An HTTPS URL used to automatically authorize the user

##### `switchInlineQuery` → `String`

If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted

##### `switchInlineQueryChosenChat` → `SwitchInlineQueryChatConfigs`

If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field

##### `switchInlineQueryCurrentChat` → `String`

If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted

##### `text` → `String`

The label text on the button

##### `url` → `String`

The URL to be opened when the button is pressed

##### `webApp` → `TelegramWebAppInfo`

The description of the Web App that will be launched when the user presses the button

---

#### Methods

##### `withCallbackData(String data)`

Sets the data to be sent in a callback query to the bot when the button is pressed. `1-64` bytes

###### Parameters

| Param  | Description                             |
| ------ | --------------------------------------- |
| `data` | The data to be sent in a callback query |

###### Return

**Type**

Button

**Description**

The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance

##### `asUrl(String url)`

Sets the URL to be opened when the button is pressed

###### Parameters

| Param | Description          |
| ----- | -------------------- |
| `url` | The URL to be opened |

###### Return

**Type**

Button

**Description**

The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance

##### `asLoginUrl(LoginConfigs loginConfigs)`

Sets the login configs for when the button is pressed

###### Parameters

| Param          | Description                             |
| -------------- | --------------------------------------- |
| `loginConfigs` | The data to be sent in a callback query |

###### Return

**Type**

Button

**Description**

The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance

##### `asWebAppLauncher(String webAppUrl)`

Determines if the clicking on the button will launch a specified web app

###### Parameters

| Param       | Description                           |
| ----------- | ------------------------------------- |
| `webAppUrl` | The URL of the web app to be launched |

###### Return

**Type**

Button

**Description**

The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance

##### `asSwitchInlineQuery(String query)`

If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted

###### Parameters

| Param   | Description                            |
| ------- | -------------------------------------- |
| `query` | The query to be pasted in another chat |

###### Return

**Type**

Button

**Description**

The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance

##### `asSwitchInlineQueryCurrentChat(String query)`

If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted

###### Parameters

| Param   | Description                            |
| ------- | -------------------------------------- |
| `query` | The query to be pasted in another chat |

###### Return

**Type**

Button

**Description**

The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance

##### `asSwitchInlineQueryChosenChat(SwitchInlineQueryChatConfigs chatConfigs)`

If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field

###### Parameters

| Param         | Description                        |
| ------------- | ---------------------------------- |
| `chatConfigs` | The configs for the chat selection |

###### Return

**Type**

Button

**Description**

The current [TelegramInlineKeyboardMarkupOptions.Button](TelegramInlineKeyboardMarkupOptions.Button) instance

---

### LoginConfigs

The builder-like class representing login button configurations in the `Telegram` inline keyboard.
Source: https://core.telegram.org/bots/api#loginurl

**Inheritance**

LoginConfigs

#### Constructors

##### `LoginConfigs(String url)`

Creates an instance of the login configs with the provided service url

###### Parameters

| Param | Description                                                                                                 |
| ----- | ----------------------------------------------------------------------------------------------------------- |
| `url` | An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed |

---

#### Properties

##### `botUsername` → `String`

The username of a bot that will be used for the user authorization

##### `forwardText` → `String`

The new text of the button in forwarded messages

##### `requestWriteAccess` → `Boolean`

`True` to request the permission for your bot to send messages to the user

##### `url` → `String`

An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed

---

#### Methods

##### `withForwardText(String text)`

Sets the new text of the button in forwarded messages

###### Parameters

| Param  | Description                  |
| ------ | ---------------------------- |
| `text` | The text to be replaced with |

###### Return

**Type**

LoginConfigs

**Description**

The current [TelegramInlineKeyboardMarkupOptions.LoginConfigs](TelegramInlineKeyboardMarkupOptions.LoginConfigs) instance

##### `withAuthorizationBot(String botUsername)`

Sets the username of a bot that will be used for the user authorization

###### Parameters

| Param         | Description                                                        |
| ------------- | ------------------------------------------------------------------ |
| `botUsername` | The username of a bot that will be used for the user authorization |

###### Return

**Type**

LoginConfigs

**Description**

The current [TelegramInlineKeyboardMarkupOptions.LoginConfigs](TelegramInlineKeyboardMarkupOptions.LoginConfigs) instance

##### `withWriteAccess()`

Requests permissions for the bot to send messages to the user

###### Return

**Type**

LoginConfigs

**Description**

The current [TelegramInlineKeyboardMarkupOptions.LoginConfigs](TelegramInlineKeyboardMarkupOptions.LoginConfigs) instance

---

### SwitchInlineQueryChatConfigs

The builder-like class representing switch inline query configurations in the `Telegram` inline keyboard button.
Source: https://core.telegram.org/bots/api#switchinlinequerychosenchat

**Inheritance**

SwitchInlineQueryChatConfigs

#### Constructors

##### `SwitchInlineQueryChatConfigs(String query)`

Creates an instance of the switch inline query configs with the provided query

###### Parameters

| Param   | Description                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------- |
| `query` | The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted |

---

#### Properties

##### `allowBotChats` → `Boolean`

`True` if private chats with bots can be chosen

##### `allowChannelChats` → `Boolean`

`True` if channel chats can be chosen

##### `allowGroupChats` → `Boolean`

`True` if group and supergroup chats can be chosen

##### `allowUserChats` → `Boolean`

`True` if private chats with users can be chosen

##### `query` → `String`

The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted

---

#### Methods

##### `withUserChats()`

Defines if private chats with users can be chosen

###### Return

**Type**

SwitchInlineQueryChatConfigs

**Description**

The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance

##### `withBotChats()`

Defines if private chats with bots can be chosen

###### Return

**Type**

SwitchInlineQueryChatConfigs

**Description**

The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance

##### `withGroupChats()`

Defines if group and supergroup chats can be chosen

###### Return

**Type**

SwitchInlineQueryChatConfigs

**Description**

The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance

##### `withChannelChats()`

Defines if channel chats can be chosen

###### Return

**Type**

SwitchInlineQueryChatConfigs

**Description**

The current [TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs](TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs) instance

---

---
