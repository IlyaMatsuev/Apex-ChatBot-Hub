# ViberUser

Describes the sender payload received as an update from a `Viber` bot

**Inheritance**

ViberUser

**Implemented types**

[IBotUser](/types/Classes/IBotUser.md)

## Properties

### `global id` → `String`

The unique `Viber` user id

### `global name` → `String`

The user’s `Viber` name

### `global avatar` → `String`

The URL of user’s avatar

### `global country` → `String`

The user’s 2 letter country code

### `global language` → `String`

The user’s phone language

### `global apiVersion` → `Integer`

The max API version, matching the most updated user’s device

---

## Methods

### `global String getId()`

Returns the `Viber` user id

#### Returns

| Type     | Description         |
| -------- | ------------------- |
| `String` | The `Viber` user id |

### `global String getFirstName()`

Returns the `Viber` user first name

#### Returns

| Type     | Description                 |
| -------- | --------------------------- |
| `String` | The `Viber` user first name |

### `global String getLastName()`

Returns the `Viber` user last name

#### Returns

| Type     | Description                |
| -------- | -------------------------- |
| `String` | The `Viber` user last name |

### `global String getUsername()`

Returns the `Viber` user id since there are no usernames

#### Returns

| Type     | Description         |
| -------- | ------------------- |
| `String` | The `Viber` user id |

---
