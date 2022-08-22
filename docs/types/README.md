# Type Definitions

Here specified only global Apex types that are supposed to be used by a user as part of this package.

### Classes

-   [BotService](#botservice)
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

TODO: Classes

---

### IBotHandler

This interface is called when the new update comes from the bot webhook. For example, when somebody sends a new message to the bot.

`void handle(BotContext context)` - Handle the incoming update. Accepts the `BotContext` instance.

---

### BotType

Defines available bot implementations. Right now only `Telegram` messenger is supported.

#### Values

-   `Telegram`
