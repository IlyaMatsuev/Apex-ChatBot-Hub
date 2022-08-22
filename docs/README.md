# Documentation

## Demos

Please check out the [demos folder](demos) to see how to use the package and what is available in it.

## Type Definitions

All classes available for use can be found [here](types). There is also a short description of their purpose and class members.

## Custom Metadata Types

_There is no need to configure anything for this package to work_. However, there is one custom metadata type that can be updated.

### BotSetting\_\_mdt

Contains settings specific for each messenger.

-   `DeveloperName` - Bot type, e.g. `Telegram` or `Viber`
-   `ApiUrl__c` - Bot API endpoint. For example, for `Telegram` it is https://api.telegram.org/bot
