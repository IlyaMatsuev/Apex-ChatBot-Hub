# Type Definitions

Here specified only global Apex types that are supposed to be used by a user as part of this package.

### Classes

-   [BotService](#botservice)
-   [BotServiceFactory](#botservicefactory)
-   [BotContext](#botcontext)
-   [BotContext.Reply](#botcontextreply)
-   [BotUpdateModel](#botupdatemodel)
-   [BotUpdateModel.UserModel](#botupdatemodelusermodel)
-   [BotUpdateModel.ChatModel](#botupdatemodelchatmodel)
-   [BotUpdateModel.MessageModel](#botupdatemodelmessagemodel)

### Interfaces

-   [IBotHandler](#ibothandler)

### Enums

-   [BotType](#bottype)

---

### BotService

Base class that defines the common functionality for the bot services.

#### Methods

`void send(String chatId, String message)` - Send text message to the chat by the provided `chatId`.

### BotServiceFactory

Factory for creating instances of the `BotService`.

#### Methods

`BotService createBotService(Bot__c bot)` - create a new instance of the `BotService` class for the provided `Bot__c` object.

### BotContext

Context class that provides functionality and information to interact with the current bot chat update.

#### Fields

`Bot__c bot` - `Bot__c` sObject for the bot.

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

Contains information about the incoming update.

#### Fields

`Long id` - Incoming update external id.

`UserModel user` - The message sender model. Instance of the `BotUpdateModel.UserModel` class.

`ChatModel chat` - The chat model from where the update is coming. Instance of the `BotUpdateModel.ChatModel` class.

`MessageModel message` - The received message model. Instance of the `BotUpdateModel.MessageModel` class.

### BotUpdateModel.UserModel

Contains information about the user who sent a message.

#### Fields

`Long id` - User external id.

`String firstName` - First name of the sender.

`String lastName` - Last name of the sender.

`String username` - External username of the sender.

### BotUpdateModel.ChatModel

Contains information about the chat from where the update is coming.

#### Fields

`Long id` - Chat external id.

`String title` - Chat title.

`String firstName` - First name of the sender if the update is from the private chat.

`String lastName` - Last name of the sender if the update is from the private chat.

`String username` - External username of the sender if the update is from the private chat.

### BotUpdateModel.MessageModel

Contains information about the received message.

#### Fields

`Long id` - Message external id.

`String text` - Message text.

`DateTime sentAt` - Date and time when the message has been sent.

### IBotHandler

This interface is called when the new update comes from the bot webhook. For example, when somebody sends a new message to the bot.

`void handle(BotContext context)` - Handle the incoming update. Accepts the `BotContext` instance.

---

### BotType

Defines available bot implementations. Right now only `Telegram` messenger is supported.

#### Values

-   `Telegram`
