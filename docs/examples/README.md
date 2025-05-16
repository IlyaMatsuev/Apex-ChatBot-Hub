# Examples

This package can be used in two ways: generic and specific.

When you use generic one, it means that you can reuse the same bot handlers for all bots of any types (`Telegram` and `Viber`). This way you can only access features that are common for all bots, e.g. sending and receiving messages, receiving information about chats and users. For that type of handler you should implement [`IBotHandler`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types?id=ibothandler) interface.

The _"specific"_ way means that you create a bot handler that is meant to be used for a specific bot type only: `Telegram` or `Viber`. In this case you can access features of a particular bot API, like handling messages edit (`Telegram`) or handling when a message is seen by the users (`Viber`). For that type of handler you should extend either [`TelegramBotHandler`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types?id=telegrambothandler) or [`ViberBotHandler`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types?id=viberbothandler) classes.

> I highly recommend checking [the types documentation](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types) to see what other methods and fields are available in classes that are shown in the examples below.

- [Generic: Handle New Message](#generic-handle-new-message)
- [Telegram: Handle New Message](#telegram-handle-new-message)
- [Telegram: Handle Edited Message](#telegram-handle-edited-message)
- [Telegram: Send New Message](#telegram-send-new-message)
- [Viber: Handle New Message](#viber-handle-new-message)
- [Viber: Handle Subscribe](#viber-handle-subscribe)
- [Viber: Send New Message](#viber-send-new-message)

## Generic: Handle New Message

The example of the handler that receives text messages and sends them back to the sender (make sure the `Message` webhook event was selected for the bot that you are using):

```java
public class TestMessageHandler implements IBotHandler {
    public void handle(IBotContext context) {
        // Get message from the received update
        String receivedMessage = context.getUpdateEvent().getMessage()?.getText();

        // Check if this update contains some text (it can be a media message or some other update type)
        if (String.isNotBlank(receivedMessage)) {
            // Reply to the same user sending a message back
            context.reply().text('Received: ' + receivedMessage);
        }
    }
}
```

---

## Telegram: Handle New Message

The example of the `Telegram` handler that receives text messages and sends them back to the sender (make sure the `Message` webhook event was selected for the bot that you are using):

```java
public class TestTelegramMessageHandler extends TelegramBotHandler {
    public override void onMessageReceived(TelegramBotContext context, TelegramMessageEvent event) {
        // Get message from the received update
        String receivedMessage = event.text;

        // Check if this update contains some text (it can be a media message or some other update type)
        if (String.isNotBlank(receivedMessage)) {
            // Reply to the same user sending a message back
            context.reply().text('Received: ' + receivedMessage);
        }
    }
}
```

---

## Telegram: Handle Edited Message

The example of the `Telegram` handler that receives updates on text messages' edits and sends them back to the sender (make sure the `Edited Message` webhook event was selected for the bot that you are using):

```java
public class TestTelegramMessageHandler extends TelegramBotHandler {
    public override void onMessageReceived(TelegramBotContext context, TelegramMessageEvent event) {
        // Not needed in this example but this method is required to implement
    }

    public override void onMessageEdited(TelegramBotContext context, TelegramMessageEvent event) {
        // Get the edited message text
        String editedMessage = event.text;

        // Check if this update contains some text (it can be a media message or some other update type)
        if (String.isNotBlank(editedMessage)) {
            // Reply to the same user
            context.reply().text('Stop editing messages! You changed: ' + editedMessage);
        }
    }
}
```

---

## Telegram: Send New Message

The example of sending a new message to a user by the `Telegram` bot using the [`TelegramBotService`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types?id=telegrambotservice):

```java
// Select your bot record that you want to use to send a message
Bot__c tgBot = [
    SELECT Id, Name, Type__c, Handler__c, Token__c, TokenHash__c
    FROM Bot__c
    LIMIT 1
];
// Provide the telegram id of the chat where the message should be sent. Chat Id is captured as ExternalId__c of User__c records when users send messages to the bot
String chatId = '12345';

// Create a new service factory that will be used for bot service creation
BotServiceFactory serviceFactory = new BotServiceFactory();
// Create the bot service for the provided Bot__c record
TelegramBotService tgService = (TelegramBotService) serviceFactory.createBotService(new BotModel(tgBot));

// Send a text message (other message types are also supported, please check types documentation for more information)
tgService.send(chatId).text('Hello from the bot!');
```

---

## Viber: Handle New Message

The example of the `Viber` handler that receives text messages and sends them back to the sender (make sure the `Message` webhook event was selected for the bot that you are using):

```java
public class TestViberMessageHandler extends ViberBotHandler {
    public override void onMessageReceived(ViberBotContext context, ViberMessageReceivedEvent event) {
        // Get message from the received update
        String receivedMessage = event.message.text;

        // Check if this update contains some text (it can be a media message or some other update type)
        if (String.isNotBlank(receivedMessage)) {
            // Reply to the same user sending a message back
            context.reply().text('Received: ' + receivedMessage);
        }
    }
}
```

---

## Viber: Handle Subscribe

The example of the `Viber` handler that receives updates when users subscribe to the bot and sends them greeting text message (make sure the `Subscribed` webhook event was selected for the bot that you are using):

```java
public class TestViberMessageHandler extends ViberBotHandler {
    public override void onMessageReceived(ViberBotContext context, ViberMessageReceivedEvent event) {
        // Not needed in this example but this method is required to implement
    }

    public override void onSubscribe(ViberBotContext context, ViberSubscribedEvent event) {
        // Get user's name from the received update
        String userName = event.user.name;

        // Reply to the user
        context.reply().text('Hi! Nice to meet you ' + userName + '!');
    }
}
```

---

## Viber: Send New Message

The example of sending a new message to a user by the `Viber` bot using the [`ViberBotService`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types?id=viberbotservice):

```java
// Select your bot record that you want to use to send a message
Bot__c vbBot = [
    SELECT Id, Name, Type__c, Handler__c, Token__c, TokenHash__c
    FROM Bot__c
    LIMIT 1
];
// Provide the viber id of the chat where the message should be sent. Chat Id is captured as ExternalId__c of User__c records when users send messages to the bot
String chatId = '12345';

// Create a new service factory that will be used for bot service creation
BotServiceFactory serviceFactory = new BotServiceFactory();
// Create the bot service for the provided Bot__c record
ViberBotService vbService = (ViberBotService) serviceFactory.createBotService(new BotModel(vbBot));

// Send a text message (other message types are also supported, please check types documentation for more information)
vbService.send(chatId).text('Hello from the bot!');
```
