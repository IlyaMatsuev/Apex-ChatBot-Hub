# TelegramBotMeService

Service class that provides access to all `Telegram` `me` and `my` methods

## Methods

### `global TelegramUser get()`

Returns the basic information about the bot

#### Returns

| Type           | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| `TelegramUser` | The instance of the [TelegramUser](/types/Classes/TelegramUser.md) class |

### `global String getName()`

Returns the bot's name

#### Returns

| Type     | Description    |
| -------- | -------------- |
| `String` | The bot's name |

### `global String getName(String languageCode)`

Returns the bot's name

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `languageCode` | The two-letter language code |

#### Returns

| Type     | Description    |
| -------- | -------------- |
| `String` | The bot's name |

### `global String getDescription()`

Returns the bot's description

#### Returns

| Type     | Description           |
| -------- | --------------------- |
| `String` | The bot's description |

### `global String getDescription(String languageCode)`

Returns the bot's description

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `languageCode` | The two-letter language code |

#### Returns

| Type     | Description           |
| -------- | --------------------- |
| `String` | The bot's description |

### `global String getShortDescription()`

Returns the bot's short description

#### Returns

| Type     | Description                 |
| -------- | --------------------------- |
| `String` | The bot's short description |

### `global String getShortDescription(String languageCode)`

Returns the bot's short description

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `languageCode` | The two-letter language code |

#### Returns

| Type     | Description                 |
| -------- | --------------------------- |
| `String` | The bot's short description |

### `global TelegramChatAdministratorRights getDefaultAdminRights()`

Returns the bot's default administrator rights

#### Returns

| Type                              | Description                                                                                                    |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global TelegramChatAdministratorRights getDefaultAdminRights(Boolean forChannels)`

Returns the bot's default administrator rights

#### Parameters

| Param         | Description                                                                                                                                                       |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `forChannels` | `True` to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned |

#### Returns

| Type                              | Description                                                                                                    |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `TelegramChatAdministratorRights` | The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class |

### `global void setName(String name)`

Sets the new bot's name

#### Parameters

| Param  | Description        |
| ------ | ------------------ |
| `name` | The new bot's name |

### `global void setName(String name, String languageCode)`

Sets the new bot's name for a specific language

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `name`         | The new bot's name           |
| `languageCode` | The two-letter language code |

### `global void setDescription(String description)`

Sets the new bot's description

#### Parameters

| Param         | Description               |
| ------------- | ------------------------- |
| `description` | The new bot's description |

### `global void setDescription(String description, String languageCode)`

Sets the new bot's description for a specific language

#### Parameters

| Param          | Description                  |
| -------------- | ---------------------------- |
| `description`  | The new bot's description    |
| `languageCode` | The two-letter language code |

### `global void setShortDescription(String description)`

Sets the new bot's short description

#### Parameters

| Param         | Description                     |
| ------------- | ------------------------------- |
| `description` | The new bot's short description |

### `global void setShortDescription(String description, String languageCode)`

Sets the new bot's short description for a specific language

#### Parameters

| Param          | Description                     |
| -------------- | ------------------------------- |
| `description`  | The new bot's short description |
| `languageCode` | The two-letter language code    |

### `global void setDefaultAdminRights(TelegramChatAdministratorRights rights)`

Sets the bot's default administrator rights

#### Parameters

| Param    | Description                                                                                                                                                    |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `rights` | The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class, describing the bot's default chat admin rights |

### `global void setDefaultAdminRights(TelegramChatAdministratorRights rights, Boolean forChannels)`

Sets the bot's default administrator rights

#### Parameters

| Param         | Description                                                                                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `rights`      | The instance of the [TelegramChatAdministratorRights](/types/Classes/TelegramChatAdministratorRights.md) class, describing the bot's default chat admin rights |
| `forChannels` | `True` to set default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be set   |

---
