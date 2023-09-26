/**
 * @description Represents parameters wrapper for sending inline keyboard to the user via the `Telegram` bot service.
 * Source: https://core.telegram.org/bots/api#inlinekeyboardmarkup
 */
global class TelegramInlineKeyboardMarkupOptions extends BotPayload {
    /**
     * @description The matrix of inline keyboard buttons to be shown next to the message. Represents the list of button rows
     */
    global List<List<Button>> buttons {
        get {
            if (buttons == null) {
                buttons = new List<List<Button>>();
                List<Object> payloadMatrix = (List<Object>) payload.get('inline_keyboard');
                if (payloadMatrix != null) {
                    for (Integer i = 0; i < payloadMatrix.size(); i++) {
                        buttons.add(new List<Button>());
                        for (Object col : (List<Object>) payloadMatrix.get(i)) {
                            buttons.get(i).add(new Button(new BotJsonPayload((Map<String, Object>) col)));
                        }
                    }
                }
                payload.set('inline_keyboard', buttons);
            }
            return buttons;
        }
        private set { payload.set('inline_keyboard', value); }
    }

    /**
     * @description Creates an instance of the inline keyboard without any buttons, so that they can be added separately
     */
    global TelegramInlineKeyboardMarkupOptions() {
        this(new List<Button>());
    }

    /**
     * @description Creates an instance of the inline keyboard with the provided buttons row
     * @param buttons The list of buttons as a single row to be shown to the user
     */
    global TelegramInlineKeyboardMarkupOptions(Button[] buttons) {
        this(new List<List<Button>> { buttons });
    }

    /**
     * @description Creates an instance of the inline keyboard with the provided buttons matrix
     * @param buttons The list of button rows to be shown to the user
     */
    global TelegramInlineKeyboardMarkupOptions(List<List<Button>> buttons) {
        super();
        this.buttons = buttons;
    }

    public TelegramInlineKeyboardMarkupOptions(BotJsonPayload payload) {
        super(payload);
    }

    /**
     * @description Adds a button to the keyboard's first row
     * @param button The button to be added to the first row on the keyboard
     * @return The current <<TelegramInlineKeyboardMarkupOptions>> instance
     */
    global TelegramInlineKeyboardMarkupOptions addButton(Button button) {
        return addButtons(new List<Button> { button });
    }

    /**
     * @description Adds a button to the specific keyboard's row
     * @param row The row number to add the button to. Counting starts from `0`
     * @param button The button to be added to the specified row on the keyboard
     * @return The current <<TelegramInlineKeyboardMarkupOptions>> instance
     */
    global TelegramInlineKeyboardMarkupOptions addButton(Integer row, Button button) {
        return addButtons(row, new List<Button> { button });
    }

    /**
     * @description Adds multiple buttons to the keyboard's first row
     * @param buttons The buttons to be added to the first row on the keyboard
     * @return The current <<TelegramInlineKeyboardMarkupOptions>> instance
     */
    global TelegramInlineKeyboardMarkupOptions addButtons(Button[] buttons) {
        return addButtons(0, buttons);
    }

    /**
     * @description Adds multiple buttons to the specific keyboard's row
     * @param row The row number to add the buttons to. Counting starts from `0`
     * @param buttons The buttons to be added to the specified row on the keyboard
     * @return The current <<TelegramInlineKeyboardMarkupOptions>> instance
     */
    global TelegramInlineKeyboardMarkupOptions addButtons(Integer row, Button[] buttons) {
        // Filling empty places to avoid `index out of bounds` exception
        while (this.buttons.size() < row + 1) {
            this.buttons.add(new List<Button>());
        }
        this.buttons.get(row).addAll(buttons);
        return this;
    }

    /**
     * @description The builder-like class representing a button in the `Telegram` inline keyboard.
     * Source: https://core.telegram.org/bots/api#inlinekeyboardbutton
     */
    global class Button extends BotPayload {
        /**
         * @description The label text on the button
         */
        global String text { get { return payload.getString('text'); } private set { payload.set('text', value); } }

        /**
         * @description The URL to be opened when the button is pressed
         */
        global String url { get { return payload.getString('url'); } private set { payload.set('url', value, true); } }

        /**
         * @description The data to be sent in a callback query to the bot when the button is pressed. `1-64` bytes
         */
        global String callbackData {
            get { return payload.getString('callback_data'); }
            private set { payload.set('callback_data', value, true); }
        }

        /**
         * @description The description of the Web App that will be launched when the user presses the button
         */
        global TelegramWebAppInfo webApp {
            get { return new TelegramWebAppInfo(payload.getJsonPayload('web_app')); }
            private set { payload.set('web_app', value.getJsonPayload()); }
        }

        /**
         * @description An HTTPS URL used to automatically authorize the user
         */
        global LoginConfigs loginUrl {
            get { return new LoginConfigs(payload.getJsonPayload('login_url')); }
            private set { payload.set('login_url', value.getJsonPayload()); }
        }

        /**
         * @description If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted
         */
        global String switchInlineQuery {
            get { return payload.getString('switch_inline_query'); }
            private set { payload.set('switch_inline_query', value); }
        }

        /**
         * @description If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted
         */
        global String switchInlineQueryCurrentChat {
            get { return payload.getString('switch_inline_query_current_chat'); }
            private set { payload.set('switch_inline_query_current_chat', value); }
        }

        /**
         * @description If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field
         */
        global SwitchInlineQueryChatConfigs switchInlineQueryChosenChat {
            get { return new SwitchInlineQueryChatConfigs(payload.getJsonPayload('switch_inline_query_chosen_chat')); }
            private set { payload.set('switch_inline_query_chosen_chat', value.getJsonPayload()); }
        }

        /**
         * @description Creates an instance of the button with the provided text
         * @param text The button text
         */
        global Button(String text) {
            super();
            this.text = text;
        }

        public Button(BotJsonPayload payload) {
            super(payload);
        }

        /**
         * @description Sets the data to be sent in a callback query to the bot when the button is pressed. `1-64` bytes
         * @param data The data to be sent in a callback query
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button withCallbackData(String data) {
            this.callbackData = data;
            return this;
        }

        /**
         * @description Sets the URL to be opened when the button is pressed
         * @param url The URL to be opened
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asUrl(String url) {
            this.url = url;
            return this;
        }

        /**
         * @description Sets the login configs for when the button is pressed
         * @param loginConfigs The data to be sent in a callback query
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asLoginUrl(LoginConfigs loginConfigs) {
            this.loginUrl = loginConfigs;
            return this;
        }

        /**
         * @description Determines if the clicking on the button will launch a specified web app
         * @param webAppUrl The URL of the web app to be launched
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asWebAppLauncher(String webAppUrl) {
            this.webApp = new TelegramWebAppInfo(new BotJsonPayload().set('url', webAppUrl));
            return this;
        }

        /**
         * @description If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted
         * @param query The query to be pasted in another chat
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asSwitchInlineQuery(String query) {
            this.switchInlineQuery = query;
            return this;
        }

        /**
         * @description If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted
         * @param query The query to be pasted in another chat
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asSwitchInlineQueryCurrentChat(String query) {
            this.switchInlineQueryCurrentChat = query;
            return this;
        }

        /**
         * @description If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field
         * @param chatConfigs The configs for the chat selection
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asSwitchInlineQueryChosenChat(SwitchInlineQueryChatConfigs chatConfigs) {
            this.switchInlineQueryChosenChat = chatConfigs;
            return this;
        }
    }

    /**
     * @description The builder-like class representing login button configurations in the `Telegram` inline keyboard.
     * Source: https://core.telegram.org/bots/api#loginurl
     */
    global class LoginConfigs extends BotPayload {
        /**
         * @description An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed
         */
        global String url { get { return payload.getString('url'); } private set { payload.set('url', value); } }

        /**
         * @description The new text of the button in forwarded messages
         */
        global String forwardText {
            get { return payload.getString('forward_text'); }
            private set { payload.set('forward_text', value, true); }
        }

        /**
         * @description The username of a bot that will be used for the user authorization
         */
        global String botUsername {
            get { return payload.getString('bot_username'); }
            private set { payload.set('bot_username', value, true); }
        }

        /**
         * @description `True` to request the permission for your bot to send messages to the user
         */
        global Boolean requestWriteAccess {
            get { return payload.getBoolean('request_write_access'); }
            private set { payload.set('request_write_access', value); }
        }

        /**
         * @description Creates an instance of the login configs with the provided service url
         * @param url An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed
         */
        global LoginConfigs(String url) {
            super();
            this.url = url;
        }

        public LoginConfigs(BotJsonPayload payload) {
            super(payload);
        }

        /**
         * @description Sets the new text of the button in forwarded messages
         * @param text The text to be replaced with
         * @return The current <<TelegramInlineKeyboardMarkupOptions.LoginConfigs>> instance
         */
        global LoginConfigs withForwardText(String text) {
            this.forwardText = text;
            return this;
        }

        /**
         * @description Sets the username of a bot that will be used for the user authorization
         * @param botUsername The username of a bot that will be used for the user authorization
         * @return The current <<TelegramInlineKeyboardMarkupOptions.LoginConfigs>> instance
         */
        global LoginConfigs withAuthorizationBot(String botUsername) {
            this.botUsername = botUsername;
            return this;
        }

        /**
         * @description Requests permissions for the bot to send messages to the user
         * @return The current <<TelegramInlineKeyboardMarkupOptions.LoginConfigs>> instance
         */
        global LoginConfigs withWriteAccess() {
            this.requestWriteAccess = true;
            return this;
        }
    }

    /**
     * @description The builder-like class representing switch inline query configurations in the `Telegram` inline keyboard button.
     * Source: https://core.telegram.org/bots/api#switchinlinequerychosenchat
     */
    global class SwitchInlineQueryChatConfigs extends BotPayload {
        /**
         * @description The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted
         */
        global String query { get { return payload.getString('query'); } private set { payload.set('query', value); } }

        /**
         * @description `True` if private chats with users can be chosen
         */
        global Boolean allowUserChats {
            get { return payload.getBoolean('allow_user_chats'); }
            private set { payload.set('allow_user_chats', value); }
        }

        /**
         * @description `True` if private chats with bots can be chosen
         */
        global Boolean allowBotChats {
            get { return payload.getBoolean('allow_bot_chats'); }
            private set { payload.set('allow_bot_chats', value); }
        }

        /**
         * @description `True` if group and supergroup chats can be chosen
         */
        global Boolean allowGroupChats {
            get { return payload.getBoolean('allow_group_chats'); }
            private set { payload.set('allow_group_chats', value); }
        }

        /**
         * @description `True` if channel chats can be chosen
         */
        global Boolean allowChannelChats {
            get { return payload.getBoolean('allow_channel_chats'); }
            private set { payload.set('allow_channel_chats', value); }
        }

        /**
         * @description Creates an instance of the switch inline query configs with the provided query
         * @param query The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted
         */
        global SwitchInlineQueryChatConfigs(String query) {
            super();
            this.query = query;
        }

        public SwitchInlineQueryChatConfigs(BotJsonPayload payload) {
            super(payload);
        }

        /**
         * @description Defines if private chats with users can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs withUserChats() {
            allowUserChats = true;
            return this;
        }

        /**
         * @description Defines if private chats with bots can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs withBotChats() {
            allowBotChats = true;
            return this;
        }

        /**
         * @description Defines if group and supergroup chats can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs withGroupChats() {
            allowGroupChats = true;
            return this;
        }

        /**
         * @description Defines if channel chats can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs withChannelChats() {
            allowChannelChats = true;
            return this;
        }
    }
}
