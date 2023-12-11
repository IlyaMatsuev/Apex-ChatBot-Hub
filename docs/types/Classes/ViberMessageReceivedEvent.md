# ViberMessageReceivedEvent

Describes the `Viber` bot payload received when the new message is received from a user.
Source: https://developers.viber.com/docs/api/rest-bot-api/#receive-message-from-user

**Inheritance**

[ViberMessageEvent](/types/Classes/ViberMessageEvent.md)
&gt;
ViberMessageReceivedEvent

## Properties

### `message` → `ViberMessage`

The message details

### `messageToken` → `String`

_Inherited_

The unique identifier of the related message

### `sender` → `ViberUser`

The sender's user information

### `timestamp` → `DateTime`

_Inherited_

The event date and time

### `userId` → `String`

_Inherited_

The sender's `Viber` user id

---
