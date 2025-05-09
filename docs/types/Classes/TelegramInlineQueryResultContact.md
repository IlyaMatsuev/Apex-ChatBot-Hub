# TelegramInlineQueryResultContact

Describes the contact result payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inlinequeryresultcontact

**Inheritance**

[TelegramInlineQueryResult](/types/Classes/TelegramInlineQueryResult.md)
&gt;
TelegramInlineQueryResultContact

## Constructors

### `global TelegramInlineQueryResultContact(String id, String firstName, String phoneNumber)`

Creates a new instance of the contact inline query result with the provided result id, first name and phone number

#### Parameters

| Param         | Description                                        |
| ------------- | -------------------------------------------------- |
| `id`          | The unique identifier for the result, `1-64 bytes` |
| `firstName`   | The contact's first name                           |
| `phoneNumber` | The contact's phone number                         |

---

## Methods

### `global TelegramInlineQueryResultContact withLastName(String lastName)`

Sets the contact's last name

#### Parameters

| Param      | Description             |
| ---------- | ----------------------- |
| `lastName` | The contact's last name |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInlineQueryResultContact` | The current instance of the [TelegramInlineQueryResultContact](/types/Classes/TelegramInlineQueryResultContact.md) class |

### `global TelegramInlineQueryResultContact withVCard(String vCard)`

Sets the contact's vCard

#### Parameters

| Param   | Description         |
| ------- | ------------------- |
| `vCard` | The contact's vCard |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInlineQueryResultContact` | The current instance of the [TelegramInlineQueryResultContact](/types/Classes/TelegramInlineQueryResultContact.md) class |

### `global TelegramInlineQueryResultContact withThumbnail(String url, Integer width, Integer height)`

Sets the thumbnail for the inline result

#### Parameters

| Param    | Description          |
| -------- | -------------------- |
| `url`    | The thumbnail URL    |
| `width`  | The thumbnail width  |
| `height` | The thumbnail height |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInlineQueryResultContact` | The current instance of the [TelegramInlineQueryResultContact](/types/Classes/TelegramInlineQueryResultContact.md) class |

### `global TelegramInlineQueryResultContact withInlineKeyboard(TelegramInlineKeyboardMarkupOptions keyboard)`

Sets the inline keyboard to the message

#### Parameters

| Param      | Description                                 |
| ---------- | ------------------------------------------- |
| `keyboard` | The inline keyboard attached to the message |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInlineQueryResultContact` | The current instance of the [TelegramInlineQueryResultContact](/types/Classes/TelegramInlineQueryResultContact.md) class |

### `global TelegramInlineQueryResultContact withInputMessage(TelegramInputMessageContent messageContent)`

Sets the content of the message to be sent instead of the contact

#### Parameters

| Param            | Description                           |
| ---------------- | ------------------------------------- |
| `messageContent` | The content of the message to be sent |

#### Returns

| Type                               | Description                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `TelegramInlineQueryResultContact` | The current instance of the [TelegramInlineQueryResultContact](/types/Classes/TelegramInlineQueryResultContact.md) class |

---
