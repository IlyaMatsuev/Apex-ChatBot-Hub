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

### Readonly permission set

For users, who only need to work with the data captured by bots, there's now a `Bot Readonly User` permission set.

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

### Support attaching a custom keyboard to a message

If you want your users to have predefined options to choose as a reply on your bot's messages, you can use custom keyboard for both `Viber` and `Telegram` bots. Here is how you can have a generic implementataion for both messangers:

```java
// Pass the `bot` instance to the factory and create a service (doesn't matter if it's `Viber` or `Telegram` bot)
IBotService service = new BotServiceFactory().createBotService(bot);

// Prepare the list of buttons
List<BotReplyKeyboardButton> replyButtons = new List<BotReplyKeyboardButton> {
    new BotReplyKeyboardButton('Share my contact ☎️').shareContact(),
    new BotReplyKeyboardButton('Share my location 📍').shareLocation(),
    new BotReplyKeyboardButton('I do not wanna share anything 😤')
};

// The `botUserId` is the if of the user to whom you want to send the message
service.send(botUserId).withReplyKeyboard(replyButtons).text('Some informative message!');
```

That's it. Now the user is going to receive a text message with the 3 buttons as the options for response. And it works in the same way for both `Viber` and `Telegram`!

However, `Viber` and `Telegram` keyboards are pretty much different and support different features. So, if you want to use something specific for either of these messangers you should use `TelegramBotService` and `TelegramSendKeyboardOptions`, or `ViberBotService` and `ViberSendKeyboardOptions` via the `withReplyKeyboard` method. More information about these classes can be found [here](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types).

## What's Changed

### BotAdmin users are now able to see encrypted data

Due to some technical limitation it was necessary to give the permission to the `BotAdmin` permission set to be able to see the encrypted data, which means that the bots' tokens are now going to be visible for them. So, please assign that permission set carefully!

### Fix for an issue when Telegram Message Id was not unique

Due to the format the telegram message ids are generated there was a possibility of the duplicated external id. That should be the case anymore.

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
