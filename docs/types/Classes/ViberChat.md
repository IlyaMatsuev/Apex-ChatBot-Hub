# ViberChat

Describes the chat payload received as an update from a `Viber` bot

**Inheritance**

ViberChat

**Implemented types**

[IBotChat](/types/Classes/IBotChat.md)

## Methods

### `global String getId()`

Returns the `Viber` chat id

#### Returns

| Type     | Description         |
| -------- | ------------------- |
| `String` | The `Viber` chat id |

### `global String getTitle()`

Returns the chat title

#### Returns

| Type     | Description    |
| -------- | -------------- |
| `String` | The chat title |

### `global ViberUser getSender()`

Returns the payload of the `Viber` user who wrote the message received in the update

#### Returns

| Type        | Description                                                        |
| ----------- | ------------------------------------------------------------------ |
| `ViberUser` | The instance of the [ViberUser](/types/Classes/ViberUser.md) class |

---
