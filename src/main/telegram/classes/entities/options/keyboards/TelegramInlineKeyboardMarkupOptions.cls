/**
 * @description Represents parameters wrapper for sending inline keyboard to the user via the `Telegram` bot service.
 * Source: https://core.telegram.org/bots/api#inlinekeyboardmarkup
 */
global class TelegramInlineKeyboardMarkupOptions extends BotPayload {
    /**
     * @description The matrix of inline keyboard buttons to be shown next to the message. Represents the list of button rows
     */
    global List<List<Button>> buttons {
        get { return (List<List<Button>>) payload.get('inline_keyboard'); }
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
         * @description Creates an instance of the button with the provided text
         * @param text The button text
         */
        global Button(String text) {
            super();
            payload.set('text', text);
        }

        /**
         * @description Sets the data to be sent in a callback query to the bot when the button is pressed. `1-64` bytes
         * @param data The data to be sent in a callback query
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button withCallbackData(String data) {
            payload.set('callback_data', data, true);
            return this;
        }

        /**
         * @description Sets the URL to be opened when the button is pressed
         * @param url The URL to be opened
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asUrl(String url) {
            payload.set('url', url, true);
            return this;
        }

        /**
         * @description Sets the login configs for when the button is pressed
         * @param loginConfigs The data to be sent in a callback query
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asLoginUrl(LoginConfigs loginConfigs) {
            payload.set('login_url', loginConfigs);
            return this;
        }

        /**
         * @description If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted
         * @param query The query to be pasted in another chat
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asSwitchInlineQuery(String query) {
            payload.set('switch_inline_query', query);
            return this;
        }

        /**
         * @description If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted
         * @param query The query to be pasted in another chat
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asSwitchInlineQueryCurrentChat(String query) {
            payload.set('switch_inline_query_current_chat', query);
            return this;
        }

        /**
         * @description If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field
         * @param chatConfigs The configs for the chat selection
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asSwitchInlineQueryChosenChat(SwitchInlineQueryChatConfigs chatConfigs) {
            payload.set('switch_inline_query_chosen_chat', chatConfigs);
            return this;
        }

        /**
         * @description Determines if the clicking on the button will launch a specified web app
         * @param webAppUrl The URL of the web app to be launched
         * @return The current <<TelegramInlineKeyboardMarkupOptions.Button>> instance
         */
        global Button asWebAppLauncher(String webAppUrl) {
            payload.set('web_app', new BotJsonPayload().set('url', webAppUrl));
            return this;
        }
    }

    /**
     * @description The builder-like class representing login button configurations in the `Telegram` inline keyboard.
     * Source: https://core.telegram.org/bots/api#loginurl
     */
    global class LoginConfigs extends BotPayload {
        /**
         * @description Creates an instance of the login configs with the provided service url
         * @param url An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed
         */
        global LoginConfigs(String url) {
            super();
            payload.set('url', url);
        }

        /**
         * @description Sets the new text of the button in forwarded messages
         * @param text The text to be replaced with
         * @return The current <<TelegramInlineKeyboardMarkupOptions.LoginConfigs>> instance
         */
        global LoginConfigs withForwardText(String text) {
            payload.set('forward_text', text, true);
            return this;
        }

        /**
         * @description Sets the username of a bot that will be used for the user authorization
         * @param botUsername The username of a bot that will be used for the user authorization
         * @return The current <<TelegramInlineKeyboardMarkupOptions.LoginConfigs>> instance
         */
        global LoginConfigs withAuthorizationBot(String botUsername) {
            payload.set('bot_username', botUsername, true);
            return this;
        }

        /**
         * @description Requests permissions for the bot to send messages to the user
         * @return The current <<TelegramInlineKeyboardMarkupOptions.LoginConfigs>> instance
         */
        global LoginConfigs withWriteAccess() {
            payload.set('request_write_access', true);
            return this;
        }
    }

    /**
     * @description The builder-like class representing switch inline query configurations in the `Telegram` inline keyboard button.
     * Source: https://core.telegram.org/bots/api#switchinlinequerychosenchat
     */
    global class SwitchInlineQueryChatConfigs extends BotPayload {
        /**
         * @description Creates an instance of the switch inline query configs with the provided query
         * @param query The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted
         */
        global SwitchInlineQueryChatConfigs(String query) {
            super();
            payload.set('query', query);
        }

        /**
         * @description Defines if private chats with users can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs allowUserChats() {
            payload.set('allow_user_chats', true);
            return this;
        }

        /**
         * @description Defines if private chats with bots can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs allowBotChats() {
            payload.set('allow_bot_chats', true);
            return this;
        }

        /**
         * @description Defines if group and supergroup chats can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs allowGroupChats() {
            payload.set('allow_group_chats', true);
            return this;
        }

        /**
         * @description Defines if channel chats can be chosen
         * @return The current <<TelegramInlineKeyboardMarkupOptions.SwitchInlineQueryChatConfigs>> instance
         */
        global SwitchInlineQueryChatConfigs allowChannelChats() {
            payload.set('allow_channel_chats', true);
            return this;
        }
    }
}
