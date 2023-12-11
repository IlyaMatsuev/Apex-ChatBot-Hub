# TelegramBotMeService

Service class that provides access to all `Telegram` `me` and `my` methods

## Methods

### `get()`

Returns the basic information about the bot

#### Return

**Type**

TelegramUser

**Description**

The instance of the [TelegramUser](/types/Classes/TelegramUser.md) class

### `getName()`

Returns the bot's name

#### Return

**Type**

String

**Description**

The bot's name

### `getName(String languageCode)`

Returns the bot's name

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `languageCode` | The two-letter language code |

#### Return

**Type**

String

**Description**

The bot's name

### `getDescription()`

Returns the bot's description

#### Return

**Type**

String

**Description**

The bot's description

### `getDescription(String languageCode)`

Returns the bot's description

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `languageCode` | The two-letter language code |

#### Return

**Type**

String

**Description**

The bot's description

### `getShortDescription()`

Returns the bot's short description

#### Return

**Type**

String

**Description**

The bot's short description

### `getShortDescription(String languageCode)`

Returns the bot's short description

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `languageCode` | The two-letter language code |

#### Return

**Type**

String

**Description**

The bot's short description

### `getDefaultAdminRights()`

Returns the bot's default administrator rights

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `getDefaultAdminRights(Boolean forChannels)`

Returns the bot's default administrator rights

#### Parameters

| Param         | Description                                                                                                                                                       |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `forChannels` | `True` to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned |

#### Return

**Type**

TelegramChatAdministratorRights

**Description**

The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class

### `setName(String name)`

Sets the new bot's name

#### Parameters

| Param  | Description        |
| ------ | ------------------ |
| `name` | The new bot's name |

### `setName(String name, String languageCode)`

Sets the new bot's name for a specific language

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `name`         | The new bot's name           |
| `languageCode` | The two-letter language code |

### `setDescription(String description)`

Sets the new bot's description

#### Parameters

| Param         | Description               |
| ------------- | ------------------------- |
| `description` | The new bot's description |

### `setDescription(String description, String languageCode)`

Sets the new bot's description for a specific language

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `description`  | The new bot's description    |
| `languageCode` | The two-letter language code |

### `setShortDescription(String description)`

Sets the new bot's short description

#### Parameters

| Param         | Description                     |
| ------------- | ------------------------------- |
| `description` | The new bot's short description |

### `setShortDescription(String description, String languageCode)`

Sets the new bot's short description for a specific language

#### Parameters

| Param          | Description                     |
| -------------- | ------------------------------- |
| `description`  | The new bot's short description |
| `languageCode` | The two-letter language code    |

### `setDefaultAdminRights(TelegramChatAdministratorRights rights)`

Sets the bot's default administrator rights

#### Parameters

| Param    | Description                                                                                                                                                    |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `rights` | The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class, describing the bot's default chat admin rights |

### `setDefaultAdminRights(TelegramChatAdministratorRights rights, Boolean forChannels)`

Sets the bot's default administrator rights

#### Parameters

| Param         | Description                                                                                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `rights`      | The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class, describing the bot's default chat admin rights |
| `forChannels` | `True` to set default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be set   |

---
