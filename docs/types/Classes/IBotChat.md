# IBotChat

Describes the chat payload received as an update from a bot

## Methods

### `global String getId()`

Returns the chat external id

#### Returns

| Type     | Description          |
| -------- | -------------------- |
| `String` | The chat external id |

### `global String getTitle()`

Returns the chat title

#### Returns

| Type     | Description    |
| -------- | -------------- |
| `String` | The chat title |

### `global IBotUser getSender()`

Returns the payload of the user who wrote the message received in the update

#### Returns

| Type       | Description                                                          |
| ---------- | -------------------------------------------------------------------- |
| `IBotUser` | The instance of the [IBotUser](/types/Classes/IBotUser.md) interface |

---
