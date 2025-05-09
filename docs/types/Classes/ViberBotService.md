# ViberBotService

The concrete service for the `Viber` messenger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Viber` only

**Inheritance**

[BotService](/types/Classes/BotService.md)
&gt;
ViberBotService

## Methods

### `global ViberBotSenderService send(String chatId)`

Creates an instance of the `Viber` sender service

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `chatId` | The id of the chat where the information has to be sent |

#### Returns

| Type                    | Description                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| `ViberBotSenderService` | The `Viber` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md) |

### `global ViberBotSenderService sendBroadcast(List<String> chatIds)`

Creates an instance of the `Viber` sender service that will send the message to multiple users at once. The method doesn't throw any errors if it failed to send a message to some of the receivers

#### Parameters

| Param     | Description                                               |
| --------- | --------------------------------------------------------- |
| `chatIds` | The list of chat ids where the information has to be sent |

#### Returns

| Type                    | Description                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| `ViberBotSenderService` | The `Viber` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md) |

### `global ViberAccount getAccount()`

Gets the details about the bot account

#### Returns

| Type           | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| `ViberAccount` | The instance of the [ViberAccount](/types/Classes/ViberAccount.md) class |

### `global ViberUser getUser(String userId)`

Gets the details about the a `Viber` user account

#### Parameters

| Param    | Description                |
| -------- | -------------------------- |
| `userId` | The unique `Viber` user id |

#### Returns

| Type        | Description                                                        |
| ----------- | ------------------------------------------------------------------ |
| `ViberUser` | The instance of the [ViberUser](/types/Classes/ViberUser.md) class |

### `global ViberOnlineStatus getOnline(String userId)`

Gets the online status of the provided user account

#### Parameters

| Param    | Description                |
| -------- | -------------------------- |
| `userId` | The unique `Viber` user id |

#### Returns

| Type                | Description                                                        |
| ------------------- | ------------------------------------------------------------------ |
| `ViberOnlineStatus` | The instance of the [ViberUser](/types/Classes/ViberUser.md) class |

### `global List<ViberOnlineStatus> getOnline(List<String> userIds)`

Gets the online status of the provided user accounts

#### Parameters

| Param     | Description                 |
| --------- | --------------------------- |
| `userIds` | The unique `Viber` user ids |

#### Returns

| Type                      | Description                                                    |
| ------------------------- | -------------------------------------------------------------- |
| `List<ViberOnlineStatus>` | The list of the [ViberUser](/types/Classes/ViberUser.md) class |

---
