# ViberSendVideoOptions

The wrapper class that represents optional parameters for sending a video via the `Viber` bot service

## Constructors

### `global ViberSendVideoOptions()`

Creates an instance of [ViberSendVideoOptions](/types/Classes/ViberSendVideoOptions.md) without initializing options

### `global ViberSendVideoOptions(String caption, Integer size, Integer duration, String thumbnail)`

Creates an instance of [ViberSendVideoOptions](/types/Classes/ViberSendVideoOptions.md) with the provided options

#### Parameters

| Param       | Description                                      |
| ----------- | ------------------------------------------------ |
| `caption`   | The text to attach to the video                  |
| `size`      | The size of the video in bytes. Default is 10000 |
| `duration`  | The video duration in seconds                    |
| `thumbnail` | The URL of a reduced size image (JPEG)           |

---

## Fields

### `global caption` → `String`

The text to attach to the video

### `global size` → `Integer`

The size of the video in bytes. Default is 10000

### `global duration` → `Integer`

The video duration in seconds, which will be displayed to the receiver

### `global thumbnail` → `String`

The URL of a reduced size image (JPEG)

---
