# Apex Bot Lib

[![Validation](https://github.com/IlyaMatsuev/Apex-ChatBot-Hub/actions/workflows/validation.yml/badge.svg)](https://github.com/IlyaMatsuev/Apex-ChatBot-Hub/actions/workflows/validation.yml)
[![codecov](https://codecov.io/gh/IlyaMatsuev/Apex-ChatBot-Hub/branch/main/graph/badge.svg?token=BFDV73QRJW)](https://codecov.io/gh/IlyaMatsuev/Apex-ChatBot-Hub)

The Salesforce Apex package for quick configuration and managing chatbots (Telegram, Viber, etc.) and their data. You can configure a Salesforce organization as a server for your chatbot and add your Apex implementation as a message handler to reply to users. This package also automatically stores information about chats and messages of the users who interact with the bot.

Right now this package contains implementations for `Telegram` and `Viber` messengers' bots.

> NOTE: This package deploys the new Force.com site to have a public REST API for chatbots' webhooks.

## 🤔 Prerequisites

Before taking any steps on this library you first need to create the bot in the messenger itself (this is out of the scope of this package).

For example, for `Telegram` you can create a bot following [these steps](https://core.telegram.org/bots#3-how-do-i-create-a-bot). To create a chatbot for the `Viber` messenger you should follow [these instructions](https://developers.viber.com/docs/api/rest-bot-api/#get-started).  
All you need to get is the bot `authentication token`.

If you got your token then you can proceed with installation and bot configuration.

## 🔍 Overview

If you want to create a new bot then after installing the package (_which is described one topic below_) you first need to create a simple bot handler. This is a class that implements `IBotHandler`, it will be called when your bot receives a new update from users. For example a new message.

Let's make your bot to reply to the user with the same message:

```java
public class TestMessageHandler implements IBotHandler {
    public void handle(IBotContext context) {
        // Get message from the received update
        String receivedMessage = context.getUpdateEvent().getMessage()?.getText();

        // Check if this update contains some text (it can be a media message or some other update type)
        if (String.isNotBlank(receivedMessage)) {
            System.debug('Received: ' + receivedMessage);
            // Reply to the same user sending a message back
            context.reply().text(receivedMessage);
        }
    }
}
```

Next, you can go to the `Bot Hub` application (which should be installed with the package) and click the `Bots` tab. There you can click `New` and fill in all required details:

- Name: Any name you want for your bot to be displayed in Salesforce
- Type: Bot messenger type (e.g. `Telegram` or `Viber`).
- Webhook Events: The list of the event types that should be handled by the bot webhook, e.g. on Message or on Edit Message (different for every bot type)
- Token: The authentication token that you should have received before, when created a bot
- Handler: The name of the handler class that you created before. In this example it is `TestMessageHandler`

Create a bot, wait a few seconds and make sure that the webhook configuration component is green. If it isn't it means that the webhook was not set and there is some problem. Usualy this happens because the bot token was not correct.

That's it! The bot should be ready for work.

You can also check out [the demos page](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/demos) to see how to do that visually.

Apart from `IBotHandler` interface you can also use [`TelegramBotHandler`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types?id=telegrambothandler) or [`ViberBotHandler`](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/types?id=viberbothandler) abstract classes to create a bot handler for a specific messanger. This way you will benefit from using `Telegram` or `Viber` API more intuitively with predefined types.

## 🚀 Installation

Unfortunately, it's not possible to install this library as a Salesforce package because of the complicated deployment steps.

However, you can run this shell script to create a **new scratch org** with the package:

```sh
./scripts/pkg-from-scratch.sh <devhub-username> <scratch-alias>
```

Or if you want to install the package to the **existing org or sandbox**:

1. You have to set up the subdomain for your org:

```
Setup -> Type "Sites" in the left search box -> Sites -> Choose a name for your subdomain and register it
```

2. Then you can run this script:

```sh
./scripts/pkg-deploy.sh <org-username>
```

**NOTE**: For macOS or Linux shell scripts can be run using `sh` command like this:

```sh
sh <path to the shell script>
```

## 📝 Documentation

For more detailed information about the content of the repository and the package, please visit the [documentation page](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/).

Changelog is also located [here](https://ilyamatsuev.github.io/Apex-ChatBot-Hub/#/changelog).

## ❓ Questions

If you have any questions you can start a discussion.  
If you think something works not as expected, or you want to request a new feature, you can create an issue with the appropriate template selected.

## 🤝 Contributing

Pull requests are welcome.  
For major changes, please open an issue first to discuss what you would like to change.  
Please make sure to update tests as appropriate.

## 🪪 License

[MIT](LICENSE)
