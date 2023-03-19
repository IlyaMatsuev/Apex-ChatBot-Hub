/**
 * @description The wrapper class that represents parameters for sending a custom keyboard to the user via the `Viber` bot service. The source: https://developers.viber.com/docs/tools/keyboards/#general-keyboard-parameters
 */
global class ViberCustomMessageKeyboard extends ValueMap {
    /**
     * @description The list of buttons to be shown to the receiver
     */
    global List<Button> buttons { get { return (List<Button>) get('Buttons'); } set { set('Buttons', value); } }
    /**
     * @description The backgroun color of the keyboard (HEX value)
     */
    global String backgroundColor { get { return getString('BgColor'); } set { set('BgColor', value); } }
    /**
     * @description When `true` the keyboard will be displayed with the same height as the native keyboard. When `false` short keyboards will be displayed with the minimal possible height. Default is `false`
     */
    global Boolean useDefaultHeight { get { return getBoolean('DefaultHeight'); } set { set('DefaultHeight', value); } }
    /**
     * @description How much percent of free screen space in chat should be taken by keyboard. The final height will be not less than height of system keyboard. Accepts numbers in range: `40..70`
     */
    global Integer customDefaultHeight {
        get { return getInteger('CustomDefaultHeight'); }
        set { set('CustomDefaultHeight', value); }
    }
    /**
     * @description Scales the height of the default square block (which is defined on client side) to the given value in percents. Accepts numbers in range: `20..100`. Default is `100`
     */
    global Integer heightScale { get { return getInteger('HeightScale'); } set { set('HeightScale', value); } }
    /**
     * @description The size of block for grouping buttons during layout for columns. Accepts numbers in range: `1..6`. Default is `6`
     */
    global Integer buttonsGroupColumns {
        get { return getInteger('ButtonsGroupColumns'); }
        set { set('ButtonsGroupColumns', value); }
    }
    /**
     * @description The size of block for grouping buttons during layout for rows. Accepts numbers in range: `1..7`. Default is `7` for carousels and `2` for keyboards
     */
    global Integer buttonsGroupRows {
        get { return getInteger('ButtonsGroupRows'); }
        set { set('ButtonsGroupRows', value); }
    }
    /**
     * @description Customizes the keyboard input field: `regular` displays regular size input field; `minimized` displays input field minimized by default. `hidden` hides the input field
     */
    global String inputFieldState {
        get { return getString('InputFieldState'); }
        set { set('InputFieldState', value); }
    }
    /**
     * @description The object describing carousel content to be saved via favorites bot, if saving is available
     */
    global FavoritesMetadata favorites {
        get { return (FavoritesMetadata) get('FavoritesMetadata'); }
        set { set('FavoritesMetadata', value); }
    }

    /**
     * @description Creates an instance of the keyboard with the provided buttons
     * @param buttons The list of <<ViberCustomMessageKeyboard.Button>> instances that represent buttons to be shown to the user
     */
    global ViberCustomMessageKeyboard(List<Button> buttons) {
        this.buttons = buttons;
    }

    /**
     * @description The wrapper class representing a button in the `Viber` carousel/keyboard. The source: https://developers.viber.com/docs/tools/keyboards/#buttons-parameters
     */
    global class Button extends ValueMap {
        /**
         * @description The button width. Accepts numbers in range: `1..6`. Default is `6`
         */
        global Integer columns { get { return getInteger('Columns'); } set { set('Columns', value); } }
        /**
         * @description The button height. Accepts numbers in range: `1..7` for carousels and `1-2` for keyboards. Default is `1`
         */
        global Integer rows { get { return getInteger('Rows'); } set { set('Rows', value); } }
        /**
         * @description The backgroun color of the button (HEX value)
         */
        global String backgroundColor { get { return getString('BgColor'); } set { set('BgColor', value); } }
        /**
         * @description Determines whether the user action is presented in the conversation. Default is `false`
         */
        global Boolean isSilent { get { return getBoolean('Silent'); } set { set('Silent', value); } }
        /**
         * @description The type of the button media background. Possible values are: `picture` and `gif`. Default is `picture`
         */
        global String backgroundMediaType {
            get { return getString('BgMediaType'); }
            set { set('BgMediaType', value); }
        }
        /**
         * @description The URL for the button background media
         */
        global String backgrounMediaUrl { get { return getString('BgMedia'); } set { set('BgMedia', value); } }
        /**
         * @description The options for scaling the bounds of the background to the bounds of the view:
         * `crop` contents scaled to fill with fixed aspect;
         * `fill` contents scaled to fill without saving fixed aspect;
         * `fit` at least one axis (X or Y) will fit exactly
         */
        global String backgroundMediaScaleTyle {
            get { return getString('BgMediaScaleType'); }
            set { set('BgMediaScaleType', value); }
        }
        /**
         * @description Determines whether the button gif background should be looped or play only once. Default is `true`
         */
        global Boolean loopGifBackground { get { return getBoolean('BgLoop'); } set { set('BgLoop', value); } }
        /**
         * @description The type of the action to be performed after the button is pressed. Possible values: `reply`, `open-url`, `location-picker`, `share-phone` and `none`. Default is `reply`
         */
        global String actionType { get { return getString('ActionType'); } set { set('ActionType', value); } }
        /**
         * @description Some text when `actionType` is set to `reply`, and some URL when `actionType` is set to `open-url`
         */
        global String actionBody { get { return getString('ActionBody'); } set { set('ActionBody', value); } }
        /**
         * @description The URL of the image to be placed on top of the button background
         */
        global String imageUrl { get { return getString('Image'); } set { set('Image', value); } }
        /**
         * @description The text to be displayed on the button. Can contain such HTML tags as: `<b>`, `<i>`, `<u>`, `<br>`, `<s>` and `<font size="N" color="#7F00FF">`. Max `250` characters
         */
        global String text { get { return getString('Text'); } set { set('Text', value); } }
        /**
         * @description The vertical alignment of the text. Possible values: `top`, `middle`, `bottom`. Default is `middle`
         */
        global String textVerticalAlign { get { return getString('TextVAlign'); } set { set('TextVAlign', value); } }
        /**
         * @description The horizontal alignment of the text. Possible values: `left`, `center`, `right`. Default is `center`
         */
        global String textHorizontalAlign { get { return getString('TextHAlign'); } set { set('TextHAlign', value); } }
        /**
         * @description The list of text paddings in the following order: `left`, `top`, `right`, `bottom`. Accepts numbers in range: `0..12`. Default is `[12, 12, 12, 12]`
         */
        global List<Integer> textPaddings {
            get { return (List<Integer>) get('TextPaddings'); }
            set { set('TextPaddings', value); }
        }
        /**
         * @description The text opacity. Accepts numbers in range: `0..100`. Default is `100`
         */
        global Integer textOpacity { get { return getInteger('TextOpacity'); } set { set('TextOpacity', value); } }
        /**
         * @description The text size. Possible values: `small`, `regular`, `large`. Default is `regular`
         */
        global String textSize { get { return getString('TextSize'); } set { set('TextSize', value); } }
        /**
         * @description The background gradient to use under text, Works only when `textVerticalAlign` is equal to `top` or `bottom` (HEX value)
         */
        global String textBackgroundGradient {
            get { return getString('TextBgGradientColor'); }
            set { set('TextBgGradientColor', value); }
        }
        /**
         * @description If set to `true` the size of the text will be decreased to fit (minimum size is `12`). Default is `false`
         */
        global Boolean shouldFitText {
            get { return getBoolean('TextShouldFit'); }
            set { set('TextShouldFit', value); }
        }
        /**
         * @description Determines is the internal browser should be open instead of the external one, when clicking the `open-url` action button. Default is `true`
         */
        global Boolean useInternalBrowserForUrl {
            get { return getString('OpenURLType') == 'internal'; }
            set { set('OpenURLType', value ? 'internal' : 'external'); }
        }
        /**
         * @description Determines the URL media type:
         * `not-media` forces browser usage;
         * `video` will be opened via media player;
         * `gif` will play the gif in full screen mode;
         * `picture` will open the picture in full screen mode.
         * Default is `not-media`
         */
        global String openUrlMediaType {
            get { return getString('OpenURLMediaType'); }
            set { set('OpenURLMediaType', value); }
        }
        /**
         * @description The object describing configurations for the `open-url` action type if `useInternalBrowserForUrl` is set to `true`
         */
        global ButtonInternalBrowser internalBrowserConfig {
            get { return (ButtonInternalBrowser) get('InternalBrowser'); }
            set { set('InternalBrowser', value); }
        }
        /**
         * @description The object describing configurations for the `open-map` action type if `useInternalBrowserForUrl` is set to `true`
         */
        global ButtonMap mapConfig { get { return (ButtonMap) get('Map'); } set { set('Map', value); } }
        /**
         * @description The object describing configurations for the media player when `openUrlMediaType` is set to `audio` or `video`
         */
        global ButtonMediaPlayer mediaPlayerConfig {
            get { return (ButtonMediaPlayer) get('MediaPlayer'); }
            set { set('MediaPlayer', value); }
        }
        /**
         * @description The object describing the button frame options
         */
        global ButtonFrame frame { get { return (ButtonFrame) get('Frame'); } set { set('Frame', value); } }

        /**
         * @description Creates an instance of a button with the provided content
         * @param actionBody Some text when `actionType` is set to `reply`, and some URL when `actionType` is set to `open-url`
         */
        global Button(String actionBody) {
            this.actionBody = actionBody;
        }
    }

    /**
     * @description The wrapper class representing carousel content to be saved via favorites bot, if saving is available. The source: https://developers.viber.com/docs/tools/keyboards/#favoritesMetadata
     */
    global class FavoritesMetadata {
        /**
         * @description The type of the served content. Possible values: `gif`, `link`, `video`
         */
        global String type;
        /**
         * @description The accessible URL of the content
         */
        global String url;
        /**
         * @description The content title
         */
        global String title;
        /**
         * @description The accessible thumbnail for the content (PNG, JPEG)
         */
        global String thumbnail;
        /**
         * @description The top domain of the content URL
         */
        global String domain;
        /**
         * @description The width of the thumbnail image in pixels
         */
        global Integer width;
        /**
         * @description The height of the thumbnail image in pixels
         */
        global Integer height;
        /**
         * @description The alternative URL for clients with `apiVersion` < `minApiVersion`
         */
        global String alternativeUrl;
        /**
         * @description The alternative title for the URL for clients with `apiVersion` < `minApiVersion`
         */
        global String alternativeText;

        /**
         * @description Creates an instance of the favorites metadata with the provided type and url
         * @param type The type of the served content. Possible values: `gif`, `link`, `video`
         * @param url The accessible URL of the content
         */
        global FavoritesMetadata(String type, String url) {
            this.type = type;
            this.url = url;
        }
    }

    /**
     * @description The wrapper class representing configurations for the internal browser opening for `open-url` button action type
     */
    global class ButtonInternalBrowser extends ValueMap {
        /**
         * @description The action button type in the internal's browser navigation bar.
         * `forward` will open the forward via Viber screen and share current URL or predefined URL;
         * `send` sends the currently opened URL as an URL message, or predefined URL if `actionPredefinedUrl` is not empty;
         * `open-externally` opens external browser with the current URL;
         * `send-to-bot` sends reply data to bot in order to receive message;
         * `none` will not display any button
         * Default is `forward`
         */
        global String actionButtonType { get { return getString('ActionButton'); } set { set('ActionButton', value); } }
        /**
         * @description The predefined message to be sent if `actionButtonType` is set to `send` or `forward`
         */
        global String actionPredefinedUrl {
            get { return getString('ActionPredefinedURL'); }
            set { set('ActionPredefinedURL', value); }
        }
        /**
         * @description The custom reply data if `actionButtonType` is set to `send-to-bot`
         */
        global String actionReplyData {
            get { return getString('ActionReplyData'); }
            set { set('ActionReplyData', value); }
        }
        /**
         * @description The type of the title to be displayed in the internal browser if `customTitle` is empty:
         * `domain` displays the top level domain
         * `default` displays the content of the page's `<title>` tag
         * Default is `default`
         */
        global String titleType { get { return getString('TitleType'); } set { set('TitleType', value); } }
        /**
         * @description The custom title text for the internal browser. `titleType` is ingored if this value is set. Up to `15` characters
         */
        global String customTitle { get { return getString('CustomTitle'); } set { set('CustomTitle', value); } }
        /**
         * @description Determines how should the internal browser be opened. Possible values: `fullscreen`, `fullscreen-portrait`, `fullscreen-landscape`, `partial-size`. Default is `fullscreen`
         */
        global String mode { get { return getString('Mode'); } set { set('Mode', value); } }
        /**
         * @description Determines if the website footer should be shown in the internal browser
         */
        global Boolean showFooter {
            get { return getString('FooterType') == 'default'; }
            set { set('FooterType', value ? 'default' : 'hidden'); }
        }
    }

    /**
     * @description The wrapper class representing map location for the internal map opening for `open-map` button action type
     */
    global class ButtonMap extends ValueMap {
        /**
         * @description The location latitude
         */
        global Decimal latitude { get { return getDecimal('Latitude'); } set { set('Latitude', value); } }
        /**
         * @description The location longitude
         */
        global Decimal longitude { get { return getDecimal('Longitude'); } set { set('Longitude', value); } }
    }

    /**
     * @description The wrapper class representing configurations for the internal media player
     */
    global class ButtonMediaPlayer extends ValueMap {
        /**
         * @description The media player's title (first line)
         */
        global String title { get { return getString('Title'); } set { set('Title', value); } }
        /**
         * @description The media player's sub-title (second line)
         */
        global String subtitle { get { return getString('Subtitle'); } set { set('Subtitle', value); } }
        /**
         * @description The URL for media player’s background thumbnail
         */
        global String thumbnail { get { return getString('ThumbnailURL'); } set { set('ThumbnailURL', value); } }
        /**
         * @description Whether the media player should be looped forever or not. Default is `false`
         */
        global Boolean shouldLoop { get { return getBoolean('Loop'); } set { set('Loop', value); } }
    }

    /**
     * @description The wrapper class representing configurations for the button frame styling
     */
    global class ButtonFrame extends ValueMap {
        /**
         * @description The width of the borders. Accepts numbers in range: `0..10`. Default is `1`
         */
        global Integer borderWidth { get { return getInteger('BorderWidth'); } set { set('BorderWidth', value); } }
        /**
         * @description The color of the borders (HEX value)
         */
        global String borderColor { get { return getString('BorderColor'); } set { set('BorderColor', value); } }
        /**
         * @description The radius of the border corners. Accepts numbers in range: `0..10`. Default is `0`
         */
        global String cornerRadius { get { return getString('BorderColor'); } set { set('BorderColor', value); } }
    }
}
