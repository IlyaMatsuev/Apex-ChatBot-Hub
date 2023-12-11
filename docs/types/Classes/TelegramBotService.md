# TelegramBotService

The concrete service for the `Telegram` messenger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Telegram` only

**Inheritance**

[BotService](/types/Classes/BotService.md)
&gt;
TelegramBotService

## Methods

### `send(String chatId)`

Creates an instance of the `Telegram` sender service

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `chatId` | The id of the chat where the information has to be sent |

#### Return

**Type**

TelegramBotSenderService

**Description**

The `Telegram` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md) interface

### `edit(String chatId, String messageId)`

Creates an instance of the `Telegram` edit service

#### Parameters

| Param       | Description                                           |
| ----------- | ----------------------------------------------------- |
| `chatId`    | The id of the chat where a message needs to be edited |
| `messageId` | The id of the message to edit                         |

#### Return

**Type**

TelegramBotEditorService

**Description**

The instance of the [TelegramBotEditorService](/types/Classes/TelegramBotEditorService.md) class

### `edit(String chatId, String messageId, Boolean isInlineMessage)`

Creates an instance of the `Telegram` edit service

#### Parameters

| Param             | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `chatId`          | The id of the chat where a message needs to be edited  |
| `messageId`       | The id of the message to edit                          |
| `isInlineMessage` | Determines if the message to edit is an inline message |

#### Return

**Type**

TelegramBotEditorService

**Description**

The instance of the [TelegramBotEditorService](/types/Classes/TelegramBotEditorService.md) class

### `chat(String chatId)`

Creates an instance of the `Telegram` chat service

#### Parameters

| Param    | Description                                              |
| -------- | -------------------------------------------------------- |
| `chatId` | The id of the chat which information needs to be updated |

#### Return

**Type**

TelegramBotChatService

**Description**

The instance of the [TelegramBotChatService](/types/Classes/TelegramBotChatService.md) class

### `inlineQuery(String inlineQueryId)`

Creates an instance of the `Telegram` inline query service

#### Parameters

| Param           | Description                                  |
| --------------- | -------------------------------------------- |
| `inlineQueryId` | The unique identifier for the answered query |

#### Return

**Type**

TelegramBotInlineQueryService

**Description**

The instance of the [TelegramBotInlineQueryService](/types/Classes/TelegramBotInlineQueryService.md) class

### `me()`

Creates an instance of the `Telegram` `me` service

#### Return

**Type**

TelegramBotMeService

**Description**

The instance of the [TelegramBotMeService](/types/Classes/TelegramBotMeService.md) class

### `stickers()`

Creates an instance of the `Telegram` `sticker` service

#### Return

**Type**

TelegramBotStickerService

**Description**

The instance of the [TelegramBotStickerService](/types/Classes/TelegramBotStickerService.md) class

---
