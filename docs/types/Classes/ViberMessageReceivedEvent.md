# ViberMessageReceivedEvent

Describes the `Viber` bot payload received when the new message is received from a user.
Source: https://developers.viber.com/docs/api/rest-bot-api/#receive-message-from-user

**Inheritance**

[ViberMessageEvent](/types/Classes/ViberMessageEvent.md)
&gt;
ViberMessageReceivedEvent

## Properties

### `global sender` → `ViberUser`

The sender's user information

### `global message` → `ViberMessage`

The message details

### `global messageToken` → `String`

_Inherited_

The unique identifier of the related message

### `global timestamp` → `DateTime`

_Inherited_

The event date and time

### `global userId` → `String`

_Inherited_

The sender's `Viber` user id

---
