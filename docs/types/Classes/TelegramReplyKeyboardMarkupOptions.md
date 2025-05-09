# TelegramReplyKeyboardMarkupOptions

The builder-like class that represents parameters for sending a custom reply keyboard to the user via the `Telegram` bot service.
Source: https://core.telegram.org/bots/api#replykeyboardmarkup

**Inheritance**

TelegramReplyKeyboardMarkupOptions

## Constructors

### `global TelegramReplyKeyboardMarkupOptions()`

Creates an instance of the reply keyboard without any buttons, so that they can be added separately

### `global TelegramReplyKeyboardMarkupOptions(Button buttons)`

Creates an instance of the reply keyboard with the provided buttons row

#### Parameters

| Param     | Description                                                 |
| --------- | ----------------------------------------------------------- |
| `buttons` | The list of buttons as a single row to be shown to the user |

### `global TelegramReplyKeyboardMarkupOptions(List<List<Button>> buttons)`

Creates an instance of the reply keyboard with the provided buttons matrix

#### Parameters

| Param     | Description                                     |
| --------- | ----------------------------------------------- |
| `buttons` | The list of button rows to be shown to the user |

---

## Properties

### `global buttons` → `List<List<Button>>`

The matrix of keyboard buttons to be shown to the receiver. Represents the list of button rows

---

## Methods

### `global TelegramReplyKeyboardMarkupOptions addButton(Button button)`

Adds a button to the keyboard's first row

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `button` | The button to be added to the first row on the keyboard |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions addButton(Integer row, Button button)`

Adds a button to the specific keyboard's row

#### Parameters

| Param    | Description                                                   |
| -------- | ------------------------------------------------------------- |
| `row`    | The row number to add the button to. Counting starts from `0` |
| `button` | The button to be added to the specified row on the keyboard   |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions addButtons(Button buttons)`

Adds multiple buttons to the keyboard's first row

#### Parameters

| Param     | Description                                              |
| --------- | -------------------------------------------------------- |
| `buttons` | The buttons to be added to the first row on the keyboard |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions addButtons(Integer row, Button buttons)`

Adds multiple buttons to the specific keyboard's row

#### Parameters

| Param     | Description                                                    |
| --------- | -------------------------------------------------------------- |
| `row`     | The row number to add the buttons to. Counting starts from `0` |
| `buttons` | The buttons to be added to the specified row on the keyboard   |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions allowResizeKeyboard()`

Allows to resize the keyboard vertically depending on the buttons height. By default the keyboard is always of the same size

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions allowResizeKeyboard(Boolean allowResize)`

Allows to resize the keyboard vertically depending on the buttons height. By default the keyboard is always of the same size

#### Parameters

| Param         | Description                                                                                  |
| ------------- | -------------------------------------------------------------------------------------------- |
| `allowResize` | Allows to resize the keyboard vertically depending on the buttons height. Default is `false` |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions asPersistent()`

Makes the keyboard always shown to the client when the regular keyboard is hidden. By default the custom keyboard can be hidden and opened with an icon

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions asPersistent(Boolean isPersistent)`

Makes the keyboard always shown to the client when the regular keyboard is hidden. By default the custom keyboard can be hidden and opened with an icon

#### Parameters

| Param          | Description                                                                                                        |
| -------------- | ------------------------------------------------------------------------------------------------------------------ |
| `isPersistent` | Determines whether the keyboard always shown to the client when the regular keyboard is hidden. Default is `false` |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions asOneTimeKeyboard()`

Makes the keyboard hidden as soon as it's used. User will have to open a custom keyboard manually after that, if needed

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions asOneTimeKeyboard(Boolean isOneTime)`

Makes the keyboard hidden as soon as it's used. User will have to open a custom keyboard manually after that, if needed

#### Parameters

| Param       | Description                                                                               |
| ----------- | ----------------------------------------------------------------------------------------- |
| `isOneTime` | Determines whether the keyboard should be hidden as soon as it's used. Default is `false` |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions setInputPlaceholder(String placeholder)`

Sets the placeholder to be shown in the input field when the keyboard is active

#### Parameters

| Param         | Description          |
| ------------- | -------------------- |
| `placeholder` | The placeholder text |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions asSelective()`

Makes the keyboard available for the specific users only

1. Users that are mentioned `@` in the sent message
2. If the current message is a reply, use the target user

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

### `global TelegramReplyKeyboardMarkupOptions asSelective(Boolean isSelective)`

Makes the keyboard available for the specific users only

1. Users that are mentioned `@` in the sent message
2. If the current message is a reply, use the target user

#### Parameters

| Param         | Description                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------ |
| `isSelective` | Determines whether the keyboard available for the specific users only or not. Default is `false` |

#### Returns

| Type                                 | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `TelegramReplyKeyboardMarkupOptions` | The current [TelegramReplyKeyboardMarkupOptions](/types/Classes/TelegramReplyKeyboardMarkupOptions.md) instance |

---

## Classes

### Button

The builder-like class representing a button in the `Telegram` reply keyboard.
Source: https://core.telegram.org/bots/api#keyboardbutton

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

#### Methods

##### `global Button asContactRequest()`

Determines if the clicking on the button will request to share user's contact details with the bot

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asLocationRequest()`

Determines if the clicking on the button will request to share user's location with the bot

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asUserRequest()`

Determines if the clicking on the button will request to share specific users with the bot (user will get a prompt with the list of available users)

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asUserRequest(Boolean botsOnly, Boolean premiumOnly)`

