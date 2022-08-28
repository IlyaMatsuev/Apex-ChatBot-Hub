# Apex Bot Lib

[![Scratch org CI](https://github.com/IlyaMatsuev/Apex-Bot-Lib/actions/workflows/scratch-org-ci.yml/badge.svg)](https://github.com/IlyaMatsuev/Apex-Bot-Lib/actions/workflows/scratch-org-ci.yml)
[![codecov](https://codecov.io/gh/IlyaMatsuev/Apex-Bot-Lib/branch/main/graph/badge.svg?token=BFDV73QRJW)](https://codecov.io/gh/IlyaMatsuev/Apex-Bot-Lib)

The Salesforce Apex package for quick configuration and managing chatbots (Telegram, Viber, etc.) and their data. You can configure a Salesforce organization as a server for your chatbot and add your Apex implementation to reply to users. This package also stores chats' information (users, messages) that interact with your bot.

Right now this package contains implementation for Telegram messenger bots only (only `message` updates). Other messengers will be supported later.

NOTE: This package deploys the new Force.com site to have a public REST API for chatbots' webhooks.

## Prerequisites

Before taking any steps on this library you first need to create the bot in the messenger itself (this is out of the scope of this package).

For example, for `Telegram` you can create a bot following [these steps](https://core.telegram.org/bots#3-how-do-i-create-a-bot). All you need to get is the bot `authentication token`.

If you got your token then you can proceed with the library.

## Overview

If you want to create a new bot then after installing the package you first need to create a simple bot handler. This is a class that implements `IBotHandler`, it will be called when your bot receives a new update from users. For example a new message.

Let's make your bot to reply to the user with the same message:

```java
public class TestTelegramMessageHandler implements IBotHandler {
    public void handle(BotContext context) {
        // Get message from the received update
        String receivedMessage = context.received.message.text;
        System.debug('Received: ' + receivedMessage);
        // Reply to the same user sending a message back
        context.reply.send(receivedMessage);
    }
}
```

Next, you can go to the `Bots` application (which should be installed with the package) and click the `Bots` tab. There you can click `New` and fill in all required details:

-   Name: Any name you want for your bot to be displayed in Salesforce
-   Type: Bot messenger type. _Right now only `Telegram` is supported_
-   Token: The authentication token that you should have received before when created a bot
-   Handler: The name of the handler class that you created before. In this example it's `TestTelegramMessageHandler`

Wait a minute after that and refresh the list view to make sure the bot record is created and has not disappeared. If it is then perhaps the token was copied wrong, so try again.

If the bot record is still there then... That's it! The bot should be ready to work.

You can also check out the [demos folder](docs/demos/) to see how to do that visually.

## Installation

Unfortunately, it's not possible to install this library as a Salesforce package because of the complicated deployment steps.

However, you can run this schell script to create a new scratch org with the package:

```sh
./scripts/pkg-from-scratch.sh <devhub-username> <scratch-alias>
```

Or if you want to install the package to the existing org or sandbox:

1. You have to set up the subdomain for your org:

```
Setup -> Type "Sites" in the left search box -> Sites -> Choose a name for your subdomain and register it
```

2. Then you can run this script:

```sh
./scripts/pkg-deploy.sh <org-username>
```

## Configuration

No configuration is required for the package out-of-the-box. However, you can configure a chatbot API URL via the `BotSetting__mdt` custom metadata type.

## Documentation

For more detailed information about the content of the repository and the package, please visit the [docs folder](docs).

## Questions

If you have any questions you can start a discussion.  
If you think something works not as expected or you want to request a new feature, you can create an issue with the appropriate template selected.

## Contributing

Pull requests are welcome.  
For major changes, please open an issue first to discuss what you would like to change.  
Please make sure to update tests as appropriate.

## License

[MIT](LICENSE)
