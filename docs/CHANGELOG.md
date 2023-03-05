# Unreleased

## Breaking changes

### Refactoring

It was decided, due to better maintainability in future, to split the responsibility on Bot's implementations between different services and not just have everything together in the `TelegramBotService` or `ViberBotService` as it would be nearly impossible to extend with the new methods in future.

Instead, now there is [IBotService](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types/Interfaces/IBotService) interface that contains all of the methods that will be available to use for all bot services.

Currently, `IBotService` has only one method `send(String chatId)` with all methods responsible for sending information to the specified chat. The implementations are [TelegramBotSenderService](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types/Classes/TelegramBotSenderService) and [ViberBotSenderService](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types/Classes/ViberBotSenderService).

### Introducing `BotModel` class

To be aligned with the OOP style that is being used accross the project, I created a new [BotModel](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types/Classes/BotModel) class which is just a wrapper around the `Bot__c` sObject record. All references of `Bot__c` where replaced with that model.

## What's New

### Better documentation

The documentation now nicely hosted on the GitHub pages using docsify: https://ilyamatsuev.github.io/Apex-ChatBot-Hub/

Also, checkout the page with all Apex Classes definitions: https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types

## What's Changed

### Support sending different message types

It used to be possible to send the text messages only. Now, these message types are supported:

-   text
-   image
-   video
-   file
-   contact
-   location

These are common message types that supported when using a `IBotService` interface. If you know exactly which service you want to use, you'll have access to more methods, like sending a sticker for example.

Example to send an image:

```java
IBotService service = new BotServiceFactory().createBotService(bot);
// Provide string `chatId` where you want to send something
service.send(chatId).image('https://example.com/image.jpeg');
```

Example to send a sticker for the `Telegram` bot:

```java
TelegramBotService telegramService = (TelegramBotService) new BotServiceFactory().createBotService(bot);
// The same interface: provide the chat id where we want to send something
service.send(chatId).sticker('some-telegram-sticker-file-id');
```

More methods can be found in [`TelegramBotSenderService`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types/Classes/TelegramBotSenderService) and [`ViberBotSenderService`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types/Classes/ViberBotSenderService).

## Bugfixes

-   When using `Viber` service to send a message, the callout would never fail and throw an exception even if the parameters was incorrect. This is fixed, now the invalid callout will cause the exception, same as for the `Telegram` bot service.

---

# 2.0

The package documentation and demo videos are in the [docs folder](https://github.com/IlyaMatsuev/Apex-ChatBot-Hub/tree/main/docs).

The package supports `Telegram` and `Viber` bots.

Please follow the instructions in the README to understand how to install and use the library.

Best Regards!

---

# 1.0

The package documentation and demo videos are in the [docs folder](https://github.com/IlyaMatsuev/Apex-Bot-Lib/tree/main/docs).

The package supports only `Telegram` bots for now, but it's also planned to support other messengers.

Please follow the instructions in the README to understand how to install and use the library.

Best Regards!
