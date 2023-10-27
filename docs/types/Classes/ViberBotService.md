# ViberBotService

The concrete service for the `Viber` messenger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Viber` only

**Inheritance**

[BotService](/types/Classes/BotService.md)
&gt;
ViberBotService

## Methods

### `send(String chatId)`

Creates an instance of the `Viber` sender service

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `chatId` | The id of the chat where the information has to be sent |

#### Return

**Type**

ViberBotSenderService

**Description**

The `Viber` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md)

### `sendBroadcast(List<String> chatIds)`

Creates an instance of the `Viber` sender service that will send the message to multiple users at once. The method doesn't throw any errors if it failed to send a message to some of the receivers

#### Parameters

| Param     | Description                                               |
| --------- | --------------------------------------------------------- |
| `chatIds` | The list of chat ids where the information has to be sent |

#### Return

**Type**

ViberBotSenderService

**Description**

The `Viber` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md)

### `getAccount()`

Gets the details about the bot account

#### Return

**Type**

ViberAccount

**Description**

The instance of the [ViberAccount](/types/Classes/ViberAccount.md) class

### `getUser(String userId)`

Gets the details about the a `Viber` user account

#### Parameters

| Param    | Description                |
| -------- | -------------------------- |
| `userId` | The unique `Viber` user id |

#### Return

**Type**

ViberUser

**Description**

The instance of the [ViberUser](/types/Classes/ViberUser.md) class

### `getOnline(String userId)`

Gets the online status of the provided user account

#### Parameters

| Param    | Description                |
| -------- | -------------------------- |
| `userId` | The unique `Viber` user id |

#### Return

**Type**

ViberOnlineStatus

**Description**

The instance of the [ViberUser](/types/Classes/ViberUser.md) class

### `getOnline(List<String> userIds)`

Gets the online status of the provided user accounts

#### Parameters

| Param     | Description                 |
| --------- | --------------------------- |
| `userIds` | The unique `Viber` user ids |

#### Return

**Type**

List&lt;ViberOnlineStatus&gt;

**Description**

The list of the [ViberUser](/types/Classes/ViberUser.md) class

---
