# ViberSendFileOptions

The wrapper class that represents optional parameters for sending a file via the `Viber` bot service

## Constructors

### `ViberSendFileOptions()`

Creates an instance of [ViberSendFileOptions](/types/Classes/ViberSendFileOptions.md) without initializing options

### `ViberSendFileOptions(String caption, String fileName, Integer size)`

Creates an instance of [ViberSendFileOptions](/types/Classes/ViberSendFileOptions.md) with the provided options

#### Parameters

| Param      | Description                                                                |
| ---------- | -------------------------------------------------------------------------- |
| `caption`  | The text to attach to the file                                             |
| `fileName` | The name of the file to be shown to the receiver. Should include extension |
| `size`     | The size of the file in bytes. Default is 10000                            |

---

## Fields

### `caption` → `String`

The text to attach to the file

### `fileName` → `String`

The name of the file to be shown to the receiver. Should include extension

### `size` → `Integer`

The size of the file in bytes. Default is 10000

---
