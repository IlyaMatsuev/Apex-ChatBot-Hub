# IBotHandler

`APIVERSION: 55`

`STATUS: ACTIVE`

The interface that is required to implement for creating new `Bot__c` records

**Group** Interfaces

## Methods

### `handle(BotContext context)`

Handles the incoming events for a bot. For example new message from a user

#### Parameters

| Param     | Description                                                                                   |
| --------- | --------------------------------------------------------------------------------------------- |
| `context` | The context variable that contains all necessary information for handling the incoming update |

---