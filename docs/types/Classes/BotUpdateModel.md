# BotUpdateModel

`APIVERSION: 55`

`STATUS: ACTIVE`

Contains all the details about the incoming update: message, chat and user information

## Fields

### `chat` → `ChatModel`

The object containing all details about the chat where the update is came from

### `eventType` → `BotUpdateEventType`

The type of the incoming event. Event types are different for every bot (e.g. [TelegramBotUpdateEventType](/types/Enums/TelegramBotUpdateEventType.md) or [ViberBotUpdateEventType](/types/Enums/ViberBotUpdateEventType.md))

### `message` → `MessageModel`

The object containing all details about the message sent to the bot

---

## Classes

### ChatModel

Contains all details about the chat where the update is came from

#### Fields

##### `id` → `String`

The messanger's chat id

##### `sender` → `UserModel`

The object containing all details about the user who sent a message (or any other update) to the bot

##### `title` → `String`

The messanger's chat title. Can be either firstname + lastname or username depending on how much profile information is filled by the user

---

#### Properties

##### `isDM` → `Boolean`

Evaluates `true` if the current update is coming from the private chat (direct message)

---

### Command

Contains the details about the command sent to the bot

#### Fields

##### `name` → `String`

The command's name. The first word coming after the "/" sign

##### `params` → `List&lt;String&gt;`

The command's parameters. All words separated with space coming after the command name

---

### MessageModel

Contains all details about the message sent to the bot

#### Fields

##### `id` → `String`

The messanger's message id

##### `sentAt` → `DateTime`

At what time the message has been sent

##### `text` → `String`

The incoming message text

---

#### Properties

##### `command` → `Command`

The object containing the details about the incoming command. Works if the user sends a message starting with the "/" sign

---

### UserModel

Contains all details about the the user who sent a message (or any other update) to the bot

#### Fields

##### `firstName` → `String`

The messanger's user firstname

##### `id` → `String`

The messanger's user id

##### `lastName` → `String`

The messanger's user lastname

##### `username` → `String`

The messanger's user unique username

---

---
