# TelegramBotService

The concrete service for the `Telegram` messenger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Telegram` only

**Inheritance**

[BotService](/types/Classes/BotService.md)
&gt;
TelegramBotService

## Methods

### `global TelegramBotSenderService send(String chatId)`

Creates an instance of the `Telegram` sender service

#### Parameters

| Param    | Description                                             |
| -------- | ------------------------------------------------------- |
| `chatId` | The id of the chat where the information has to be sent |

#### Returns

| Type                       | Description                                                                                                |
| -------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `TelegramBotSenderService` | The `Telegram` implementation of the [IBotSenderService](/types/Interfaces/IBotSenderService.md) interface |

### `global TelegramBotEditorService edit(String chatId, String messageId)`

Creates an instance of the `Telegram` edit service

#### Parameters

| Param       | Description                                           |
| ----------- | ----------------------------------------------------- |
| `chatId`    | The id of the chat where a message needs to be edited |
| `messageId` | The id of the message to edit                         |

#### Returns

| Type                       | Description                                                                                      |
| -------------------------- | ------------------------------------------------------------------------------------------------ |
| `TelegramBotEditorService` | The instance of the [TelegramBotEditorService](/types/Classes/TelegramBotEditorService.md) class |

### `global TelegramBotEditorService edit(String chatId, String messageId, Boolean isInlineMessage)`

Creates an instance of the `Telegram` edit service

#### Parameters

| Param             | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `chatId`          | The id of the chat where a message needs to be edited  |
| `messageId`       | The id of the message to edit                          |
| `isInlineMessage` | Determines if the message to edit is an inline message |

#### Returns

| Type                       | Description                                                                                      |
| -------------------------- | ------------------------------------------------------------------------------------------------ |
| `TelegramBotEditorService` | The instance of the [TelegramBotEditorService](/types/Classes/TelegramBotEditorService.md) class |

### `global TelegramBotChatService chat(String chatId)`

Creates an instance of the `Telegram` chat service

#### Parameters

| Param    | Description                                              |
| -------- | -------------------------------------------------------- |
| `chatId` | The id of the chat which information needs to be updated |

#### Returns

| Type                     | Description                                                                                  |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| `TelegramBotChatService` | The instance of the [TelegramBotChatService](/types/Classes/TelegramBotChatService.md) class |

### `global TelegramBotInlineQueryService inlineQuery(String inlineQueryId)`

Creates an instance of the `Telegram` inline query service

#### Parameters

| Param           | Description                                  |
| --------------- | -------------------------------------------- |
| `inlineQueryId` | The unique identifier for the answered query |

#### Returns

| Type                            | Description                                                                                                |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `TelegramBotInlineQueryService` | The instance of the [TelegramBotInlineQueryService](/types/Classes/TelegramBotInlineQueryService.md) class |

### `global TelegramBotMeService me()`

Creates an instance of the `Telegram` `me` service

#### Returns

| Type                   | Description                                                                              |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| `TelegramBotMeService` | The instance of the [TelegramBotMeService](/types/Classes/TelegramBotMeService.md) class |

### `global TelegramBotStickerService stickers()`

Creates an instance of the `Telegram` `sticker` service

#### Returns

| Type                        | Description                                                                                        |
| --------------------------- | -------------------------------------------------------------------------------------------------- |
| `TelegramBotStickerService` | The instance of the [TelegramBotStickerService](/types/Classes/TelegramBotStickerService.md) class |

---
