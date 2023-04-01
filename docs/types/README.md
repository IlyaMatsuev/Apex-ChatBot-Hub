# Type Definitions

## Classes

### [BotContext](/types/Classes/BotContext.md)

Represents the context with all necessary variables and entities for properly handling the incoming updates for bot webhooks

### [BotModel](/types/Classes/BotModel.md)

The `Bot__c` sObject model

### [BotReplyKeyboardButton](/types/Classes/BotReplyKeyboardButton.md)

The builder-like class for building custom keyboard buttons, used as reply by the user

### [BotService](/types/Classes/BotService.md)

The base class that contains features common for all bots

### [BotServiceFactory](/types/Classes/BotServiceFactory.md)

Factory for creating bot services

### [BotUpdateModel](/types/Classes/BotUpdateModel.md)

Contains all the details about the incoming update: message, chat and user information

### [TelegramBotSenderService](/types/Classes/TelegramBotSenderService.md)

Service class that provides access to all `Telegram` `send` methods

### [TelegramBotService](/types/Classes/TelegramBotService.md)

The concrete service for the `Telegram` messanger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Telegram` only

### [TelegramSendKeyboardOptions](/types/Classes/TelegramSendKeyboardOptions.md)

The builder-like class that represents parameters for sending a custom reply keyboard to the user via the `Telegram` bot service. The source: https://core.telegram.org/bots/api#replykeyboardmarkup

### [ViberBotSenderService](/types/Classes/ViberBotSenderService.md)

Service class that provides access to all `Viber` `send` methods

### [ViberBotService](/types/Classes/ViberBotService.md)

The concrete service for the `Viber` messanger bots. Extends [BotService](/types/Classes/BotService.md) but also contains features related to `Viber` only

### [ViberSendFileOptions](/types/Classes/ViberSendFileOptions.md)

The wrapper class that represents optional parameters for sending a file via the `Viber` bot service

### [ViberSendImageOptions](/types/Classes/ViberSendImageOptions.md)

The wrapper class that represents optional parameters for sending an image via the `Viber` bot service

### [ViberSendKeyboardOptions](/types/Classes/ViberSendKeyboardOptions.md)

The builder-like class that represents parameters for sending a custom carousel/keyboard to the user via the `Viber` bot service. The source: https://developers.viber.com/docs/tools/keyboards/#general-keyboard-parameters

### [ViberSendVideoOptions](/types/Classes/ViberSendVideoOptions.md)

The wrapper class that represents optional parameters for sending a video via the `Viber` bot service

## Enums

### [BotMessageType](/types/Enums/BotMessageType.md)

The enum with all available message types for sending and receiving messages

### [BotType](/types/Enums/BotType.md)

Custom enum that contains all available bot types for the package. The same values are presented in the `Bot__c.Type__c` picklist

### [BotUpdateEventType](/types/Enums/BotUpdateEventType.md)

Custom enum base class that is extended by `Telegram` and `Viber` enums which contain all available event types

### [TelegramBotUpdateEventType](/types/Enums/TelegramBotUpdateEventType.md)

Custom enum class that contains all available event types for `Telegram` bots. Docs: https://core.telegram.org/bots/api#update.

### [ViberBotUpdateEventType](/types/Enums/ViberBotUpdateEventType.md)

Custom enum class that contains all available event types for `Viber` bots. Docs: https://developers.viber.com/docs/api/rest-bot-api/#setting-a-webhook.

## Interfaces

### [IBotHandler](/types/Interfaces/IBotHandler.md)

The interface that is required to implement to handle chat bot updates

### [IBotSenderService](/types/Interfaces/IBotSenderService.md)

The interface with all common methods for sending messages to the bot users

### [IBotService](/types/Interfaces/IBotService.md)

The BotService interface containing all main methods for every bot service
