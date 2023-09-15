# Documentation

## Changelog

Check out the [changelog](/changelog) to see the latest changes in the project.

## Demos

Please check out the [demos page](/demos) to see how to use the package and what is available in it.

## Type Definitions

All classes available for use can be found [here](/types). There is also a short description of their purpose and class members.

## Custom Metadata Types

_There is no need to configure anything for this package to work_. However, there is one custom metadata type that can be updated (**do that only if you know what you're doing**).

### BotSetting\_\_mdt

Contains settings specific for each messenger.

-   `DeveloperName` - Bot type, e.g. `Telegram` or `Viber`
-   `ApiUrl__c` - Bot API endpoint. For example, for `Telegram` it is https://api.telegram.org/bot
-   `BotService__c` - The bot service implementation for particular messanger.
-   `BotCalloutService__c` - The bot service implementation for sending requests and handling responses for bot APIs.
-   `BotWebhookService__c` - The bot service implementation for particular messanger that handles webhooks set and unset.
-   `BotHandlerContext__c` - The bot context model implementation that will be passed to the handler on the incoming bot updates
-   `BotUpdateResolver__c` - The implementation for particular messanger to resolve the `Bot__c` record on the new webhook update.
