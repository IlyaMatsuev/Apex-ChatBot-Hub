# TelegramInputContactMessageContent

Describes the input contact message payload that can be attached as part of answer to a `Telegram` bot inline query.
Source: https://core.telegram.org/bots/api#inputcontactmessagecontent

**Inheritance**

[TelegramInputMessageContent](/types/Classes/TelegramInputMessageContent.md)
&gt;
TelegramInputContactMessageContent

## Constructors

### `TelegramInputContactMessageContent(String firstName, String phoneNumber)`

Creates a new instance of the input message with the provided contact details

#### Parameters

| Param         | Description                |
| ------------- | -------------------------- |
| `firstName`   | The contact's first name   |
| `phoneNumber` | The contact's phone number |

---

## Methods

### `withLastName(String lastName)`

Sets the contact's last name

#### Parameters

| Param      | Description             |
| ---------- | ----------------------- |
| `lastName` | The contact's last name |

#### Return

**Type**

TelegramInputContactMessageContent

**Description**

The current instance of the [TelegramInputContactMessageContent](/types/Classes/TelegramInputContactMessageContent.md) class

### `withVCard(String vCard)`

Sets the contact's vCard

#### Parameters

| Param   | Description         |
| ------- | ------------------- |
| `vCard` | The contact's vCard |

#### Return

**Type**

TelegramInputContactMessageContent

**Description**

The current instance of the [TelegramInputContactMessageContent](/types/Classes/TelegramInputContactMessageContent.md) class

---
