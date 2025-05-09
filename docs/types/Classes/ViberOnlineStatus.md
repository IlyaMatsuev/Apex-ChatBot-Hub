# ViberOnlineStatus

Describes the online status payload received as result of `Viber` `getOnline` method

**Inheritance**

ViberOnlineStatus

## Properties

### `global id` → `String`

The unique `Viber` user id

### `global onlineStatus` → `Integer`

The online status code.

- `0` - online
- `1` - offline
- `2` - undisclosed - user set Viber to hide status
- `3` - try later - internal error
- `4` - unavailable - not a Viber user / unsubscribed / unregistered

### `global onlineStatusMessage` → `String`

The online status message

---
