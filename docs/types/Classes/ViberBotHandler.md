# abstract ViberBotHandler

The class designed for handling webhook events specifically for `Viber` bots

**Implemented types**

[IBotHandler](/types/Interfaces/IBotHandler.md)

## Methods

### `global virtual void onSubscribe(ViberBotContext context, ViberSubscribedEvent event)`

The method that is called when a user subscribed to the bot in `Viber`

#### Parameters

| Param     | Description                                                                                                                |
| --------- | -------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Viber` bot context                                                                                                    |
| `event`   | The instance of [ViberSubscribedEvent](/types/Classes/ViberSubscribedEvent.md) class, describing the subscribed user event |

### `global virtual void onUnsubscribe(ViberBotContext context, ViberMessageEvent event)`

The method that is called when a user unsubscribed from the bot in `Viber`

#### Parameters

| Param     | Description                                                                                                            |
| --------- | ---------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Viber` bot context                                                                                                |
| `event`   | The instance of [ViberMessageEvent](/types/Classes/ViberMessageEvent.md) class, describing the unsubscribed user event |

### `global virtual void onMessageDelivered(ViberBotContext context, ViberMessageEvent event)`

The method that is called when a message sent to a user has been successfully delivered

#### Parameters

| Param     | Description                                                                                                            |
| --------- | ---------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Viber` bot context                                                                                                |
| `event`   | The instance of [ViberMessageEvent](/types/Classes/ViberMessageEvent.md) class, describing the delivered message event |

### `global virtual void onMessageSeen(ViberBotContext context, ViberMessageEvent event)`

The method that is called when a message sent to a user has been seen by the user. Received only once even for multiple messages or devices

#### Parameters

| Param     | Description                                                                                               |
| --------- | --------------------------------------------------------------------------------------------------------- |
| `context` | The `Viber` bot context                                                                                   |
| `event`   | The instance of [ViberMessageEvent](/types/Classes/ViberMessageEvent.md) class, describing the seen event |

### `global virtual void onMessageFailed(ViberBotContext context, ViberMessageFailedEvent event)`

The method that is called when a message sent to a user has failed to be delivered

#### Parameters

| Param     | Description                                                                                                                     |
| --------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Viber` bot context                                                                                                         |
| `event`   | The instance of [ViberMessageFailedEvent](/types/Classes/ViberMessageFailedEvent.md) class, describing the failed message event |

### `global abstract void onMessageReceived(ViberBotContext context, ViberMessageReceivedEvent event)`

The method that is called when a new message is received from a user

#### Parameters

| Param     | Description                                                                                                                           |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The `Viber` bot context                                                                                                               |
| `event`   | The instance of [ViberMessageReceivedEvent](/types/Classes/ViberMessageReceivedEvent.md) class, describing the received message event |

### `global void handle(IBotContext context)`

The common handler for all webhook event types

#### Parameters

| Param     | Description                                                                                                                                                               |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `context` | The context variable that contains all necessary methods for handling the incoming update. The instance of the [ViberBotContext](/types/Classes/ViberBotContext.md) class |

---
