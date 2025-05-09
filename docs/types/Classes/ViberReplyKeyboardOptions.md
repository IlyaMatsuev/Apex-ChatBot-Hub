# ViberReplyKeyboardOptions

The builder-like class that represents parameters for sending a custom carousel/keyboard to the user via the `Viber` bot service.
Source: https://developers.viber.com/docs/tools/keyboards/#general-keyboard-parameters

**Inheritance**

ViberReplyKeyboardOptions

## Constructors

### `global ViberReplyKeyboardOptions()`

Creates an instance of the carousel/keyboard without any buttons, so that they can be added separately

### `global ViberReplyKeyboardOptions(List<Button> buttons)`

Creates an instance of the carousel/keyboard with the provided buttons

#### Parameters

| Param     | Description                                                                                                                               |
| --------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `buttons` | The list of [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instances that represent buttons to be shown to the user |

---

## Properties

### `global buttons` → `List<Button>`

The list of buttons to be shown to the receiver

---

## Methods

### `global ViberReplyKeyboardOptions addButton(Button button)`

Adds a button to the carousel/keyboard

#### Parameters

| Param    | Description                                                                                                                                |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `button` | The instance of the [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) class, representing a button to add to the layout |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `ViberReplyKeyboardOptions` | The current [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) instance |

### `global ViberReplyKeyboardOptions addButtons(Button buttons)`

Adds multiple buttons to the carousel/keyboard

#### Parameters

| Param     | Description                                                                                                                                        |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `buttons` | The list of instances of the [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) class, representing buttons to add to the layout |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `ViberReplyKeyboardOptions` | The current [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) instance |

### `global ViberReplyKeyboardOptions setLayout(Integer groupRows, Integer groupColumns)`

Sets the size of carousel/keyboard block for grouping buttons on the layout

#### Parameters

| Param          | Description                                                                                                           |
| -------------- | --------------------------------------------------------------------------------------------------------------------- |
| `groupRows`    | The number of button row groups. Accepts numbers in range: `1..7`. Default is `7` for carousels and `2` for keyboards |
| `groupColumns` | The number of button column groups. Accepts numbers in range: `1..6`. Default is `6`                                  |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `ViberReplyKeyboardOptions` | The current [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) instance |

### `global ViberReplyKeyboardOptions setBackgroundColor(String backgroundColor)`

Sets the background color of the carousel/keyboard

#### Parameters

| Param             | Description                                             |
| ----------------- | ------------------------------------------------------- |
| `backgroundColor` | The HEX value of the carousel/keyboard background color |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `ViberReplyKeyboardOptions` | The current [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) instance |

### `global ViberReplyKeyboardOptions setHeight(Integer customDefaultHeight, Integer heightScale, Boolean useDefaultHeight)`

#### Parameters

| Param                 | Description                                                                                                                                                                                 |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `customDefaultHeight` | How much percent of free screen space in chat should be taken by keyboard. The final height will not be less than height of the system keyboard. Accepts numbers in range: `40..70`         |
| `heightScale`         | Scales the height of the default square block (which is defined on client side) to the given value in percents. Accepts numbers in range: `20..100`. Default is `100`                       |
| `useDefaultHeight`    | When `true` the keyboard will be displayed with the same height as the native keyboard. When `false` short keyboards will be displayed with the minimal possible height. Default is `false` |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `ViberReplyKeyboardOptions` | The current [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) instance |

**Descriptions** Sets the height configurations for the carousel/keyboard

### `global ViberReplyKeyboardOptions setInputFieldState(String inputFieldState)`

Customizes the receiver's keyboard input field

#### Parameters

| Param             | Description                                                             |
| ----------------- | ----------------------------------------------------------------------- |
| `inputFieldState` | Possible values: `regular`, `minimized`, `hidden`. Default is `regular` |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `ViberReplyKeyboardOptions` | The current [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) instance |

### `global ViberReplyKeyboardOptions allowSaveToFavorites(FavoritesMetadata favoritesMetadata)`

Allows the carousel/keyboard content to be saved by the receiver

#### Parameters

| Param               | Description                                                                                                                                                                     |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `favoritesMetadata` | The instance of [ViberReplyKeyboardOptions.FavoritesMetadata](ViberReplyKeyboardOptions.FavoritesMetadata) describing content to be saved via favorites, if saving is available |

#### Returns

| Type                        | Description                                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `ViberReplyKeyboardOptions` | The current [ViberReplyKeyboardOptions](/types/Classes/ViberReplyKeyboardOptions.md) instance |

---

## Classes

### Button

The wrapper class representing a button in the `Viber` carousel/keyboard. The source: https://developers.viber.com/docs/tools/keyboards/#buttons-parameters

**Inheritance**

Button

#### Methods

##### `global Button setLayout(Integer rows, Integer columns)`

Sets the button layout

###### Parameters

| Param     | Description                                                                                               |
| --------- | --------------------------------------------------------------------------------------------------------- |
| `rows`    | The button height. Accepts numbers in range: `1..7` for carousels and `1-2` for keyboards. Default is `1` |
| `columns` | The button width. Accepts numbers in range: `1..6`. Default is `6`                                        |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setBackgroundColor(String backgroundColor)`

Sets the button background color

###### Parameters

| Param             | Description                                    |
| ----------------- | ---------------------------------------------- |
| `backgroundColor` | The background color of the button (HEX value) |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setBackgroundMedia(String mediaUrl, String mediaScaleType, Boolean isGif, Boolean loopGif)`

Sets the media background for the button

###### Parameters

| Param            | Description                                                                                                            |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `mediaUrl`       | The URL for the button background media                                                                                |
| `mediaScaleType` | The options for scaling the bounds of the background to the bounds of the view. Possible values: `crop`, `fill`, `fit` |
| `isGif`          | If the passed media refer to a `.gif` file or not. Default is `false`                                                  |
| `loopGif`        | If the passed media refer to a `.gif` file, decide whether to loop it or play only once. Default is `true`             |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asNoActionButton(String buttonText)`

Makes the button to behave as an informative button without the possibility to click it

###### Parameters

| Param        | Description                        |
| ------------ | ---------------------------------- |
| `buttonText` | The text to be shown on the button |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asReply(String replyValue, String replyText)`

Makes the button to behave as a text reply from the receiver, sending a message back to the bot

###### Parameters

| Param        | Description                                                 |
| ------------ | ----------------------------------------------------------- |
| `replyValue` | The actual text value to be sent back to bot                |
| `replyText`  | The text message to appear in the chat sent by the receiver |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asReplyWithImage(String replyValue, String imageUrl)`

Makes the button to behave as an image reply from the receiver, sending a message back to the bot

###### Parameters

| Param        | Description                                                     |
| ------------ | --------------------------------------------------------------- |
| `replyValue` | The actual text value to be sent back to bot                    |
| `imageUrl`   | The URL of the image to appear in the chat sent by the receiver |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asOpenUrl(String url)`

Makes the button to behave as a link to a website, sending the clicked link URL back to the bot

###### Parameters

| Param | Description                                                                                           |
| ----- | ----------------------------------------------------------------------------------------------------- |
| `url` | The URL of the link. Will be sent back to the bot, appearing in the chat as message from the receiver |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asOpenUrl(String url, ButtonInternalBrowser internalBrowserConfig)`

Makes the button to behave as a link to a website, sending the clicked link URL back to the bot

###### Parameters

| Param                   | Description                                                                                                                                                                         |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `url`                   | The URL of the link. Will be sent back to the bot, appearing in the chat as message from the receiver                                                                               |
| `internalBrowserConfig` | The instance of [ViberReplyKeyboardOptions.ButtonInternalBrowser](ViberReplyKeyboardOptions.ButtonInternalBrowser) class describing configurations for the `Viber` internal browser |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asOpenUrl(String url, String mediaType, ButtonMediaPlayer mediaPlayerConfig, ButtonInternalBrowser internalBrowserConfig)`

Makes the button to behave as a link to a website or a media content, sending the clicked link URL back to the bot

###### Parameters

| Param                   | Description                                                                                                                                                                         |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `url`                   | The URL of the link or media. Will be sent back to the bot, appearing in the chat as message from the receiver                                                                      |
| `mediaType`             | The type of the content under the provided link. Possible values: `not-media`, `video`, `gif`, `picture`. Default is `not-media`                                                    |
| `mediaPlayerConfig`     | The instance of [ViberReplyKeyboardOptions.ButtonMediaPlayer](ViberReplyKeyboardOptions.ButtonMediaPlayer) class describing configurations for the `Viber` media player             |
| `internalBrowserConfig` | The instance of [ViberReplyKeyboardOptions.ButtonInternalBrowser](ViberReplyKeyboardOptions.ButtonInternalBrowser) class describing configurations for the `Viber` internal browser |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asOpenMap(Decimal latitude, Decimal longitude)`

Makes the button to behave as a link to a location on a map, sending the picked location to the bot

###### Parameters

| Param       | Description                   |
| ----------- | ----------------------------- |
| `latitude`  | The latitude of the location  |
| `longitude` | The longitude of the location |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asPhoneSharing(String text)`

Makes the button to behave as a button to share the receiver's phone number. Only available for keyboard

###### Parameters

| Param  | Description                             |
| ------ | --------------------------------------- |
| `text` | The button text to be shown to the user |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button asLocationSharing(String text)`

Makes the button to behave as a button to share the receiver's location. Only available for keyboard

###### Parameters

| Param  | Description                             |
| ------ | --------------------------------------- |
| `text` | The button text to be shown to the user |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setText(String text)`

Sets the button text

###### Parameters

| Param  | Description                                                                                                                                                                                         |
| ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `text` | The text to be displayed on the button. Can contain such HTML tags as: `&lt;b&gt;`, `&lt;i&gt;`, `&lt;u&gt;`, `<br>`, `&lt;s&gt;` and `&lt;font size="N" color="#7F00FF"&gt;`. Max `250` characters |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setTextAlignment(String verticalAlign, String horizontalAlign)`

Sets the button text vertical and horizontal alignment

###### Parameters

| Param             | Description                                                                                           |
| ----------------- | ----------------------------------------------------------------------------------------------------- |
| `verticalAlign`   | The vertical alignment of the text. Possible values: `top`, `middle`, `bottom`. Default is `middle`   |
| `horizontalAlign` | The horizontal alignment of the text. Possible values: `left`, `center`, `right`. Default is `center` |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setTextPaddings(Integer top, Integer right, Integer bottom, Integer left)`

Sets the button text paddings. Accepts numbers in range: `0..12`. Default is `[12, 12, 12, 12]`

###### Parameters

| Param    | Description     |
| -------- | --------------- |
| `top`    | The top padding |
| `right`  | The top padding |
| `bottom` | The top padding |
| `left`   | The top padding |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setTextStyle(Integer opacity, String size, String bgGradientColor, Boolean fitText)`

Applies additional styling properties to the button text

###### Parameters

| Param             | Description                                                                                                            |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `opacity`         | The text opacity. Accepts numbers in range: `0..100`. Default is `100`                                                 |
| `size`            | The text size. Possible values: `small`, `regular`, `large`. Default is `regular`                                      |
| `bgGradientColor` | The background gradient to use under text (HEX value). Works only when text is aligned vertically to `top` or `bottom` |
| `fitText`         | If set to `true` the size of the text will be decreased to fit (minimum size is `12`). Default is `false`              |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setImage(String imageUrl)`

Sets the image on top of the button's background

###### Parameters

| Param      | Description                                                       |
| ---------- | ----------------------------------------------------------------- |
| `imageUrl` | The URL of the image to be placed on top of the button background |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button setBorders(Integer borderWidth, Integer cornerRadius, String borderColor)`

Sets the borders (frame) configs for the button

###### Parameters

| Param          | Description                                                                         |
| -------------- | ----------------------------------------------------------------------------------- |
| `borderWidth`  | The width of the borders. Accepts numbers in range: `0..10`. Default is `1`         |
| `cornerRadius` | The radius of the border corners. Accepts numbers in range: `0..10`. Default is `0` |
| `borderColor`  | The color of the borders (HEX value)                                                |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button useInternalBrowser()`

Sets the setting to use the internal `Viber` browser for opening button links

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button useInternalBrowser(Boolean shouldUseInternalBrowser)`

Determines if the internal `Viber` browser should be used for opening button links

###### Parameters

| Param                      | Description                                                                                           |
| -------------------------- | ----------------------------------------------------------------------------------------------------- |
| `shouldUseInternalBrowser` | Determines if the internal `Viber` browser should be used for opening button links. Default is `true` |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

##### `global Button useSilentMode(Boolean useSilent)`

Determines whether the user action is presented in the conversation

###### Parameters

| Param       | Description                                                                             |
| ----------- | --------------------------------------------------------------------------------------- |
| `useSilent` | Determines whether the user action is presented in the conversation. Default is `false` |

###### Returns

| Type     | Description                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `Button` | The current [ViberReplyKeyboardOptions.Button](ViberReplyKeyboardOptions.Button) instance |

---

### FavoritesMetadata

The wrapper class representing carousel content to be saved via favorites bot, if saving is available. The source: https://developers.viber.com/docs/tools/keyboards/#favoritesMetadata

#### Constructors

##### `global FavoritesMetadata(String type, String url)`

Creates an instance of the favorites metadata with the provided type and url

###### Parameters

| Param  | Description                                                             |
| ------ | ----------------------------------------------------------------------- |
| `type` | The type of the served content. Possible values: `gif`, `link`, `video` |
| `url`  | The accessible URL of the content                                       |

---

#### Fields

##### `global type` → `String`

The type of the served content. Possible values: `gif`, `link`, `video`

##### `global url` → `String`

The accessible URL of the content

---

#### Methods

##### `global FavoritesMetadata setTitle(String title)`

Sets the content title

###### Parameters

| Param   | Description       |
| ------- | ----------------- |
| `title` | The content title |

###### Returns

| Type                | Description                                                                                                     |
| ------------------- | --------------------------------------------------------------------------------------------------------------- |
| `FavoritesMetadata` | The current [ViberReplyKeyboardOptions.FavoritesMetadata](ViberReplyKeyboardOptions.FavoritesMetadata) instance |

##### `global FavoritesMetadata setThumbnail(String thumbnail, Integer width, Integer height)`

Sets the thumbnail of the content with its sizes

###### Parameters

| Param       | Description                                          |
| ----------- | ---------------------------------------------------- |
| `thumbnail` | The accessible thumbnail for the content (PNG, JPEG) |
| `width`     | The width of the thumbnail image in pixels           |
| `height`    | The height of the thumbnail image in pixels          |

###### Returns

| Type                | Description                                                                                                     |
| ------------------- | --------------------------------------------------------------------------------------------------------------- |
| `FavoritesMetadata` | The current [ViberReplyKeyboardOptions.FavoritesMetadata](ViberReplyKeyboardOptions.FavoritesMetadata) instance |

##### `global FavoritesMetadata setAlternativeContent(String text, String url)`

Sets the alternative text and URL for clients with API version not supporting favorites saving

###### Parameters

| Param  | Description                      |
| ------ | -------------------------------- |
| `text` | The alternative text for the URL |
| `url`  | The alternative URL              |

###### Returns

| Type                | Description                                                                                                     |
| ------------------- | --------------------------------------------------------------------------------------------------------------- |
| `FavoritesMetadata` | The current [ViberReplyKeyboardOptions.FavoritesMetadata](ViberReplyKeyboardOptions.FavoritesMetadata) instance |

##### `global FavoritesMetadata setDomain(String domain)`

Sets the top domain of the content URL

###### Parameters

| Param    | Description                       |
| -------- | --------------------------------- |
| `domain` | The top domain of the content URL |

###### Returns

| Type                | Description                                                                                                     |
| ------------------- | --------------------------------------------------------------------------------------------------------------- |
| `FavoritesMetadata` | The current [ViberReplyKeyboardOptions.FavoritesMetadata](ViberReplyKeyboardOptions.FavoritesMetadata) instance |

---

### ButtonInternalBrowser

The wrapper class representing configurations for the internal browser opening for `open-url` button action type

**Inheritance**

ButtonInternalBrowser

#### Methods

##### `global ButtonInternalBrowser setActionButton(String action, String predefinedMessage, String replyData)`

Sets properties for the internal browser action button

###### Parameters

| Param               | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `action`            | The action button type in the internal browser navigation bar. `forward` will open the forward via Viber screen and share current URL or predefined URL; `send` sends the currently opened URL as an URL message, or predefined URL if `actionPredefinedUrl` is not empty; `open-externally` opens external browser with the current URL; `send-to-bot` sends reply data to bot in order to receive message; `none` will not display any button Default is `forward` |
| `predefinedMessage` | The predefined message to be sent if `actionButton` is set to `send` or `forward`                                                                                                                                                                                                                                                                                                                                                                                    |
| `replyData`         | The custom reply data if `actionButton` is set to `send-to-bot`                                                                                                                                                                                                                                                                                                                                                                                                      |

###### Returns

| Type                    | Description                                                                                                                |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `ButtonInternalBrowser` | The current instance of [ViberReplyKeyboardOptions.ButtonInternalBrowser](ViberReplyKeyboardOptions.ButtonInternalBrowser) |

##### `global ButtonInternalBrowser setTitle(String title)`

Sets the type of the title or the title itself to be displayed in the internal browser
`domain` displays the top level domain
`default` displays the content of the page's `&lt;title&gt;` tag
Any other value for a custom title

###### Parameters

| Param   | Description                                      |
| ------- | ------------------------------------------------ |
| `title` | The title display type of the title custom value |

###### Returns

| Type                    | Description                                                                                                                |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `ButtonInternalBrowser` | The current instance of [ViberReplyKeyboardOptions.ButtonInternalBrowser](ViberReplyKeyboardOptions.ButtonInternalBrowser) |

##### `global ButtonInternalBrowser setMode(String mode)`

Determines how should the internal browser be opened. Possible values: `fullscreen`, `fullscreen-portrait`, `fullscreen-landscape`, `partial-size`. Default is `fullscreen`

###### Parameters

| Param  | Description     |
| ------ | --------------- |
| `mode` | The mode option |

###### Returns

| Type                    | Description                                                                                                                |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `ButtonInternalBrowser` | The current instance of [ViberReplyKeyboardOptions.ButtonInternalBrowser](ViberReplyKeyboardOptions.ButtonInternalBrowser) |

##### `global ButtonInternalBrowser withFooter(Boolean showFooter)`

Determines if the website footer should be shown in the internal browser

###### Parameters

| Param        | Description                               |
| ------------ | ----------------------------------------- |
| `showFooter` | Whether to show the website footer or not |

###### Returns

| Type                    | Description                                                                                                                |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `ButtonInternalBrowser` | The current instance of [ViberReplyKeyboardOptions.ButtonInternalBrowser](ViberReplyKeyboardOptions.ButtonInternalBrowser) |

---

### ButtonMediaPlayer

The wrapper class representing configurations for the internal media player

**Inheritance**

ButtonMediaPlayer

#### Constructors

##### `global ButtonMediaPlayer(String title, String subtitle, String thumbnail, Boolean shouldLoop)`

Creates an instance of a media player configurations

###### Parameters

| Param        | Description                                                                  |
| ------------ | ---------------------------------------------------------------------------- |
| `title`      | The media player's title (first line)                                        |
| `subtitle`   | The media player's sub-title (second line)                                   |
| `thumbnail`  | The URL for media player’s background thumbnail                              |
| `shouldLoop` | Whether the media player should be looped forever or not. Default is `false` |

---

---