Determines if the clicking on the button will request to share specific users with the bot (user will get a prompt with the list of available users)

###### Parameters

| Param         | Description                                                                              |
| ------------- | ---------------------------------------------------------------------------------------- |
| `botsOnly`    | Determines if the user should be able to choose from their bots                          |
| `premiumOnly` | Determines if the user should be able to choose from their contacts with premium account |

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asChatRequest()`

Determines if the clicking on the button will request to share specific chats with the bot (user will get a prompt with the list of available chats)

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asChatRequest(ButtonRequestChatConfigs chatRequestConfigs)`

Determines if the clicking on the button will request to share specific chats with the bot (user will get a prompt with the list of available chats)

###### Parameters

| Param                | Description                                         |
| -------------------- | --------------------------------------------------- |
| `chatRequestConfigs` | The object with requirements for the chat to choose |

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asPollRequest()`

Determines if the clicking on the button will request a user to create a poll and send it to the bot

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asPollRequest(String pollType)`

Determines if the clicking on the button will request a user to create a poll of a specific type and send it to the bot

###### Parameters

| Param      | Description                                                        |
| ---------- | ------------------------------------------------------------------ |
| `pollType` | The type of the poll to create. Possible values: `quiz`, `regular` |

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

##### `global Button asWebAppLauncher(String webAppUrl)`

Determines if the clicking on the button will launch a specified web app

###### Parameters

| Param       | Description                           |
| ----------- | ------------------------------------- |
| `webAppUrl` | The URL of the web app to be launched |

###### Returns

| Type     | Description                                                                                                 |
| -------- | ----------------------------------------------------------------------------------------------------------- |
| `Button` | The current [TelegramReplyKeyboardMarkupOptions.Button](TelegramReplyKeyboardMarkupOptions.Button) instance |

---

### ButtonRequestChatConfigs

The builder-like class for requesting to share a specific list of chats.
Source: https://core.telegram.org/bots/api#keyboardbuttonrequestchat

**Inheritance**

ButtonRequestChatConfigs

#### Constructors

##### `global ButtonRequestChatConfigs()`

Creates an instance of the request chat configs without any requirements

---

#### Methods

##### `global ButtonRequestChatConfigs withChannels(Boolean isChannel)`

Requests only channel chats

###### Parameters

| Param       | Description                                                                                             |
| ----------- | ------------------------------------------------------------------------------------------------------- |
| `isChannel` | Determines if channel chats should be only requested. Pass `false` to request group or supergroup chats |

###### Returns

| Type                       | Description                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `ButtonRequestChatConfigs` | The current [TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs](TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs) instance |

##### `global ButtonRequestChatConfigs withForums(Boolean isForum)`

Requests only forum supergroup chats

###### Parameters

| Param     | Description                                                                                 |
| --------- | ------------------------------------------------------------------------------------------- |
| `isForum` | Determines if forum chats should be only requested. Pass `false` to request non-forum chats |

###### Returns

| Type                       | Description                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `ButtonRequestChatConfigs` | The current [TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs](TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs) instance |

##### `global ButtonRequestChatConfigs withUsername(Boolean hasUsername)`

Requests only chats that have username

###### Parameters

| Param         | Description                                                                                                  |
| ------------- | ------------------------------------------------------------------------------------------------------------ |
| `hasUsername` | Determines if chats with usernames should be only requested. Pass `false` to request chats without usernames |

###### Returns

| Type                       | Description                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `ButtonRequestChatConfigs` | The current [TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs](TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs) instance |

##### `global ButtonRequestChatConfigs withCreated(Boolean isCreated)`

Requests only chats that were created by the user

###### Parameters

| Param       | Description                                                                |
| ----------- | -------------------------------------------------------------------------- |
| `isCreated` | Determines if chats that were created by the user should be only requested |

###### Returns

| Type                       | Description                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `ButtonRequestChatConfigs` | The current [TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs](TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs) instance |

##### `global ButtonRequestChatConfigs withBot(Boolean hasBot)`

Requests only chats were the bot is presented

###### Parameters

| Param    | Description                                                            |
| -------- | ---------------------------------------------------------------------- |
| `hasBot` | Determines if chats were the bot is presented should be only requested |

###### Returns

| Type                       | Description                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `ButtonRequestChatConfigs` | The current [TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs](TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs) instance |

##### `global ButtonRequestChatConfigs withUserAdminRights(List&lt;String&gt; rights)`

Requests only chats were the user has all provided rights list

###### Parameters

| Param    | Description                                                                                                                                     |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `rights` | The list of available rights for the user in a chat. All values can be checked here: https://core.telegram.org/bots/api#chatadministratorrights |

###### Returns

| Type                       | Description                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `ButtonRequestChatConfigs` | The current [TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs](TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs) instance |

##### `global ButtonRequestChatConfigs withBotAdminRights(List&lt;String&gt; rights)`

Requests only chats were the bot has all provided rights list

###### Parameters

| Param    | Description                                                                                                                                     |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `rights` | The list of available rights for the user in a chat. All values can be checked here: https://core.telegram.org/bots/api#chatadministratorrights |

###### Returns

| Type                       | Description                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `ButtonRequestChatConfigs` | The current [TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs](TelegramReplyKeyboardMarkupOptions.ButtonRequestChatConfigs) instance |

---

---
