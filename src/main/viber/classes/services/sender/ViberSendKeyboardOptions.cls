/**
 * @description The builder-like class that represents parameters for sending a custom carousel/keyboard to the user via the `Viber` bot service. The source: https://developers.viber.com/docs/tools/keyboards/#general-keyboard-parameters
 */
global class ViberSendKeyboardOptions extends ValueMap {
    /**
     * @description The list of buttons to be shown to the receiver
     */
    global List<Button> buttons { get { return (List<Button>) get('Buttons'); } private set { set('Buttons', value); } }

    /**
     * @description Creates an instance of the carousel/keyboard without any buttons, so that they can be added separately
     */
    global ViberSendKeyboardOptions() {
        this(new List<Button>());
    }

    /**
     * @description Creates an instance of the carousel/keyboard with the provided buttons
     * @param buttons The list of <<ViberSendKeyboardOptions.Button>> instances that represent buttons to be shown to the user
     */
    global ViberSendKeyboardOptions(List<Button> buttons) {
        this.buttons = buttons;
    }

    /**
     * @description Adds a button to the carousel/keyboard
     * @param button The instance of the <<ViberSendKeyboardOptions.Button>> class, representing a button to add to the layout
     * @return The current <<ViberSendKeyboardOptions>> instance
     */
    global ViberSendKeyboardOptions addButton(Button button) {
        return addButtons(new List<Button> { button });
    }

    /**
     * @description Adds multiple buttons to the carousel/keyboard
     * @param buttons The list of instances of the <<ViberSendKeyboardOptions.Button>> class, representing buttons to add to the layout
     * @return The current <<ViberSendKeyboardOptions>> instance
     */
    global ViberSendKeyboardOptions addButtons(Button[] buttons) {
        this.buttons.addAll(buttons);
        return this;
    }

    /**
     * @description Sets the size of carousel/keyboard block for grouping buttons on the layout
     * @param groupRows The number of button row groups. Accepts numbers in range: `1..7`. Default is `7` for carousels and `2` for keyboards
     * @param groupColumns The number of button column groups. Accepts numbers in range: `1..6`. Default is `6`
     * @return The current <<ViberSendKeyboardOptions>> instance
     */
    global ViberSendKeyboardOptions setLayout(Integer groupRows, Integer groupColumns) {
        set('ButtonsGroupRows', groupRows, true);
        set('ButtonsGroupColumns', groupColumns, true);
        return this;
    }

    /**
     * @description Sets the background color of the carousel/keyboard
     * @param backgroundColor The HEX value of the carousel/keyboard background color
     * @return The current <<ViberSendKeyboardOptions>> instance
     */
    global ViberSendKeyboardOptions setBackgroundColor(String backgroundColor) {
        set('BgColor', backgroundColor, true);
        return this;
    }

    /**
     * @descriptions Sets the height configurations for the carousel/keyboard
     * @param customDefaultHeight How much percent of free screen space in chat should be taken by keyboard. The final height will not be less than height of the system keyboard. Accepts numbers in range: `40..70`
     * @param heightScale Scales the height of the default square block (which is defined on client side) to the given value in percents. Accepts numbers in range: `20..100`. Default is `100`
     * @param useDefaultHeight When `true` the keyboard will be displayed with the same height as the native keyboard. When `false` short keyboards will be displayed with the minimal possible height. Default is `false`
     * @return The current <<ViberSendKeyboardOptions>> instance
     */
    global ViberSendKeyboardOptions setHeight(
        Integer customDefaultHeight,
        Integer heightScale,
        Boolean useDefaultHeight
    ) {
        set('CustomDefaultHeight', customDefaultHeight, true);
        set('HeightScale', heightScale, true);
        set('DefaultHeight', useDefaultHeight, true);
        return this;
    }

    /**
     * @description Customizes the receiver's keyboard input field
     * @param inputFieldState Possible values: `regular`, `minimized`, `hidden`. Default is `regular`
     * @return The current <<ViberSendKeyboardOptions>> instance
     */
    global ViberSendKeyboardOptions setInputFieldState(String inputFieldState) {
        set('InputFieldState', inputFieldState, true);
        return this;
    }

    /**
     * @description Allows the carousel/keyboard content to be saved by the receiver
     * @param favoritesMetadata The instance of <<ViberSendKeyboardOptions.FavoritesMetadata>> describing content to be saved via favorites, if saving is available
     * @return The current <<ViberSendKeyboardOptions>> instance
     */
    global ViberSendKeyboardOptions allowSaveToFavorites(FavoritesMetadata favoritesMetadata) {
        set('FavoritesMetadata', favoritesMetadata);
        return this;
    }

    public ViberSendKeyboardOptions setType(String keyboardType) {
        set('Type', keyboardType);
        return this;
    }

    /**
     * @description The wrapper class representing a button in the `Viber` carousel/keyboard. The source: https://developers.viber.com/docs/tools/keyboards/#buttons-parameters
     */
    global class Button extends ValueMap {
        private String actionType { set { set('ActionType', value); } }
        private String actionBody { set { set('ActionBody', value); } }

        /**
         * @description Sets the button layout
         * @param rows The button height. Accepts numbers in range: `1..7` for carousels and `1-2` for keyboards. Default is `1`
         * @param columns The button width. Accepts numbers in range: `1..6`. Default is `6`
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setLayout(Integer rows, Integer columns) {
            set('Rows', rows, true);
            set('Columns', columns, true);
            return this;
        }

        /**
         * @description Sets the button background color
         * @param backgroundColor The backgroun color of the button (HEX value)
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setBackgroundColor(String backgroundColor) {
            set('BgColor', backgroundColor, true);
            return this;
        }

        /**
         * @description Sets the media background for the button
         * @param mediaUrl The URL for the button background media
         * @param mediaScaleType The options for scaling the bounds of the background to the bounds of the view. Possible values: `crop`, `fill`, `fit`
         * @param isGif If the passed media refer to a `.gif` file or not. Default is `false`
         * @param loopGif If the passed media refer to a `.gif` file, decide whether to loop it or play only once. Default is `true`
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setBackgroundMedia(String mediaUrl, String mediaScaleType, Boolean isGif, Boolean loopGif) {
            set('BgMedia', mediaUrl, true);
            set('BgMediaScaleType', mediaScaleType, true);
            set('BgMediaType', isGif ? 'gif' : 'picture');
            set('BgLoop', isGif ? loopGif : null, true);
            return this;
        }

        /**
         * @description Makes the button to behave as an informative button without the possibility to click it
         * @param buttonText The text to be shown on the button
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asNoActionButton(String buttonText) {
            this.actionType = 'none';
            return setText(buttonText);
        }

        /**
         * @description Makes the button to behave as a text reply from the receiver, sending a message back to the bot
         * @param replyValue The actual text value to be sent back to bot
         * @param replyText The text message to appear in the chat sent by the receiver
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asReply(String replyValue, String replyText) {
            this.actionType = 'reply';
            this.actionBody = replyValue;
            return setText(replyText);
        }

        /**
         * @description Makes the button to behave as an image reply from the receiver, sending a message back to the bot
         * @param replyValue The actual text value to be sent back to bot
         * @param imageUrl The URL of the image to appear in the chat sent by the receiver
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asReplyWithImage(String replyValue, String imageUrl) {
            this.actionType = 'reply';
            this.actionBody = replyValue;
            return setImage(imageUrl);
        }

        /**
         * @description Makes the button to behave as a link to a website, sending the clicked link URL back to the bot
         * @param url The URL of the link. Will be sent back to the bot, appearing in the chat as message from the receiver
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asOpenUrl(String url) {
            return asOpenUrl(url, null);
        }

        /**
         * @description Makes the button to behave as a link to a website, sending the clicked link URL back to the bot
         * @param url The URL of the link. Will be sent back to the bot, appearing in the chat as message from the receiver
         * @param internalBrowserConfig The instance of <<ViberSendKeyboardOptions.ButtonInternalBrowser>> class describing configurations for the `Viber` internal browser
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asOpenUrl(String url, ButtonInternalBrowser internalBrowserConfig) {
            return asOpenUrl(url, null, null, internalBrowserConfig);
        }

        /**
         * @description Makes the button to behave as a link to a website or a media content, sending the clicked link URL back to the bot
         * @param url The URL of the link or media. Will be sent back to the bot, appearing in the chat as message from the receiver
         * @param mediaType The type of the content under the provided link. Possible values: `not-media`, `video`, `gif`, `picture`. Default is `not-media`
         * @param mediaPlayerConfig The instance of <<ViberSendKeyboardOptions.ButtonMediaPlayer>> class describing configurations for the `Viber` media player
         * @param internalBrowserConfig The instance of <<ViberSendKeyboardOptions.ButtonInternalBrowser>> class describing configurations for the `Viber` internal browser
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asOpenUrl(
            String url,
            String mediaType,
            ButtonMediaPlayer mediaPlayerConfig,
            ButtonInternalBrowser internalBrowserConfig
        ) {
            this.actionType = 'open-url';
            this.actionBody = url;
            useInternalBrowser();
            set('OpenURLMediaType', mediaType, true);
            set('MediaPlayer', mediaPlayerConfig, true);
            set('InternalBrowser', internalBrowserConfig, true);
            return this;
        }

        /**
         * @description Makes the button to behave as a link to a location on a map, sending the picked location to the bot
         * @param latitude The latitude of the location
         * @param longitude The longitude of the location
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asOpenMap(Decimal latitude, Decimal longitude) {
            this.actionType = 'open-map';
            set('Map', new ValueMap().set('Latitude', latitude).set('Longitude', longitude));
            return this;
        }

        /**
         * @description Makes the button to behave as a button to share the receiver's phone number. Only available for keyboard
         * @param text The button text to be shown to the user
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asPhoneSharing(String text) {
            this.actionType = 'share-phone';
            return setText(text);
        }

        /**
         * @description Makes the button to behave as a button to share the receiver's location. Only available for keyboard
         * @param text The button text to be shown to the user
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button asLocationSharing(String text) {
            this.actionType = 'location-picker';
            return setText(text);
        }

        /**
         * @description Sets the button text
         * @param text The text to be displayed on the button. Can contain such HTML tags as: `<b>`, `<i>`, `<u>`, `<br>`, `<s>` and `<font size="N" color="#7F00FF">`. Max `250` characters
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setText(String text) {
            set('Text', text, true);
            return this;
        }

        /**
         * @description Sets the button text vertical and horizontal alignment
         * @param verticalAlign The vertical alignment of the text. Possible values: `top`, `middle`, `bottom`. Default is `middle`
         * @param horizontalAlign The horizontal alignment of the text. Possible values: `left`, `center`, `right`. Default is `center`
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setTextAlignment(String verticalAlign, String horizontalAlign) {
            set('TextVAlign', verticalAlign, true);
            set('TextHAlign', horizontalAlign, true);
            return this;
        }

        /**
         * @description Sets the button text paddings. Accepts numbers in range: `0..12`. Default is `[12, 12, 12, 12]`
         * @param top The top padding
         * @param right The top padding
         * @param bottom The top padding
         * @param left The top padding
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setTextPaddings(Integer top, Integer right, Integer bottom, Integer left) {
            set('TextPaddings', new List<Integer> { top, right, bottom, left });
            return this;
        }

        /**
         * @description Applies additional styling properties to the button text
         * @param size The text size. Possible values: `small`, `regular`, `large`. Default is `regular`
         * @param opecity The text opacity. Accepts numbers in range: `0..100`. Default is `100`
         * @param bgGradientColor The background gradient to use under text (HEX value). Works only when text is aligned vertically to `top` or `bottom`
         * @param fitText If set to `true` the size of the text will be decreased to fit (minimum size is `12`). Default is `false`
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setTextStyle(Integer opacity, String size, String bgGradientColor, Boolean fitText) {
            set('TextOpacity', opacity, true);
            set('TextSize', size, true);
            set('TextBgGradientColor', bgGradientColor, true);
            set('TextShouldFit', fitText, true);
            return this;
        }

        /**
         * @description Sets the image on top of the button's background
         * @param imageUrl The URL of the image to be placed on top of the button background
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setImage(String imageUrl) {
            set('Image', imageUrl, true);
            return this;
        }

        /**
         * @description Sets the borders (frame) configs for the button
         * @param borderWidth The width of the borders. Accepts numbers in range: `0..10`. Default is `1`
         * @param cornerRadius The radius of the border corners. Accepts numbers in range: `0..10`. Default is `0`
         * @param borderColor The color of the borders (HEX value)
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button setBorders(Integer borderWidth, Integer cornerRadius, String borderColor) {
            ValueMap frame = new ValueMap()
                .set('BorderWidth', borderWidth, true)
                .set('CornerRadius', cornerRadius, true)
                .set('BorderColor', borderColor, true);

            set('Frame', frame);
            return this;
        }

        /**
         * @description Sets the setting to use the internal `Viber` browser for opening button links
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button useInternalBrowser() {
            return useInternalBrowser(true);
        }

        /**
         * @description Determines if the internal `Viber` browser should be used for opening button links
         * @param shouldUseInternalBrowser Determines if the internal `Viber` browser should be used for opening button links. Default is `true`
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button useInternalBrowser(Boolean shouldUseInternalBrowser) {
            set('OpenURLType', shouldUseInternalBrowser ? 'internal' : 'external');
            return this;
        }

        /**
         * @description Determines whether the user action is presented in the conversation
         * @param useSilent Determines whether the user action is presented in the conversation. Default is `false`
         * @return The current <<ViberSendKeyboardOptions.Button>> instance
         */
        global Button useSilentMode(Boolean useSilent) {
            set('Silent', useSilent, true);
            return this;
        }
    }

    /**
     * @description The wrapper class representing carousel content to be saved via favorites bot, if saving is available. The source: https://developers.viber.com/docs/tools/keyboards/#favoritesMetadata
     */
    global class FavoritesMetadata {
        /**
         * @description The type of the served content. Possible values: `gif`, `link`, `video`
         */
        global final String type;

        /**
         * @description The accessible URL of the content
         */
        global final String url;

        private String title;
        private String domain;
        private String thumbnail;
        private Integer width;
        private Integer height;
        private String alternativeText;
        private String alternativeUrl;

        /**
         * @description Creates an instance of the favorites metadata with the provided type and url
         * @param type The type of the served content. Possible values: `gif`, `link`, `video`
         * @param url The accessible URL of the content
         */
        global FavoritesMetadata(String type, String url) {
            this.type = type;
            this.url = url;
        }

        /**
         * @description Sets the content title
         * @param title The content title
         * @return The current <<ViberSendKeyboardOptions.FavoritesMetadata>> instance
         */
        global FavoritesMetadata setTitle(String title) {
            this.title = title;
            return this;
        }

        /**
         * @description Sets the thumbnail of the content with its sizes
         * @param thumbnail The accessible thumbnail for the content (PNG, JPEG)
         * @param width The width of the thumbnail image in pixels
         * @param height The height of the thumbnail image in pixels
         * @return The current <<ViberSendKeyboardOptions.FavoritesMetadata>> instance
         */
        global FavoritesMetadata setThumbnail(String thumbnail, Integer width, Integer height) {
            this.thumbnail = thumbnail;
            this.width = width;
            this.height = height;
            return this;
        }

        /**
         * @description Sets the alternative text and URL for clients with API version not supporting favorites saving
         * @param text The alternative text for the URL
         * @param url The alternative URL
         * @return The current <<ViberSendKeyboardOptions.FavoritesMetadata>> instance
         */
        global FavoritesMetadata setAlternativeContent(String text, String url) {
            this.alternativeText = text;
            this.alternativeUrl = url;
            return this;
        }

        /**
         * @description Sets the top domain of the content URL
         * @param domain The top domain of the content URL
         * @return The current <<ViberSendKeyboardOptions.FavoritesMetadata>> instance
         */
        global FavoritesMetadata setDomain(String domain) {
            this.domain = domain;
            return this;
        }
    }

    /**
     * @description The wrapper class representing configurations for the internal browser opening for `open-url` button action type
     */
    global class ButtonInternalBrowser extends ValueMap {
        /**
         * @description Sets properties for the internal browser action button
         * @param action The action button type in the internal's browser navigation bar.
         * `forward` will open the forward via Viber screen and share current URL or predefined URL;
         * `send` sends the currently opened URL as an URL message, or predefined URL if `actionPredefinedUrl` is not empty;
         * `open-externally` opens external browser with the current URL;
         * `send-to-bot` sends reply data to bot in order to receive message;
         * `none` will not display any button
         * Default is `forward`
         * @param predefinedMessage The predefined message to be sent if `actionButton` is set to `send` or `forward`
         * @param replyData The custom reply data if `actionButton` is set to `send-to-bot`
         * @return The current instance of <<ViberSendKeyboardOptions.ButtonInternalBrowser>>
         */
        global ButtonInternalBrowser setActionButton(String action, String predefinedMessage, String replyData) {
            set('ActionButton', action, true);
            set('ActionPredefinedURL', predefinedMessage, true);
            set('ActionReplyData', replyData, true);
            return this;
        }

        /**
         * @description Sets the type of the title or the title itself to be displayed in the internal browser
         * `domain` displays the top level domain
         * `default` displays the content of the page's `<title>` tag
         * Any other value for a custom title
         * @param title The title display type of the title custom value
         * @return The current instance of <<ViberSendKeyboardOptions.ButtonInternalBrowser>>
         */
        global ButtonInternalBrowser setTitle(String title) {
            if (title == 'domain' || title == 'default') {
                set('TitleType', title);
            } else {
                set('CustomTitle', title, true);
            }
            return this;
        }

        /**
         * @description Determines how should the internal browser be opened. Possible values: `fullscreen`, `fullscreen-portrait`, `fullscreen-landscape`, `partial-size`. Default is `fullscreen`
         * @param mode The mode option
         * @return The current instance of <<ViberSendKeyboardOptions.ButtonInternalBrowser>>
         */
        global ButtonInternalBrowser setMode(String mode) {
            set('Mode', mode, true);
            return this;
        }

        /**
         * @description Determines if the website footer should be shown in the internal browser
         * @param showFooter Whether to show the website footer or not
         * @return The current instance of <<ViberSendKeyboardOptions.ButtonInternalBrowser>>
         */
        global ButtonInternalBrowser withFooter(Boolean showFooter) {
            set('FooterType', showFooter ? 'default' : 'hidden');
            return this;
        }
    }

    /**
     * @description The wrapper class representing configurations for the internal media player
     */
    global class ButtonMediaPlayer extends ValueMap {
        /**
         * @description Creates an instance of a media player configurations
         * @param title The media player's title (first line)
         * @param subtitle The media player's sub-title (second line)
         * @param thumbnail The URL for media player’s background thumbnail
         * @param shouldLoop Whether the media player should be looped forever or not. Default is `false`
         */
        global ButtonMediaPlayer(String title, String subtitle, String thumbnail, Boolean shouldLoop) {
            set('Title', title, true);
            set('Subtitle', subtitle, true);
            set('ThumbnailURL', thumbnail, true);
            set('Loop', shouldLoop, true);
        }
    }
}
