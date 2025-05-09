# abstract TelegramBotHandler

The class designed for handling webhook events specifically for `Telegram` bots

**Implemented types**

[IBotHandler](/types/Interfaces/IBotHandler.md)

## Methods

### `global virtual void onMessageEdited(TelegramBotContext context, TelegramMessageEvent event)`

The method that is called when a message is edited

#### Parameters

| Param     | Description                                                                                                               |
| --------- | ------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                |
| `event`   | The instance of [TelegramMessageEvent](/types/Classes/TelegramMessageEvent.md) class, describing the edited message event |

### `global virtual void onChannelPostReceived(TelegramBotContext context, TelegramMessageEvent event)`

The method that is called when a new post is received in a channel

#### Parameters

| Param     | Description                                                                                                              |
| --------- | ------------------------------------------------------------------------------------------------------------------------ |
| `context` | The `Telegram` bot context                                                                                               |
| `event`   | The instance of [TelegramMessageEvent](/types/Classes/TelegramMessageEvent.md) class, describing the received post event |

### `global virtual void onChannelPostEdited(TelegramBotContext context, TelegramMessageEvent event)`

The method that is called when a post is edited in a channel

#### Parameters

| Param     | Description                                                                                                               |
| --------- | ------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                |
| `event`   | The instance of [TelegramMessageEvent](/types/Classes/TelegramMessageEvent.md) class, describing the edited message event |

### `global virtual void onInlineQuery(TelegramBotContext context, TelegramInlineQueryEvent event)`

The method that is called when an inline query is made via the bot. Using inline mode for a bot requires enabling it: https://core.telegram.org/bots/inline

#### Parameters

| Param     | Description                                                                                                                              |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                               |
| `event`   | The instance of [TelegramInlineQueryEvent](/types/Classes/TelegramInlineQueryEvent.md) class, describing the received inline query event |

### `global virtual void onChosenInlineResult(TelegramBotContext context, TelegramChosenInlineResultEvent event)`

The method that is called when the result of any inline query was chosen by the user and sent to their chat partner. Receiving this events requires enabling collecting feedback: https://core.telegram.org/bots/inline#collecting-feedback

#### Parameters

| Param     | Description                                                                                                                                          |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                                           |
| `event`   | The instance of [TelegramChosenInlineResultEvent](/types/Classes/TelegramChosenInlineResultEvent.md) class, describing the inline query result event |

### `global virtual void onCallbackQuery(TelegramBotContext context, TelegramCallbackQueryEvent event)`

The method that is called when a user clicks a callback button on an inline keyboard

#### Parameters

| Param     | Description                                                                                                                       |
| --------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                        |
| `event`   | The instance of [TelegramCallbackQueryEvent](/types/Classes/TelegramCallbackQueryEvent.md) class, describing callback query event |

### `global virtual void onPollUpdated(TelegramBotContext context, TelegramPollEvent event)`

The method that is called when a poll state update was received. Bots receive only updates about stopped polls and polls sent by the bot

#### Parameters

| Param     | Description                                                                                           |
| --------- | ----------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                            |
| `event`   | The instance of [TelegramPollEvent](/types/Classes/TelegramPollEvent.md) class, describing poll event |

### `global virtual void onPollAnswer(TelegramBotContext context, TelegramPollAnswerEvent event)`

The method that is called when a user changes their answer in a non-anonymous poll. Bots receive new votes only in polls sent by the bot itself

#### Parameters

| Param     | Description                                                                                                       |
| --------- | ----------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                        |
| `event`   | The instance of [TelegramPollAnswerEvent](/types/Classes/TelegramPollAnswerEvent.md) class, describing poll event |

### `global virtual void onMyChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event)`

The method that is called when the bot's chat member status changes. For private chats, this update is received only when the bot is blocked or unblocked by the user

#### Parameters

| Param     | Description                                                                                                                                    |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                                     |
| `event`   | The instance of [TelegramChatMemberUpdatedEvent](/types/Classes/TelegramChatMemberUpdatedEvent.md) class, describing updated chat member event |

### `global virtual void onChatMemberUpdated(TelegramBotContext context, TelegramChatMemberUpdatedEvent event)`

The method that is called when a user's chat member status changes. The bot must be an administrator in the chat to receive these updates

#### Parameters

| Param     | Description                                                                                                                                    |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                                     |
| `event`   | The instance of [TelegramChatMemberUpdatedEvent](/types/Classes/TelegramChatMemberUpdatedEvent.md) class, describing updated chat member event |

### `global virtual void onChatJoinRequest(TelegramBotContext context, TelegramChatJoinRequestEvent event)`

The method that is called when somebody requested to join a chat. The bot must have the `can_invite_users` administrator right in the chat to receive these updates

#### Parameters

| Param     | Description                                                                                                                              |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                               |
| `event`   | The instance of [TelegramChatJoinRequestEvent](/types/Classes/TelegramChatJoinRequestEvent.md) class, describing chat join request event |

### `global abstract void onMessageReceived(TelegramBotContext context, TelegramMessageEvent event)`

The method that is called when a new message is received

#### Parameters

| Param     | Description                                                                                                                 |
| --------- | --------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Telegram` bot context                                                                                                  |
| `event`   | The instance of [TelegramMessageEvent](/types/Classes/TelegramMessageEvent.md) class, describing the received message event |

### `global void handle(IBotContext context)`

The common handler for all webhook event types

#### Parameters

| Param     | Description                                                                                                                                                                     |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The context variable that contains all necessary methods for handling the incoming update. The instance of the [TelegramBotContext](/types/Classes/TelegramBotContext.md) class |

---
