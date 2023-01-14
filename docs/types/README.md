# Type Definitions

Here specified only `global` Apex types that are _supposed_ to be used by a user as part of this package.

### Classes

-   [BotService](#botservice)
-   [TelegramBotService](#telegrambotservice)
-   [ViberBotService](#viberbotservice)
-   [BotServiceFactory](#botservicefactory)
-   [BotContext](#botcontext)
-   [BotContext.Reply](#botcontextreply)
-   [BotUpdateModel](#botupdatemodel)
-   [BotUpdateModel.UserModel](#botupdatemodelusermodel)
-   [BotUpdateModel.ChatModel](#botupdatemodelchatmodel)
-   [BotUpdateModel.MessageModel](#botupdatemodelmessagemodel)
-   [BotUpdateModel.Command](#botupdatemodelcommand)

### Interfaces

-   [IBotHandler](#ibothandler)

### Enums

-   [BotType](#bottype)
-   [TelegramBotUpdateEventType](#telegrambotupdateeventtype)
-   [ViberBotUpdateEventType](#viberbotupdateeventtype)

---

### BotService

Base class that defines the common functionality for the bot services.

#### Methods

`void send(String chatId, String message)` - Send text message to the chat by the provided `chatId`.

### TelegramBotService

The concrete service for the `Telegram` messanger bots. Extends `BotService` but also contains features related to `Telegram` only. _Right now there are no unique fields/methods for this service_.

### ViberBotService

The concrete service for the `Viber` messanger bots. Extends `BotService` but also contains features related to `Viber` only. _Right now there are no unique fields/methods for this service_.

### BotServiceFactory

Factory for creating instances of the `BotService`.

#### Methods

`BotService createBotService(Bot__c bot)` - Create a new instance of the `BotService` class for the provided `Bot__c` object.

### BotContext

Context class that provides functionality and information to interact with the current bot chat update.

#### Fields

`Bot__c bot` - The `Bot__c` record associated with the current webhook update.

`BotType type` - Instance of the `BotType`. The type of the bot associated with the incoming update

`BotUpdateModel received` - Instance of the `BotUpdateModel` that contains details about the incoming update.

`Reply reply` - Instance of the `BotContext.Reply` that provides methods for answering to the incoming update.

#### Methods

`BotService getService(Bot__c bot)` - Creates a new bot service for the provided `Bot__c` sObject.

`void save(SObject record)` - Publishes the record to be saved asynchronously during the update handler execution.

`void save(List<SObject> records)` - Publishes the records to be saved asynchronously during the update handler execution.

`void save(List<SObject> records, String externalIdField)` - Publishes the records to be saved asynchronously by the external id during the update handler execution.

### BotContext.Reply

The nested class containing methods for answerting to the received update.

#### Methods

`void send(String message)` - Reply to the chat/user with the provided text message.

### BotUpdateModel

Contains all the details about the incoming update: message, chat and user information.

#### Fields

`BotUpdateEventType eventType` - The type of the incoming event. Event types are different for every bot (e.g. `TelegramBotUpdateEventType` or `ViberBotUpdateEventType`).

`ChatModel chat` - The chat model from where the update is coming. Instance of the `BotUpdateModel.ChatModel` class.

`MessageModel message` - The received message model. Instance of the `BotUpdateModel.MessageModel` class.

### BotUpdateModel.ChatModel

Contains information about the chat from where the update is coming.

#### Fields

`String id` - The messanger's chat id.

`String title` - The messanger's chat title. Can be either firstname + lastname or username depending on how much profile information is filled by the user.

`UserModel sender` - The instance of `BotUpdateModel.UserModel` containing all details about the user who sent a message (or any other update) to the bot.

#### Properties

`Boolean isDM { get; }` - Evaluates `true` if the current update is coming from the private chat (direct message)

### BotUpdateModel.UserModel

Contains all details about the the user who sent a message (or any other update) to the bot.

#### Fields

`String id` - The messanger's user id.

`String firstName` - First name of the sender.

`String lastName` - Last name of the sender.

`String username` - The messanger's user unique username.

### BotUpdateModel.MessageModel

Contains information about the received message.

#### Fields

`String id` - The messanger's user id.

`String text` - The incoming message text.

`DateTime sentAt` - Date and time when the message has been sent.

#### Properties

`Command command { get; }` - Returns the `Command` instance if the message is a command (starts with "/").

### BotUpdateModel.Command

Contains information about the command received with message.

#### Fields

`String name` - Name of the command.

`List<String> params` - Parameters split by space provided with the command.

---

### IBotHandler

This interface is called when the new update comes from the bot webhook. For example, when somebody sends a new message to the bot.

`void handle(BotContext context)` - Handle the incoming update. Accepts the `BotContext` instance.

---

### BotType

Defines available bot implementation options.

#### Values

-   `Telegram`
-   `Viber`

### TelegramBotUpdateEventType

Defines available `Telegram` bot event types to receive.

#### Values

-   `Message`
-   `EditedMessage`

### ViberBotUpdateEventType

Defines available `Viber` bot event types to receive.

#### Values

-   `WebhookCallback` - Not supposed to be used
-   `Message`
-   `Delivered`
-   `Seen`
